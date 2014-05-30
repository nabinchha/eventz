//
//  TLAPIWrapper.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import "TLAPIWrapper.h"
#import "TLEvent.h"
#import "TLUtility.h"
#import "MBProgressHUD.h"

@implementation TLAPIWrapper

#pragma mark - Private class methods

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
}

#pragma mark - Public class methods

+(NSArray*) searchByLocationInState:(NSString*) state
                             inCity:(NSString*)city
                           inPageNo:(int)pageNo
{
    NSString *startDate = [TLUtility getSearchStartDate];
    NSString *stopDate = [TLUtility getSearchStopDate];
    
    NSURL *url = [self getURLToGetEventsByLocationUsingCountryCode:@"USA" withState:state withCity:city eventDateAfter:startDate eventDateBefore:stopDate inPage:pageNo];
    
    NSData *responseData = [self executeRequestWithURL:url];
    
    NSArray *events = [TLUtility getEventsFromJSON:responseData];
    
    return events;
}

@end
