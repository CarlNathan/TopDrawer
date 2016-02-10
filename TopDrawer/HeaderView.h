//
//  HeaderView.h
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentItem.h"
#import "Source.h"

@interface HeaderView : UIView

+ (instancetype)headerWithContentItem: (ContentItem *) contentItem source: (Source *) source;

@end
