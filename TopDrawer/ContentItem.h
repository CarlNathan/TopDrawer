//
//  ContentItem.h
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedContentItem.h"

@interface ContentItem : UIView

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *byLine;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *imageURLString;
@property (strong, nonatomic) NSString *urlString;
@property (assign, nonatomic) BOOL isSaved;

- (instancetype)initWithTitle: (NSString *) title byLine: (NSString *) byLine date: (NSString *) date imageUrlString: (NSString *) imageurlString urlString: (NSString *) urlString;

+ (instancetype) contentItemFromSavedContentItem: (SavedContentItem *) item;

@end
