//
//  ContentItem.m
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ContentItem.h"

@implementation ContentItem

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
