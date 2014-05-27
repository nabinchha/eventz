//
//  TLAPIWrapper.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLAPIWrapper.h"
#import "TLEvent.h"
#import "TLUtility.h"
#import "MBProgressHUD.h"

@implementation TLAPIWrapper

+(NSString*) getURLBase
{
    return @"http://public-api.ticketleap.com/";
}

+(NSString*) getAPIKey
{
    return @"7238517239089673";
}

+(NSURL*) getURLToGetEventsByLocationUsingCountryCode:(NSString*)countryCode
                                            withState:(NSString*)state
                                             withCity:(NSString*)city
                                       eventDateAfter:(NSString*) dateAfter
                                      eventDateBefore:(NSString*) dateBefore
                                               inPage:(int) pageNo
{
    NSString *myRelativeUrl = [NSString stringWithFormat:@"events/by/location/%@/%@/%@?key=%@&dates_after=%@&dates_before=%@&page_num=%i&page_size=20", countryCode, state, city, [self getAPIKey], dateAfter, dateBefore, pageNo];
    myRelativeUrl = [myRelativeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *baseURL = [NSURL URLWithString:[self getURLBase]];
    NSURL *url = [NSURL URLWithString:myRelativeUrl relativeToURL:baseURL];
    NSURL *absURL = [url absoluteURL];
    
    return absURL;
}

+(NSData*) executeRequestWithURL:(NSURL*) url
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    // Fetch the JSON response
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
        
    // Make synchronous request
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error];
    
    return urlData;
    // Construct a String around the Data from the response
    //return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
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

+(NSArray*) searchByLocationInState:(NSString*) state
                             inCity:(NSString*)city
                           inPageNo:(int)pageNo
{
    NSString *startDate = [self getWeekendStartDate];
    NSString *stopDate = [self getWeekendStopDate];
    
    NSURL *url = [self getURLToGetEventsByLocationUsingCountryCode:@"USA" withState:state withCity:city eventDateAfter:startDate eventDateBefore:stopDate inPage:pageNo];
    
    NSData *responseData = [self executeRequestWithURL:url];
    
    NSArray *events = [self getEventsFromJSON:responseData];
    
    return events;
}

+(NSString*) getWeekendStartDate
{
    NSString *startDate;
    
    NSDate *currDate = [NSDate date];
    
    NSString *dayOfWeek = [TLUtility getDayOfTheWeek];
    
    if([dayOfWeek isEqualToString:@"1"])
        startDate = [TLUtility convertDateToString:currDate];
    else
    {
        NSDate* weekendDate = [currDate dateByAddingTimeInterval:60*60*24*(7-[dayOfWeek integerValue])];
        startDate = [TLUtility convertDateToString:weekendDate];
    }
    
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
    
    stopDate = [TLUtility convertDateToString:[currDate dateByAddingTimeInterval:60*60*24*14]];
    
    return stopDate;
}

@end
