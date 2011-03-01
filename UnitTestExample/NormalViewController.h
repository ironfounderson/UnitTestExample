//
//  NormalViewController.h
//  UnitTestExample
//
//  Created by Robert Höglund on 3/1/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NormalViewController : UITableViewController {
    
}

@property (nonatomic, retain) NSArray *tracks;
@property (nonatomic, copy) NSString *notFoundMessage;
@end
