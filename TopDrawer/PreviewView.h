//
//  PreviewView.h
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedContentItem.h"

@interface PreviewView : UIView

@property (strong, nonatomic) SavedContentItem *contentItem;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *imageView;


+ (instancetype) emptyPreviewView;

@end
