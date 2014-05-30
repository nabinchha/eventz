//
//  TLDetailViewController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import "TLDetailViewController.h"
#import "TLWebViewController.h"
#import "TLUtility.h"

@interface TLDetailViewController ()

@end

@implementation TLDetailViewController

@synthesize eventName = _eventName;
@synthesize eventInfo =_eventInfo;
@synthesize eventImage = _eventImage;
@synthesize eventOfInterest = _eventOfInterest;

@synthesize scrollView = _scrollView;

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
    
    _eventName.text = _eventOfInterest.name;
    
    NSString *address = [NSString stringWithFormat:@"%@\n%@\n%@, %@ %@", _eventOfInterest.venue_name, _eventOfInterest.venue_street, _eventOfInterest.venue_city, _eventOfInterest.venue_region_name, _eventOfInterest.venue_postal_code];
    
    _eventInfo.text = [NSString stringWithFormat:@"Event Address: \n\n%@\n\nStart Date: %@\nEnd Date: %@\n\n%@", address, _eventOfInterest.latest_start_local, _eventOfInterest.latest_end_local, _eventOfInterest.description ];
    
    _eventImage.image = [TLUtility getImageFromURL:_eventOfInterest.image_url_full];
    
    self.scrollView.contentSize = self.view.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buyTicketsPressed:(id)sender
{
    [self performSegueWithIdentifier:@"redirectToLink" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"redirectToLink"])
    {
        // Get reference to the tab view controller
        TLWebViewController *vc = [segue destinationViewController];
         
        // Set variables
        vc.url = _eventOfInterest.url;
    }
}

@end
