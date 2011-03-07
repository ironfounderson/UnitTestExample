//
//  SpotifyTrackRequest.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "SpotifyTrackRequest.h"
#import "SpotifyTrackURL.h"
#import "SpotifyTrackParser.h"
#import "ASIHTTPRequest.h"

@implementation SpotifyTrackRequest

@synthesize trackURL = trackURL_;
@synthesize trackParser = trackParser_;
@synthesize delegate;

- (void)dealloc {
    [trackURL_ release];
    [trackParser_ release];
    [super dealloc];
}

- (void)searchForTracks:(NSString *)text {
    NSURL *url = [NSURL URLWithString:[self.trackURL URLStringWithSearchTerm:text]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSData *responseData = [request responseData];
    NSArray *tracks = [self.trackParser tracksFromJSONData:responseData];
    [self.delegate trackRequest:self foundTracks:tracks];
}

- (SpotifyTrackURL *)trackURL {
    if (!trackURL_) {
        trackURL_ = [[SpotifyTrackURL alloc] init];
    }
    return trackURL_;
}

- (SpotifyTrackParser *)trackParser {
    if (!trackParser_) {
        trackParser_ = [[SpotifyTrackParser alloc] init];
    }
    return trackParser_;
}
@end
