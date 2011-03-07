//
//  SpotifyTrackRequest.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "SpotifyTrackRequest.h"


@implementation SpotifyTrackRequest

- (NSString *)URLStringWithSearchTerm:(NSString *)searchTerm {
    return [NSString stringWithFormat:@"http://ws.spotify.com/search/1/track.json?q=%@", 
            [searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end
