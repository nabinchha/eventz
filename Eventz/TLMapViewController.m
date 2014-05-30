//
//  TLMapViewController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  www.nabinmulepati.com
//  Copyright (c) 2014 Nabin Mulepati. All rights reserved.
//

#import "TLMapViewController.h"
#import "TLEventTabController.h"
#import "TLEvent.h"
#import "TLEventAnnotation.h"
#import "TLUtility.h"
#import "TLDetailViewController.h"
#import "MBProgressHUD.h"

@interface TLMapViewController ()
{
    TLEvent *eventOfInterestForDetailView;
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

-(NSMutableArray*) getEvents
{
    TLEventTabController *parent = (TLEventTabController*)[self parentViewController];
    return parent.eventsFound;
}

- (void) loadMoreEvents
{
    
}

-(void) loadAnnotations
{
    //events = ((TLEventTabController*)[self parentViewController]).eventsFound;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
    {
        // Do something...
        [self addEvents];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

-(void) addEvents
{
    for(TLEvent *event in [self getEvents])
    {
        NSString *location = [NSString stringWithFormat:@"%@, %@, %@ %@", event.venue_street, event.venue_city, event.venue_region_name, event.venue_postal_code];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:location
                     completionHandler:^(NSArray* placemarks, NSError* error)
        {
            if (placemarks && placemarks.count > 0)
            {
                CLPlacemark *topResult = [placemarks objectAtIndex:0];
                
                // Add an annotation
                //MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                TLEventAnnotation *ann = [[TLEventAnnotation alloc] initWithLocation:topResult.location.coordinate];
                ann.eventDetails = event;

                ann.title = event.name;
                ann.subtitle = [NSString stringWithFormat:@"%@", event.venue_name];
                [self.mapView addAnnotation:ann];
                
                MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(topResult.location.coordinate, 11000, 11000);
                [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
            }
        }
        ];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    //TLEventAnnotation *ann = (TLEventAnnotation*) annotation;
    
    // Try to dequeue an existing pin view first (code not shown).
    
    // If no pin view already exists, create a new one.
    MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc] init];
                                         // initWithAnnotation:annotation reuseIdentifier:BridgeAnnotationIdentifier];
    customPinView.pinColor = MKPinAnnotationColorPurple;
    customPinView.animatesDrop = YES;
    customPinView.canShowCallout = YES;
    
    // Because this is an iOS app, add the detail disclosure button to display details about the annotation in another view.
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    customPinView.rightCalloutAccessoryView = rightButton;
    
    // Add a custom image to the left side of the callout.
    /*
    UIImage *img = [TLUtility getImageFromURL:ann.eventDetails.image_url_search];
    UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:img];
    myCustomImage.contentMode = UIViewContentModeScaleAspectFill;
    customPinView.leftCalloutAccessoryView = myCustomImage;
     */
    
    return customPinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    eventOfInterestForDetailView = ((TLEventAnnotation*)view.annotation).eventDetails;
    NSLog(@"you touched the disclosure indicator");
    
    [self eventDetailDemanded];
}

-(void) eventDetailDemanded
{
    [self performSegueWithIdentifier:@"detailViewDemanded" sender:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    //self.mapView.showsUserLocation = YES;
}

-(void) viewWillAppear:(BOOL)animated
{
    [self loadAnnotations];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"detailViewDemanded"])
    {
        // Get reference to the tab view controller
        TLDetailViewController *vc = [segue destinationViewController];
        
        // Set variables
        //TLEvent *event = [[TLEvent alloc]init];
        vc.eventOfInterest = eventOfInterestForDetailView;
    }
}


@end
