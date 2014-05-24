//
//  TLUtility.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLUtility : NSObject

+(void) displayAlertWithMessage:(NSString*) mymessage andHeading:(NSString*) myheading;

+ (UIImage*)resizeImage:(UIImage*)image
           scaledToSize:(CGSize)newSize;

@end
