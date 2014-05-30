//
//  TLUtility.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLUtility : NSObject

+(void) displayAlertWithMessage:(NSString*) mymessage andHeading:(NSString*) myheading;

+(NSString*) convertDateToString:(NSDate*) date;

+(UIImage*) getImageFromURL:(NSString*)imageURL;

+(NSString*) getDayOfTheWeek;

+(NSString*) getSearchStartDate;

+(NSString*) getSearchStopDate;

+(NSMutableArray *) getEventsFromJSON:(NSData *)objectNotation;

@end
