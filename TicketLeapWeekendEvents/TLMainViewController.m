//
//  TLViewController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLMainViewController.h"
#import "TLEventTabController.h"
#import "TLAPIWrapper.h"
#import "TLEvent.h"
#import "MBProgressHUD.h"

@interface TLMainViewController ()

@end

@implementation TLMainViewController
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    NSString *state;
    NSString *city;
    NSString *fullAddress;
    NSMutableArray *eventsFound;
}

@synthesize address = _address;
@synthesize appVersion = _appVersion;
@synthesize tagGestureRecognizer = _tagGestureRecognizer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Register tap gesture recognizer
    _tagGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:_tagGestureRecognizer];

    // Add version
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    
    _appVersion.text = [NSString stringWithFormat:@"Version %@", version];
    
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    // Get current location
    [self startLocationServices];
}

-(void) viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dismissKeyboard
{
    [_address resignFirstResponder];
}

-(void) startLocationServices
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

- (IBAction)searchClicked:(id)sender
{
    if(![state isEqualToString:@""] && ![city isEqualToString:@""])
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
        {
            // Do something...
            NSArray *items = [[self address].text componentsSeparatedByString:@","];
            
            if(items.count == 2)
            {
                city = [items[0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                state = [items[1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                eventsFound = [TLAPIWrapper searchByLocationInState:state inCity:city inPageNo:1];
                
                
                if(eventsFound.count > 0)
                    [self performSegueWithIdentifier:@"validSearchInitiated" sender:self];
                else
                    [TLUtility displayAlertWithMessage:@"There were no events for the location provided." andHeading:@"No Events Found!"];
            }
            else
            {
                [TLUtility displayAlertWithMessage:@"Location must be provided in the format '[City], [State]'" andHeading:@"Invalid input format."];
            }
            [MBProgressHUD hideHUDForView:self.view animated:YES];

        });
    }
    else
    {
        [TLUtility displayAlertWithMessage:@"Location must be provided." andHeading:@"Could not determine your search location..."];
    }
}

- (IBAction)logoClicked:(id)sender
{
    [TLUtility displayAlertWithMessage:[NSString stringWithFormat:@"Enter city and state or use your current location to find ticketleap events in the next two weeks (between %@ and %@).", [TLUtility getWeekendStartDate], [TLUtility getWeekendStopDate]] andHeading:@"About"];
}

- (IBAction)locationServicesRequested:(id)sender
{
    [self startLocationServices];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    // Stop Location Manager
    [locationManager stopUpdatingLocation];
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
    {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0)
        {
            placemark = [placemarks lastObject];
            fullAddress = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                           placemark.subThoroughfare, placemark.thoroughfare,
                           placemark.postalCode, placemark.locality,
                           placemark.administrativeArea,
                           placemark.country];
            
            state = placemark.administrativeArea;
            city = placemark.locality;
            _address.text = [NSString stringWithFormat:@"%@, %@", city, state];
        }
        else
        {
            _address.text = [NSString stringWithFormat:@"%@, %@", @"City", @"State"];
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

#pragma mark - before segue is executed

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"validSearchInitiated"])
    {
        // Get reference to the tab view controller
        TLEventTabController *tvc = [segue destinationViewController];
        
        // Set variables
        tvc.state = state;
        tvc.city = city;
        tvc.fullAddress = fullAddress;
        tvc.eventsFound = eventsFound;
    }
}

@end
