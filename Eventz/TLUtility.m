//
//  TLUtility.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import "TLUtility.h"
#import "TLEvent.h"

@implementation TLUtility

+(void) displayAlertWithMessage:(NSString*) mymessage andHeading:(NSString*) myheading
{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:myheading message:mymessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [msg show];
}

+(NSString*) convertDateToString:(NSDate*) date
{
    NSString *myDate = @"";
    
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"yyyy-MM-dd"];
    myDate = [myFormatter stringFromDate:date];
    
    return myDate;
}

+(UIImage*) getImageFromURL:(NSString*)imageURL
{
    if(![imageURL isKindOfClass:[NSNull class]] && imageURL != nil)
    {
        NSURL *imgUrl = [[NSURL alloc] initWithString:imageURL];
        NSData *imgData = [[NSData alloc] initWithContentsOfURL:imgUrl];
        UIImage *img = [[UIImage alloc] initWithData:imgData];
        return img;
    }
    else
        return [UIImage imageNamed:@"Logo.png"];
}

+(NSString*) getDayOfTheWeek
{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"c"];
    NSString *dayOfWeek = [myFormatter stringFromDate:currDate];
    return dayOfWeek;
}

+(NSString*) getWeekendStartDate
{
    NSString *startDate;
    
    NSDate *currDate = [NSDate date];
    
    /*
     NSString *dayOfWeek = [TLUtility getDayOfTheWeek];
     
     if([dayOfWeek isEqualToString:@"1"])
     startDate = [TLUtility convertDateToString:currDate];
     else
     {
     NSDate* weekendDate = [currDate dateByAddingTimeInterval:60*60*24*(7-[dayOfWeek integerValue])];
     startDate = [TLUtility convertDateToString:weekendDate];
     }
     */
    
    startDate = [TLUtility convertDateToString:currDate];
    
    return startDate;
}

+(NSString*) getWeekendStopDate
{
    NSString *stopDate;
    
    NSDate *currDate = [NSDate date];
    
    /*
     NSString *dayOfWeek = [self getDayOfTheWeek];
     
     if([dayOfWeek isEqualToString:@"1"])
     stopDate = [self convertDateToString:currDate];
     else
     {
     NSDate* weekendDate = [currDate dateByAddingTimeInterval:60*60*24*(8-[dayOfWeek integerValue])];
     stopDate = [self convertDateToString:weekendDate];
     }
     */
    
    stopDate = [TLUtility convertDateToString:[currDate dateByAddingTimeInterval:60*60*24*21]];
    
    return stopDate;
}

+ (NSMutableArray *) getEventsFromJSON:(NSData *)objectNotation
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil)
    {
        return nil;
    }
    
    NSMutableArray *events = [[NSMutableArray alloc] init];
    
    NSArray *myevents = [parsedObject valueForKey:@"events"];
    
    for (NSDictionary *groupDic in myevents)
    {
        TLEvent *event = [[TLEvent alloc] init];
        
        for (NSString *key in groupDic)
        {
            if ([event respondsToSelector:NSSelectorFromString(key)])
            {
                [event setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        
        [events addObject:event];
    }
    
    return events;
}

@end
