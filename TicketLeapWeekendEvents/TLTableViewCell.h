//
//  TLTableViewCell.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *eventName;

@property (strong, nonatomic) IBOutlet UILabel *eventAddress;

@property (strong, nonatomic) IBOutlet UIImageView *eventImage;

@end
