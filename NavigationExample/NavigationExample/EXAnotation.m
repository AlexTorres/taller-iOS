//
//  EXAnotation.m
//  NavigationExample
//
//  Created by John Torres on 9/27/12.
//  Copyright (c) 2012 Wehostle. All rights reserved.
//

#import "EXAnotation.h"

@implementation EXAnotation
@synthesize latitude;
@synthesize longitude;
@synthesize titleAnotation;
@synthesize subTitleAnotation;
@synthesize image;

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude =[self.latitude floatValue];
    theCoordinate.longitude = [self.longitude floatValue];
    return theCoordinate;
}

- (NSString *)title
{
    return self.titleAnotation;
}

    // optional
- (NSString *)subtitle
{
    return self.subTitleAnotation;
}

@end
