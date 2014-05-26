//
//  TLListTableViewController.m
//  TicketLeapWeekendEvents
//
//  Created by Nabin Mulepati on 5/23/14.
//  Copyright (c) 2014 TestApp. All rights reserved.
//

#import "TLListTableViewController.h"
#import "TLEventTabController.h"
#import "TLTableViewCell.h"
#import "TLEvent.h"
#import "TLAPIWrapper.h"
#import "TLUtility.h"
#import "MBProgressHUD.h"
#import "TLDetailViewController.h"

@interface TLListTableViewController ()
{
    TLEvent *eventOfInterestForDetailView;
}

@end

@implementation TLListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void) reloadTableView
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self reloadTableView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self getEvents].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLTableViewCell *cell = (TLTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TLCELL" forIndexPath:indexPath];
    
    TLEvent *eventOfInterest = [[self getEvents] objectAtIndex:indexPath.item];
    
    // Configure the cell...
    cell.eventName.text = eventOfInterest.name;
    cell.eventAddress.text = [NSString stringWithFormat:@"%@\n%@\n%@, %@ %@", eventOfInterest.venue_name, eventOfInterest.venue_street, eventOfInterest.venue_city, eventOfInterest.venue_region_name, eventOfInterest.venue_postal_code];
    
    if(eventOfInterest.imageCache == nil)
    {
        UIImage *img = [TLUtility getImageFromURL:eventOfInterest.image_url_search];
        //cell.eventImage.image = img;
        eventOfInterest.imageCache = img;
    }
    cell.eventImage.image = eventOfInterest.imageCache;//[UIImage imageNamed:@"mapIcon@2x.png"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    eventOfInterestForDetailView = [[self getEvents] objectAtIndex:indexPath.item];
    
    [self performSegueWithIdentifier:@"detailViewDemanded" sender:self];
    
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
        vc.eventOfInterest = eventOfInterestForDetailView;
    }
}


@end
