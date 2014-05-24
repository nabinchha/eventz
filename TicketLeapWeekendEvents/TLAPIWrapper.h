//
//  TLAPIWrapper.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLAPIWrapper : NSObject

+(NSArray*) searchByLocationInState:(NSString*) state inCity:(NSString*)city;

@end
