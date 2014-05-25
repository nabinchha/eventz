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
@synthesize eventDescription = _eventDescription;
@synthesize eventImage = _eventImage;
@synthesize eventOfInterest = _eventOfInterest;


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
    
    _eventName.text = _eventOfInterest.name;
    _eventDescription.text = _eventOfInterest.description;
    _eventImage.image = [TLUtility getImageFromURL:_eventOfInterest.image_url_medium];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
