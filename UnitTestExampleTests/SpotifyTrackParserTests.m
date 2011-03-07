//
//  SpotifyTrackParserTests.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "SpotifyTrackParser.h"
#import "SpotifyTrack.h"

@interface SpotifyTrackParserTests : SenTestCase {
    SpotifyTrackParser *trackParser;
}

- (NSData *)dataFromBundle;

@end

@implementation SpotifyTrackParserTests

- (void)setUp {
    trackParser = [[SpotifyTrackParser alloc] init];
}

- (void)tearDown {
    [trackParser release];
}


- (void)test_tracksFromJSONData_DataWith100Tracks_ResultContains100Tracks {
    NSArray *tracks = [trackParser tracksFromJSONData:[self dataFromBundle]];
    STAssertEquals((NSUInteger)100, tracks.count, nil);
}

- (void)test_tracksFromJSONData_FirstTRackIHasCorrectData {
    NSArray *tracks = [trackParser tracksFromJSONData:[self dataFromBundle]];
    SpotifyTrack *track = [tracks objectAtIndex:0];
    STAssertEqualObjects(@"Here Comes The Sun", track.title, nil);
    STAssertEqualObjects(@"A Tribute to The Beatles Vol. 1", track.album, nil);
    STAssertEqualObjects(@"The Beatles Tribute Band", track.artist, nil);
}

- (void)test_canReadDataFromBundle {
    STAssertNotNil([self dataFromBundle], nil);
}

- (NSData *)dataFromBundle {
    NSString *path = [[NSBundle bundleForClass:[self class]] 
                      pathForResource:@"beatles" 
                      ofType:@"json"];
    NSLog(@"%@", path);
    return [NSData dataWithContentsOfFile:path];
}

@end
