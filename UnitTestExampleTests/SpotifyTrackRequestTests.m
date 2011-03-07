//
//  SpotifyTrackRequestTests.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "SpotifyTrackRequestTests.h"


@implementation SpotifyTrackRequestTests

- (void)testURLStringWithSearchTerm_SingleWord_ReturnsProperURLString {
    SpotifyTrackRequest *trackRequest = [[[SpotifyTrackRequest alloc] init] autorelease];
    NSString *urlString = [trackRequest URLStringWithSearchTerm:@"Beatles"];
    STAssertEqualObjects(@"http://ws.spotify.com/search/1/track.json?q=Beatles", urlString, nil);
}
@end
