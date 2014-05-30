//
//  TLWebViewController.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *url;

@end
