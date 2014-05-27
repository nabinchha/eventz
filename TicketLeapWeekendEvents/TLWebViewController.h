//
//  TLWebViewController.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/26/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *url;

@end
