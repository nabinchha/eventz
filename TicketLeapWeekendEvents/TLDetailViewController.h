//
//  TLDetailViewController.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/25/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLEvent.h"

@interface TLDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *eventName;

@property (strong, nonatomic) IBOutlet UIImageView *eventImage;

@property (strong, nonatomic) IBOutlet UITextView *eventDescription;

@property (strong, nonatomic) TLEvent *eventOfInterest;

@end
