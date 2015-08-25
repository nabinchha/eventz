//
//  TLEvent.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLEvent.h"

@implementation TLEvent

#pragma mark - Properties
@synthesize name = _name;
@synthesize description = _description;
@synthesize organization_name = _organization_name;

@synthesize image_url_full = _image_url_full;
@synthesize image_url_medium = _image_url_medium;
@synthesize image_url_search = _image_url_search;
@synthesize image_url_small = _image_url_small;

@synthesize latest_start_local = _local_start_local;
@synthesize latest_end_local = _latest_end_local;
@synthesize latest_end_utc = _latest_end_utc;
@synthesize latest_start_utc = _latest_start_utc;

@synthesize earliest_end_local = _earliest_end_local;
@synthesize earliest_end_utc = _earliest_end_utc;
@synthesize earliest_start_local = _earliest_start_local;
@synthesize earliest_start_utc = _earliest_start_utc;

@synthesize accent_color = _accent_color;

@synthesize venue_city = _venue_city;
@synthesize venue_country_code = _venue_country_code;
@synthesize venue_name = _venue_name;
@synthesize venue_postal_code = _venue_postal_code;
@synthesize venue_region_name = _venue_region_name;
@synthesize venue_street = _venue_street;
@synthesize venue_timezone = _venue_timezone;

@synthesize imageCache = _imageCache;

- (instancetype)init {
    self = [super init];
    if(self) { }
    return self;
}

@end
