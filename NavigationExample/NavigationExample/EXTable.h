//
//  EXTable.h
//  NavigationExample
//
//  Created by John Torres on 8/23/12.
//  Copyright (c) 2012 Wehostle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXDetailViewController.h"

@interface EXTable : UITableViewController
{
     NSArray                * table_array;
     NSMutableData          * receivedData;

}

@property (strong)  NSArray                     * table_array;
@property (nonatomic,retain) NSMutableData      * receivedData;

@end
