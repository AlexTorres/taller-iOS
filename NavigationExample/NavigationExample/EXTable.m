//
//  EXTable.m
//  NavigationExample
//
//  Created by John Torres on 8/23/12.
//  Copyright (c) 2012 Wehostle. All rights reserved.
//

#import "EXTable.h"

@interface EXTable ()

@end

@implementation EXTable
@synthesize table_array;
@synthesize receivedData;

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

        // itunes api request
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:
                                                                        @"https://raw.github.com/gist/3791895/a50ddbe488e3bbe6fb9c61d7c16a6637d5d5bba8/contries.json"]];

    self.receivedData = [[NSMutableData alloc] init];

	[request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:30.0];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
																  delegate:self
														  startImmediately:YES];


	[connection start];
        // table_array = [[NSArray alloc] initWithObjects:@"New york",@"bogota",@"el paso",@"cali", nil];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    NSLog(@"test");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.table_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    NSDictionary * dic  = [table_array objectAtIndex:[indexPath row]];
    cell.textLabel.text = [dic objectForKey:@"country"];
    
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"go_to_detail" sender:self];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EXDetailViewController * detail     = [segue destinationViewController];
    NSIndexPath            * indexPath  = [self.tableView indexPathForSelectedRow];
    NSDictionary           * dic        = [table_array objectAtIndex:[indexPath row]];
    detail.city_dic                     = dic;

}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receivedData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    NSDictionary    * dic   = [self json_to_dict:receivedData];
    table_array             = [dic objectForKey:@"result"];
    [self.tableView reloadData];



    
}

- (NSDictionary *)json_to_dict :(NSData *)data {

	NSError  *error;

        // PARSE json response
    NSDictionary* json_nulls = [NSJSONSerialization
                                JSONObjectWithData:data //1
                                options:kNilOptions
                                error:&error];


    if (error) {
        [NSException raise:@"Parse Error" format:@"desc: %@", error];
    }

    return json_nulls;
    
}


@end
