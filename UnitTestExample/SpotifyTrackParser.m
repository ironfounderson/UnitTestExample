//
//  SpotifyTrackParser.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "SpotifyTrackParser.h"
#import "CJSONDeserializer.h"

@implementation SpotifyTrackParser

- (NSArray *)tracksFromJSONData:(NSData *)jsonData {
    NSDictionary *dict = [[CJSONDeserializer deserializer] 
                          deserializeAsDictionary:jsonData 
                          error:nil];
    NSArray *tracks = [dict objectForKey:@"tracks"];
    return tracks;
}

@end
