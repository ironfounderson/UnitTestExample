//
//  SpotifyTrackRequest.h
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpotifyTrackURL;
@class SpotifyTrackParser;

@interface SpotifyTrackRequest : NSObject {
    
}

@property (nonatomic, retain) SpotifyTrackURL *trackURL;
@property (nonatomic, retain) SpotifyTrackParser *trackParser;

- (void)searchForTracks:(NSString *)text;

@end
