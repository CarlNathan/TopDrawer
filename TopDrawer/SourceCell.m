//
//  SourceCell.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SourceCell.h"
#import "ColorPallete.h"

#define SOURCE_ICON_SIZE 20
#define GRADIENT_HEIGHT 50

@interface SourceCell ()

@end

@implementation SourceCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 5;
        self.contentView.backgroundColor = [ColorPallete defaultColorPallete].primaryColor;
        [self.contentView addSubview:_imageView];

        
    }
    return self;
}

- (void) layoutSubviews {
    CGSize size = self.frame.size;
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.frame = CGRectMake(0, 0, SOURCE_ICON_SIZE, SOURCE_ICON_SIZE);
    self.imageView.center = CGPointMake(size.width/2, size.height/2 + 4);
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, size.width, GRADIENT_HEIGHT);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    
    [self.contentView.layer insertSublayer:gradient atIndex:0];
    
    
}

@end
