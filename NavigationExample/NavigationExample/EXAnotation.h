//
//  EXAnotation.h
//  NavigationExample
//
//  Created by John Torres on 9/27/12.
//  Copyright (c) 2012 Wehostle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface EXAnotation : NSObject <MKAnnotation>
{
    NSNumber *latitude;
    NSNumber *longitude;
    NSString *title;
    NSString *subTitleAnotation;
    UIImage *image;


}
@property (strong) NSNumber *latitude;
@property (strong) NSNumber *longitude;
@property (strong) NSString *titleAnotation;
@property (strong) NSString *subTitleAnotation;
@property (strong) UIImage *image;


@end
