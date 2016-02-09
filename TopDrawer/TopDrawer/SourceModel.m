//
//  SourceModel.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SourceModel.h"
#import "DownloadManager.h"

#define NEW_YORK_TIMES @"New York Times"

@implementation SourceModel

- (instancetype) init{
    self= [super init];
    if (self) {
        Source *newYorkTimes = [[Source alloc] initWithName:NEW_YORK_TIMES
                                                      image:[UIImage imageNamed:@"nyt-t-logo.png"] apiURL:@"http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=58ac93c3598fde59d0ab4a2b08a5393f:11:74337065"];
        
        _sourceList = @[newYorkTimes];
    }
    return self;
}

+ (void) objectsForSource: (Source *) source completion:(void(^)(NSArray *content))completion{
    [DownloadManager contentForSource:source completion:^(NSDictionary *content){
        NSDictionary *jsonResults = content;
        
        NSArray *contentList = [NSArray new];
        if ([source.name isEqualToString:NEW_YORK_TIMES]) {
            contentList = [self parseNYTimesDataFromDictionary:jsonResults];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(contentList);
        });
    }];
    
}

+ (NSArray *) parseNYTimesDataFromDictionary: (NSDictionary *) jsonData{
    
    NSMutableArray *contentList = [NSMutableArray new];
    for (NSDictionary *content in jsonData[@"results"]) {
        ContentItem *item = [[ContentItem alloc] init];
        item.title = content[@"title"];
        item.urlString = content[@"url"];
        item.byLine = content[@"byline"];
        item.imageURLString = content[@"media-metadata"][1][@"url"];
        [contentList addObject:item];
    }
    return [contentList copy];
}

@end
