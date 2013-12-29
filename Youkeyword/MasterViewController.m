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
#import "YoukeywordService.h"

#define NAME "iosuser-xavi"
#define USERID "IOS-APP"

@interface MasterViewController ()

@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) YoukeywordService *youkeywordService;

@end

@implementation MasterViewController
@synthesize youkeywordService,data;

- (void)viewDidLoad
{
    [super viewDidLoad];

    youkeywordService = [[YoukeywordService alloc] init:self];
    NSString *text = self.textToAnalyze;
    [youkeywordService loadYoukeywordObjectsFromText:text];

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
