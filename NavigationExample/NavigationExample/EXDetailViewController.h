//
//  EXDetailViewController.h
//  NavigationExample
//
//  Created by John Torres on 9/27/12.
//  Copyright (c) 2012 Wehostle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "EXAnotation.h"

@interface EXDetailViewController : UIViewController
{
    NSDictionary * city_dic;
    IBOutlet MKMapView *map_view;
    
    IBOutlet UISegmentedControl *type_map_control;
}
@property (strong) NSDictionary * city_dic;

@end
