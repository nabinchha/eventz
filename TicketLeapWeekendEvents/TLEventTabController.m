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

@interface TLEventTabController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moreResultsRequested:(id)sender
{
    UIViewController *vc = self.selectedViewController;
    
    if([vc isKindOfClass:[TLListTableViewController class]])
    {
        [((TLListTableViewController*)vc) loadMoreEvents];
    }
    else if([vc isKindOfClass:[TLMapViewController class]])
    {
    
    }
}

@end
