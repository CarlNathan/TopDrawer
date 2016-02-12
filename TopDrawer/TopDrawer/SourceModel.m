//
//  SourceModel.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SourceModel.h"
#import "DownloadManager.h"

#define NPR @"NPR"
#define CBC @"CBC"
#define WIRED @"Wired"

@implementation SourceModel

- (instancetype) init {
    self = [super init];
    if (self){
        Source *npr = [[Source alloc] initWithName:NPR RSSURL:@"http://www.npr.org/rss/rss.php?id=1001"];
        Source *cbc = [[Source alloc] initWithName:CBC RSSURL:@"http://www.cbc.ca/cmlink/rss-topstories"];
        Source *wired = [[Source alloc] initWithName:WIRED RSSURL:@"http://feeds.wired.com/wired/index"];
        
        _sourceList = @[npr, cbc, wired];
    }
    return self;
}

//- (instancetype) init{
//    self= [super init];
//    if (self) {
//        Source *newYorkTimes = [[Source alloc] initWithName:NEW_YORK_TIMES
//                                                      image:[UIImage imageNamed:@"nyt-t-logo.png"] apiURL:@"http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=58ac93c3598fde59d0ab4a2b08a5393f:11:74337065"];
//        
//        _sourceList = @[newYorkTimes];
//    }
//    return self;
//}

- (NSArray *) sourceTitles {
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    for (Source *source in self.sourceList) {
        [titles addObject:source.name];
    }
    return [titles copy];
}

+ (void) objectsForSource: (Source *) source completion:(void(^)(NSArray *content))completion{
    [DownloadManager rssContentForSource:source completion:^(NSArray *content){
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
        item.date = content[@"published_date"];
        item.urlString = content[@"url"];
        item.byLine = content[@"byline"];
        if (![content[@"media"] isKindOfClass: [NSString class]]) {
            item.imageURLString = content[@"media"][0][@"media-metadata"][0][@"url"];
        }
        [contentList addObject:item];
    }
    return [contentList copy];
}

@end
