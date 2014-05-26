//
//  EventAnnotation.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/26/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLEventAnnotation.h"

@implementation TLEventAnnotation

@synthesize title;

@synthesize subtitle;

@synthesize coordinate;

@synthesize eventDetails;

- (id)initWithLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    if (self)
    {
        coordinate = coord;
    }
    return self;
}

@end
