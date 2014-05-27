//
//  TLUtility.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLUtility : NSObject

+(void) displayAlertWithMessage:(NSString*) mymessage andHeading:(NSString*) myheading;

+(UIImage*) getImageFromURL:(NSString*)imageURL;

+ (UIImage*)resizeImage:(UIImage*)image
           scaledToSize:(CGSize)newSize;

+(NSString*) getDayOfTheWeek;

+(NSString*) convertDateToString:(NSDate*) date;

@end
