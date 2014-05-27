//
//  TLViewController.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TLUtility.h"

@interface TLMainViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tagGestureRecognizer;
@property (strong, nonatomic) IBOutlet UILabel *appVersion;

@end
