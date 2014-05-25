//
//  TLMapViewController.h
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/25/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TLMapViewController : UIViewController<MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
