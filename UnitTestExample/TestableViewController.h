//
//  TestableViewController.h
//  UnitTestExample
//
//  Created by Robert Höglund on 3/1/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpotifyTrackRequest;

@interface TestableViewController : UITableViewController <UISearchBarDelegate> {
    
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

@end
