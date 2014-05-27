//
//  TLEventTabController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLEventTabController.h"
#import "TLListTableViewController.h"
#import "TLMapViewController.h"
#import "TLAPIWrapper.h"
#import "TLEvent.h"
#import "MBProgressHUD.h"

@interface TLEventTabController ()
{
    int pageNo;
}

@end

@implementation TLEventTabController

@synthesize city = _city;
@synthesize state = _state;
@synthesize country = _country;
@synthesize fullAddress = _fullAddress;
@synthesize eventsFound = _eventsFound;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pageNo = 0;
    
    self.tabBar.tintColor = [UIColor colorWithRed:0.878 green:0.2 blue:0.42 alpha:1];
    //[UIColor colorWithRed:238.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moreResultsRequested:(id)sender
{
    pageNo++;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
    {
        // Do something...
        NSMutableArray *moreData = [TLAPIWrapper searchByLocationInState:_state inCity:_city inPageNo:pageNo];
                       
        for (TLEvent *e in moreData)
        {
            [_eventsFound addObject:e];
        }
        
        
        UIViewController *vc = self.selectedViewController;
        
        if([vc isKindOfClass:[TLListTableViewController class]])
        {
            [((TLListTableViewController*)vc) reloadTableView];
        }
        else if([vc isKindOfClass:[TLMapViewController class]])
        {
            [((TLMapViewController*)vc) loadAnnotations];
        }
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });    
}

@end
