//
//  SourceCell.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SourceCell.h"

#define SOURCE_ICON_SIZE 20
#define GRADIENT_HEIGHT 100

@interface SourceCell ()

@end

@implementation SourceCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 5;
        
        [self.contentView addSubview:_imageView];

        
    }
    return self;
}

- (void) layoutSubviews {
    CGSize size = self.frame.size;
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.frame = CGRectMake(0, 0, SOURCE_ICON_SIZE, SOURCE_ICON_SIZE);
    self.imageView.center = self.contentView.center;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, size.width, GRADIENT_HEIGHT);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    
    [self.imageView.layer insertSublayer:gradient atIndex:0];
    [self.contentView.layer insertSublayer:gradient atIndex:0];
    
    
}

@end
