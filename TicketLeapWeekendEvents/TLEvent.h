//
//  TLEvent.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLEvent : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *organization_name;

@property (strong, nonatomic) NSString *image_url_full;
@property (strong, nonatomic) NSString *image_url_medium;
@property (strong, nonatomic) NSString *image_url_small;
@property (strong, nonatomic) NSString *image_url_search;

@property (strong, nonatomic) NSString *latest_start_utc;
@property (strong, nonatomic) NSString *latest_start_local;
@property (strong, nonatomic) NSString *latest_end_utc;
@property (strong, nonatomic) NSString *latest_end_local;

@property (strong, nonatomic) NSString *earliest_start_utc;
@property (strong, nonatomic) NSString *earliest_start_local;
@property (strong, nonatomic) NSString *earliest_end_utc;
@property (strong, nonatomic) NSString *earliest_end_local;

@property (strong, nonatomic) NSString *accent_color;

@property (strong, nonatomic) NSString *venue_name;
@property (strong, nonatomic) NSString *venue_street;
@property (strong, nonatomic) NSString *venue_city;
@property (strong, nonatomic) NSString *venue_region_name;
@property (strong, nonatomic) NSString *venue_timezone;
@property (strong, nonatomic) NSString *venue_postal_code;
@property (strong, nonatomic) NSString *venue_country_code;

@property (strong, nonatomic) NSString *url;

@end
