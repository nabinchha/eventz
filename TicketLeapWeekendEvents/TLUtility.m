//
//  TLUtility.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLUtility.h"

@implementation TLUtility

+(void) displayAlertWithMessage:(NSString*) mymessage andHeading:(NSString*) myheading
{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:myheading message:mymessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [msg show];
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

+ (UIImage*)resizeImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(NSString*) getDayOfTheWeek
{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"c"];
    NSString *dayOfWeek = [myFormatter stringFromDate:currDate];
    return dayOfWeek;
}

+(NSString*) convertDateToString:(NSDate*) date
{
    NSString *myDate = @"";
    
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"yyyy-MM-dd"];
    myDate = [myFormatter stringFromDate:date];
    
    return myDate;
}

@end
