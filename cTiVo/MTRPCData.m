//
//  MTRPCData.m
//  cTiVo
//
//  Created by Hugh Mackworth on 8/16/17.
//  Copyright © 2017 cTiVo. All rights reserved.
//

#import "MTRPCData.h"

@implementation MTRPCData
static NSString * kRPCID = @"RPCID";
static NSString * kRecordingID = @"recordingID";
static NSString * kContentId = @"contentID";
static NSString * kEpisodeNum  = @"episodeNum";
static NSString * kSeasonNum  = @"seasonNum";
static NSString * kGenre  = @"genre";
static NSString * kClipMetaData  = @"clipMetaDataId";
static NSString * kImageURL  = @"imageURL";
static NSString * kSeries = @"title";
static NSString * kSegments = @"segments";
static NSString * kEDL = @"EDLList";


- (instancetype)init {
    self = [super init];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [self init];
    if (self) {
		_rpcID = [coder decodeObjectOfClass:[NSString class] forKey:  kRPCID];
		_recordingID = [coder decodeObjectOfClass:[NSString class] forKey:  kRecordingID];
		_contentID = [coder decodeObjectOfClass:[NSString class] forKey:  kContentId];
        _episodeNum =  [coder decodeIntegerForKey: kEpisodeNum];
        _seasonNum =   [coder decodeIntegerForKey: kSeasonNum];
        _genre =       [coder decodeObjectOfClass:[NSString class] forKey:  kGenre];
		_clipMetaDataId = [coder decodeObjectOfClass:[NSString class] forKey:  kClipMetaData];
        _imageURL =    [coder decodeObjectOfClass:[NSString class] forKey:  kImageURL];
		_series =      [coder decodeObjectOfClass:[NSString class] forKey:  kSeries];
		_programSegments =      [coder decodeObjectOfClass:[NSArray class] forKey:  kSegments];
		_edlList =      [coder decodeObjectOfClass:[NSArray class] forKey:  kEDL];

    }
    return self;
}

+(BOOL) supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
     [coder encodeObject: _rpcID forKey:kRPCID];
     [coder encodeObject: _recordingID forKey:kRecordingID];
	 [coder encodeObject: _contentID forKey:kContentId];
     [coder encodeInteger:_episodeNum forKey:kEpisodeNum];
     [coder encodeInteger:_seasonNum forKey:kSeasonNum];
     [coder encodeObject:_genre forKey:kGenre];
	 [coder encodeObject: _clipMetaDataId forKey:kClipMetaData];
     [coder encodeObject:_imageURL forKey:kImageURL];
	 [coder encodeObject:_series forKey:kSeries];
	 [coder encodeObject:_programSegments forKey:kSegments];
	 [coder encodeObject:_edlList forKey:kEDL];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@: S%0.2dE%0.2d (%@); %@; @ %@", self.series, (int)self.seasonNum, (int)self.episodeNum, self.genre, self.recordingID, self.imageURL];
}


@end
