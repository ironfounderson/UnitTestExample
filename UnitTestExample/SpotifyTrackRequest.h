//
//  SpotifyTrackRequest.h
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpotifyTrackRequest : NSObject {
    
}

- (NSString *)URLStringWithSearchTerm:(NSString *)searchTerm;
- (void)searchForTracks:(NSString *)text;
@end
