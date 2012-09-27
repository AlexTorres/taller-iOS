//
//  EXDetailViewController.m
//  NavigationExample
//
//  Created by John Torres on 9/27/12.
//  Copyright (c) 2012 Wehostle. All rights reserved.
//

#import "EXDetailViewController.h"

@interface EXDetailViewController ()

@end

@implementation EXDetailViewController
@synthesize city_dic;

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

    [self setTitle:[self.city_dic objectForKey:@"country"]];

    CLLocationCoordinate2D centerCoord;
    centerCoord.latitude            = [[self.city_dic objectForKey:@"latitude"] floatValue];
    centerCoord.longitude           = [[self.city_dic objectForKey:@"longitude"] floatValue];

    EXAnotation *anotation          = [[EXAnotation alloc] init];
    anotation.longitude             = [[NSNumber alloc] initWithFloat:[[self.city_dic objectForKey:@"longitude"] floatValue]];
    anotation.latitude              = [[NSNumber alloc] initWithFloat:[[self.city_dic objectForKey:@"latitude"] floatValue]];
    anotation.titleAnotation        = [self.city_dic objectForKey:@"country"];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(centerCoord, 200, 200);

    [map_view addAnnotation:anotation];

    [map_view setRegion:region animated:YES];




}
- (IBAction)type_of_map:(id)sender {
    switch (type_map_control.selectedSegmentIndex) {
        case 0:
            map_view.mapType =MKMapTypeStandard;
            break;
        case 1:
            map_view.mapType =MKMapTypeSatellite;
            break;
        case 2:
            map_view.mapType =MKMapTypeHybrid;
            break;

        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    map_view = nil;
    type_map_control = nil;
    [super viewDidUnload];
}
@end
