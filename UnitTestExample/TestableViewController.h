//
//  TestableViewController.h
//  UnitTestExample
//
//  Created by Robert Höglund on 3/1/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpotifyTrackRequest.h"

@interface TestableViewController : UITableViewController <UISearchBarDelegate> {
    
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (retain) SpotifyTrackRequest *trackRequest;

@end
