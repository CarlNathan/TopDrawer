//
//  SourceModel.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Source.h"
#import "ContentItem.h"

@interface SourceModel : NSObject

@property (strong, nonatomic) NSArray *sourceList;
@property (strong, nonatomic) NSArray *sourceNames;

+ (void) objectsForSource: (Source *) source completion:(void(^)(NSArray *content))completion;

- (NSArray *) sourceTitles;

@end
