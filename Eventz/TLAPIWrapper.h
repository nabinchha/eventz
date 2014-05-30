//
//  TLAPIWrapper.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLAPIWrapper : NSObject

+(NSMutableArray*) searchByLocationInState:(NSString*) state
                             inCity:(NSString*)city
                           inPageNo:(int)pageNo;

@end
