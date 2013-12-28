//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import "YKNotesListViewController.h"

#import "YKAppDelegate.h"
#import "YKNote.h"
#import "YKNoteEditorViewController.h"

@interface YKNotesListViewController ()

@end

@implementation YKNotesListViewController

- (NSMutableArray*) notes
{
    YKAppDelegate *appDelegate = (YKAppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.notes;
}

- (void)viewDidAppear:(BOOL)animated {
    // Whenever this view controller appears, reload the table. This allows it to reflect any changes
    // made whilst editing notes.
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self notes].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    YKNote* note = [self notes][indexPath.row];
    cell.textLabel.text = note.title;
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    YKNoteEditorViewController* editorVC = (YKNoteEditorViewController*)segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"CellSelected"]) {
        // if the cell selected segue was fired, edit the selected note
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editorVC.note = [self notes][path.row];
    }

    if ([segue.identifier isEqualToString:@"AddNewNote"]) {
        // if the add new note segue was fired, create a new note, and edit it
        editorVC.note = [YKNote noteWithText:@" "];
        // also, add this note to the collection
        [[self notes] addObject:editorVC.note];
    }
}


@end
