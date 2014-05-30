//
//  TLTableViewCell.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *eventName;

@property (strong, nonatomic) IBOutlet UILabel *eventAddress;

@property (strong, nonatomic) IBOutlet UIImageView *eventImage;

@end
