//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import "YKNoteEditorViewController.h"

#import "YKNote.h"
#import "MasterViewController.h"

@interface YKNoteEditorViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation YKNoteEditorViewController
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.textView.text = self.note.contents;
    self.textView.delegate = self;
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    // copy the updated note text to the underlying model.
    _note.contents = textView.text;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"loadKeywords"]){
        MasterViewController *controller = (MasterViewController *)segue.destinationViewController;
        controller.textToAnalyze = self.textView.text ;
    }
}

@end