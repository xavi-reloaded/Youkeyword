//
//  MasterViewController.m
//  CoffeeShop
//
//  Created by Scott McAlister on 5/1/12.
//  Copyright (c) 2012 4 Arrows Media. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "MasterViewController.h"
#import "Keywords.h"
#import "VenueCell.h"

#define NAME "iosuser-xavi"
#define USERID "IOS-APP"

@interface MasterViewController ()

@property (strong, nonatomic) NSArray *data;

@end

@implementation MasterViewController
@synthesize data;

- (void)viewDidLoad
{
    [super viewDidLoad];

    RKURL *baseURL = [RKURL URLWithBaseURLString:@"http://localhost:8080/PLNEngine/service"];
    RKObjectManager *objectManager = [RKObjectManager objectManagerWithBaseURL:baseURL];
    objectManager.client.baseURL = baseURL;


    RKObjectMapping *keywordMapping = [RKObjectMapping mappingForClass:[Keywords class]];
    [keywordMapping mapKeyPathsToAttributes:@"lemma", @"lemma", @"namedEntity", @"namedEntity", nil];
    [objectManager.mappingProvider setMapping:keywordMapping forKeyPath:@""];

//    RKObjectMapping *feedMapping = [RKObjectMapping mappingForClass:[SIFeed class]];
//    [feedMapping mapKeyPathsToAttributes:@"feeds", nil];
//    [keywordMapping mapRelationship:@"feeds" withMapping:feedMapping];
//    [objectManager.mappingProvider setMapping:feedMapping forKeyPath:@"feeds"];
//
//    RKObjectMapping *venueMapping = [RKObjectMapping mappingForClass:[Venue class]];
//    [venueMapping mapKeyPathsToAttributes:@"id", @"venueID", @"name", @"name", nil];
//    [objectManager.mappingProvider setMapping:venueMapping forKeyPath:@"response.venues"];
//
//    RKObjectMapping *locationMapping = [RKObjectMapping mappingForClass:[Location class]];
//    [locationMapping mapKeyPathsToAttributes:@"address", @"address", @"city", @"city", @"country", @"country", @"crossStreet", @"crossStreet", @"postalCode", @"postalCode", @"state", @"state", @"distance", @"distance", @"lat", @"lat", @"lng", @"lng", nil];
//
//    [venueMapping mapRelationship:@"location" withMapping:locationMapping];
//    [objectManager.mappingProvider setMapping:locationMapping forKeyPath:@"location"];
//
//    RKObjectMapping *statsMapping = [RKObjectMapping mappingForClass:[Stats class]];
//    [statsMapping mapKeyPathsToAttributes:@"checkinsCount", @"checkins", @"tipCount", @"tips", @"usersCount", @"users", nil];
//
//    [venueMapping mapRelationship:@"stats" withMapping:statsMapping];
//    [objectManager.mappingProvider setMapping:statsMapping forKeyPath:@"stats"];

    [self sendRequest];

}

- (void)sendRequest
{
    NSString *text = @"to study in the MIT with Obama is a very nice thing, Genesis is Wonderfull";
    NSString *language = @"en";
    NSString *name = [NSString stringWithUTF8String:NAME];
    NSString *userId = [NSString stringWithUTF8String:USERID];


    NSDictionary *queryParams;
    queryParams = [NSDictionary dictionaryWithObjectsAndKeys:text, @"w", language, @"l", name, @"name", userId, @"id", nil];
    RKObjectManager *objectManager = [RKObjectManager sharedManager];

    RKURL *URL = [RKURL URLWithBaseURL:[objectManager baseURL] resourcePath:@"/plnKeywordService" queryParameters:queryParams];

    NSLog(@"URL: %@", [URL absoluteString]);
    NSLog(@"resourcePath: %@", [URL resourcePath]);
    NSLog(@"query: %@", [URL query]);

    [objectManager loadObjectsAtResourcePath:[NSString stringWithFormat:@"%@?%@", [URL resourcePath], [URL query]] delegate:self];

    ///////////////////////////

    ///////////////////////////
}


#pragma mark - RKObjectLoaderDelegate

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    NSLog(@"\n\nresponse code: %d", [response statusCode]);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"\n\nError: %@", [error localizedDescription]);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    NSLog(@"\n\nobjects[%d]", [objects count]);
    data = objects;

    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numOfRows: %d", data.count);
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VenueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VenueCell"];
    Keywords *keywords = [data objectAtIndex:indexPath.row];
    cell.nameLabel.text = keywords.lemma;
    NSString *namedEntity = ([keywords.namedEntity isEqualToString:@"NOT_AN_ENTITY"]) ? @"" : keywords.namedEntity;
    cell.namedEntity.text = namedEntity;
    return cell;
}

@end
