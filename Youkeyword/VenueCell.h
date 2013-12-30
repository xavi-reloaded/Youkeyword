//
//  VenueCell.h
//  CoffeeShop
//
//  Created by Scott McAlister on 5/16/12.
//  Copyright (c) 2012 4 Arrows Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *namedEntity;
@property (strong, nonatomic) IBOutlet UILabel *checkinsLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoriesLabel;
@property (strong, nonatomic) IBOutlet UILabel *meaningsLabel;
@property (strong, nonatomic) IBOutlet UILabel *searchResponseLabel;

@end
