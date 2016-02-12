//
//  ContentItem.m
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ContentItem.h"

@implementation ContentItem

//@property (strong, nonatomic) NSString *title;
//@property (strong, nonatomic) NSString *byLine;
//@property (strong, nonatomic) NSString *date;
//@property (strong, nonatomic) NSString *imageURLString;
//@property (strong, nonatomic) NSString *urlString;
//@property (assign, nonatomic) BOOL isSaved;

- (instancetype)initWithTitle: (NSString *) title byLine: (NSString *) byLine date: (NSString *) date imageUrlString: (NSString *) imageurlString urlString: (NSString *) urlString{
    self = [super init];
    if (self) {
        _title = title;
        _byLine = byLine;
        _date = date;
        _imageURLString = imageurlString;
        _urlString = urlString;
        _isSaved = NO;
    }
    return self;
}

+ (instancetype) contentItemFromSavedContentItem: (SavedContentItem *) item{
    ContentItem *newItem = [[ContentItem alloc] init];
    newItem.title = item.title;
    newItem.date = item.date;
    newItem.byLine = item.byLine;
    newItem.urlString = item.urlString;
    newItem.imageURLString = item.imageURLString;
    newItem.isSaved = YES;
    
    return newItem;
}


@end
