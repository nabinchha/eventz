//
//  TLUtility.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLUtility.h"

@implementation TLUtility

+(void) displayAlertWithMessage:(NSString*) mymessage andHeading:(NSString*) myheading
{
    UIAlertView *msg = [[UIAlertView alloc] initWithTitle:myheading message:mymessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [msg show];
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

@end
