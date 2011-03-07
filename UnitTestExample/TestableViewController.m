//
//  TestableViewController.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/1/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "TestableViewController.h"
#import "SpotifyTrack.h"

@implementation TestableViewController

@synthesize searchBar = searchBar_;
@synthesize trackRequest = trackRequest_;
@synthesize tracks = tracks_;

- (void)dealloc {
    [searchBar_ release];
    [trackRequest_ release];
    [tracks_ release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    assert(self.tableView.dataSource == self);
    assert(self.tableView.delegate == self);
    assert(self.searchBar.delegate == self);
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.searchBar = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    SpotifyTrack *track = [self.tracks objectAtIndex:indexPath.row];
    cell.textLabel.text = track.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", track.artist, track.album];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.trackRequest searchForTracks:searchBar.text];
}

- (SpotifyTrackRequest *)trackRequest {
    if (!trackRequest_) {
        trackRequest_ = [[SpotifyTrackRequest alloc] init];
        trackRequest_.delegate = self;
    }
    return trackRequest_;
}

- (void)trackRequest:(SpotifyTrackRequest *)trackRequest foundTracks:(NSArray *)tracks {
    [self.searchBar resignFirstResponder];
    self.tracks = tracks;
    [self.tableView reloadData];
}

@end
