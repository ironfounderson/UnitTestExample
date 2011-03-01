//
//  NormalViewController.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/1/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "NormalViewController.h"
#import "ASIHTTPRequest.h"
#import "CJSONDeserializer.h"


@implementation NormalViewController

@synthesize tracks = tracks_;

- (void)dealloc {
    [tracks_ release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *track = [self.tracks objectAtIndex:indexPath.row];
    cell.textLabel.text = [track objectForKey:@"name"];
    
    NSDictionary *album = [track objectForKey:@"album"];
    NSString *albumName = [album objectForKey:@"name"];
    
    NSArray *artists = [track objectForKey:@"artists"];
    if (artists.count == 0) {
        cell.detailTextLabel.text = albumName;
    }
    else {
        NSDictionary *artist = [artists objectAtIndex:0];
        NSString *artistName = [artist objectForKey:@"name"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", artistName, albumName];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *urlString = 
    [NSString stringWithFormat:@"http://ws.spotify.com/search/1/track.json?q=%@", 
     [searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:urlString];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    __block __typeof__(self) blockSelf = self;
    [request setCompletionBlock:^ {
        NSDictionary *dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:request.responseData error:nil];
        self.tracks = [dict objectForKey:@"tracks"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [blockSelf.tableView reloadData];
        });
    }];
    [request startAsynchronous];
    [searchBar resignFirstResponder];
}
@end
