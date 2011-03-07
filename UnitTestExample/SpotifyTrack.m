//
//  SpotifyTrack.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "SpotifyTrack.h"


@implementation SpotifyTrack

@synthesize title;
@synthesize artist;
@synthesize album;

- (void)dealloc {
    [title release];
    [artist release];
    [album release];
    [super dealloc];
}
@end
