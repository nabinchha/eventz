//
//  TLEventTabController.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLEventTabController : UITabBarController

@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *fullAddress;
@property (strong, nonatomic) NSMutableArray *eventsFound;

- (IBAction)moreResultsRequested:(id)sender;

@end
