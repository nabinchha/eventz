//
//  TLDetailViewController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/25/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLDetailViewController.h"
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
    
    _eventInfo.text = [NSString stringWithFormat:@"Event Address: \n\n%@\nStart Date: %@\nEnd Date: %@\n\n%@", address, _eventOfInterest.earliest_start_utc, _eventOfInterest.earliest_end_utc, _eventOfInterest.description ];
    
    _eventImage.image = [TLUtility getImageFromURL:_eventOfInterest.image_url_medium];
    
    self.scrollView.contentSize = self.view.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
