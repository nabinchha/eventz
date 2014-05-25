//
//  TLMapViewController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/25/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLMapViewController.h"
#import "TLEventTabController.h"
#import "TLEvent.h"

@interface TLMapViewController ()
{
    NSMutableArray *events;
}

@end

@implementation TLMapViewController

@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) addEvents
{
    for(TLEvent *event in events)
    {
        NSString *location = [NSString stringWithFormat:@"%@, %@, %@ %@", event.venue_street, event.venue_city, event.venue_region_name, event.venue_postal_code];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:location
                     completionHandler:^(NSArray* placemarks, NSError* error)
        {
            if (placemarks && placemarks.count > 0)
            {
                CLPlacemark *topResult = [placemarks objectAtIndex:0];
                MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
            
                //placemark.title = event.name;
                
                MKCoordinateRegion region = self.mapView.region;
                region.center = [(CLCircularRegion *)placemark.region center];
                region.span.longitudeDelta /= 8.0;
                region.span.latitudeDelta /= 8.0;
                
                [self.mapView setRegion:region animated:YES];
                [self.mapView addAnnotation:placemark];
            }
        }
        ];
    }
    /*
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(.coordinate, 800, 800);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
    */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    //_mapView.showsUserLocation = YES;
    
    events = ((TLEventTabController*)[self parentViewController]).eventsFound;
    
    [self addEvents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
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
