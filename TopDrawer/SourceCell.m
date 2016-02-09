//
//  SourceCell.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SourceCell.h"

@implementation SourceCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}

- (void) layoutSubviews {
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.frame = self.contentView.frame;
}

@end
