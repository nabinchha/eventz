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
#import "TLUtility.h"

@interface TLListTableViewController ()
{
    NSArray *events;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    events = ((TLEventTabController*)[self parentViewController]).eventsFound;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return events.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLTableViewCell *cell = (TLTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"TLCELL" forIndexPath:indexPath];
    
    TLEvent *eventOfInterest = [events objectAtIndex:indexPath.item];
    
    // Configure the cell...
    cell.eventName.text = eventOfInterest.name;
    cell.eventAddress.text = [NSString stringWithFormat:@"%@\n%@\n%@, %@ %@", eventOfInterest.venue_name, eventOfInterest.venue_street, eventOfInterest.venue_city, eventOfInterest.venue_region_name, eventOfInterest.venue_postal_code];
    
    if(![eventOfInterest.image_url_small isKindOfClass:[NSNull class]])
    {
        NSURL *imgUrl = [[NSURL alloc] initWithString:eventOfInterest.image_url_search];
        NSData *imgData = [[NSData alloc] initWithContentsOfURL:imgUrl];
        UIImage *img = [[UIImage alloc] initWithData:imgData];
        
        cell.eventImage.image = img;//[UIImage imageNamed:@"mapIcon@2x.png"];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
