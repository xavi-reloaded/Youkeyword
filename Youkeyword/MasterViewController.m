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
#import "YKMeanings.h"

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

    RKURL *baseURL = [RKURL URLWithBaseURLString:@"http://54.213.142.98:8080/PLNEngine/service"];
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
    NSString *text = self.textToAnalyze; //@"Luís Alves de Lima e Silva, Duke of Caxias (1803–80) was an army officer, politician and monarchist of the Empire of Brazil. politician and monarchist of the Empire of Brazil. He fought against Portugal during the Brazilian War for Independence, and thereafter remained loyal to the emperors Dom Pedro I and his son, Dom Pedro II (to whom he became a friend and instructor in swordsmanship and horsemanship). He commanded forces that put down uprisings from 1839 to 1845, including the Balaiada and the War of the Ragamuffins. He led the Brazilian army to victory in the Platine War against the Argentine Confederation and in the Paraguayan War against the Paraguayans. Caxias was promoted to army marshal, the army's highest rank, and was the only person made a duke during the 58-year reign of Pedro II. A member of the Reactionary Party (which became the Conservative Party), he was elected senator in 1846 and served as president (prime minister) of the Council of Ministers three times. Historians have regarded Caxias in a positive light and several have ranked him as the greatest Brazilian military officer. He has been designated as the army's protector, and is regarded as the most important figure in its tradition.";
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
    cell.meaningsLabel.text = keywords.meanings;
    cell.categoriesLabel.text = keywords.categories;
    return cell;
}

@end
