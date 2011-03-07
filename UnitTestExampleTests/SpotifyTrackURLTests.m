//
//  SpotifyTrackURLTests.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "SpotifyTrackURL.h"

@interface SpotifyTrackURLTests : SenTestCase {
    SpotifyTrackURL *trackURL;
}

@end


@implementation SpotifyTrackURLTests

- (void)setUp {
    trackURL = [[SpotifyTrackURL alloc] init];
}

- (void)tearDown {
    [trackURL release];
}

- (void)test_URLStringWithSearchTerm_SingleWord_ReturnsProperURLString {
    NSString *urlString = [trackURL URLStringWithSearchTerm:@"Beatles"];
    STAssertEqualObjects(@"http://ws.spotify.com/search/1/track.json?q=Beatles", 
                         urlString, nil);
}

- (void)test_URLStringWithSearchTerm_WordsWithSpace_ReturnsProperURLString {
    NSString *urlString = [trackURL URLStringWithSearchTerm:@"The Beatles"];
    STAssertEqualObjects(@"http://ws.spotify.com/search/1/track.json?q=The%20Beatles", 
                         urlString, nil);
}


@end
