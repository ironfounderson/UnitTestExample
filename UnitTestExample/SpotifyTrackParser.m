//
//  SpotifyTrackParser.m
//  UnitTestExample
//
//  Created by Robert Höglund on 3/7/11.
//  Copyright 2011 rhoglund coding. All rights reserved.
//

#import "SpotifyTrackParser.h"
#import "CJSONDeserializer.h"
#import "SpotifyTrack.h"

#define SPOTIFY_TRACKS_KEY @"tracks"
#define SPOTIFY_TRACK_NAME_KEY @"name"
#define SPOTIFY_TRACK_ALBUM_KEY @"album"
#define SPOTIFY_TRACK_ARTISTS_KEY @"artists"

@implementation SpotifyTrackParser

- (SpotifyTrack *)trackFromDictionary:(NSDictionary *)trackDict {
    SpotifyTrack *track = [[SpotifyTrack alloc] init];
    track.title = [trackDict objectForKey:SPOTIFY_TRACK_NAME_KEY];
    
    NSDictionary *album = [trackDict objectForKey:SPOTIFY_TRACK_ALBUM_KEY];
    track.album = [album objectForKey:SPOTIFY_TRACK_NAME_KEY];
    
    NSArray *artists = [trackDict objectForKey:SPOTIFY_TRACK_ARTISTS_KEY];
    if (artists.count > 0) {
        NSDictionary *artist = [artists objectAtIndex:0];
        track.artist = [artist objectForKey:SPOTIFY_TRACK_NAME_KEY];
    }

    return [track autorelease];
}

- (NSArray *)tracksFromJSONData:(NSData *)jsonData {
    NSDictionary *dict = [[CJSONDeserializer deserializer] 
                          deserializeAsDictionary:jsonData 
                          error:nil];
    NSArray *tracks = [dict objectForKey:SPOTIFY_TRACKS_KEY];
    NSMutableArray *spotifyTracks = [NSMutableArray array];
    for (NSDictionary *trackDict in tracks) {
        SpotifyTrack *spotifyTrack = [self trackFromDictionary:trackDict];
        [spotifyTracks addObject:spotifyTrack];
    }
    return spotifyTracks;
}

@end
