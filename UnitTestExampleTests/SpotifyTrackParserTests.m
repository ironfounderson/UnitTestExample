//
//  SpotifyTrackParserTests.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "SpotifyTrackParser.h"

@interface SpotifyTrackParserTests : SenTestCase {
    SpotifyTrackParser *trackParser;
}

- (NSData *)dataFromFile:(NSString *)filename;

@end

@implementation SpotifyTrackParserTests

- (void)setUp {
    trackParser = [[SpotifyTrackParser alloc] init];
}

- (void)tearDown {
    [trackParser release];
}


- (void)test_tracksForJSONData_DataWith100Tracks_ResultContains100Tracks {
    NSArray *tracks = [trackParser tracksFromJSONData:[self dataFromFile:@"beatles"]];
    STAssertEquals((NSUInteger)100, tracks.count, nil);
}

- (void)test_dataFromFile_FileIsPresent_CanReadFile {
    STAssertNotNil([self dataFromFile:@"beatles"], nil);
}

- (NSData *)dataFromFile:(NSString *)filename {
    NSString *path = [[NSBundle bundleForClass:[self class]] 
                      pathForResource:filename 
                      ofType:@"json"];
    NSLog(@"%@", path);
    return [NSData dataWithContentsOfFile:path];
}

@end
