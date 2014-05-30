//
//  EventAnnotation.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/26/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TLEvent.h"

@interface TLEventAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;
@property (nonatomic, strong) TLEvent* eventDetails;

@end
