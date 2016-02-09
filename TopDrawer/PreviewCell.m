//
//  PreviewCell.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "PreviewCell.h"

@interface PreviewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *byLineLabel;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation PreviewCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        _byLineLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        
    }
    return self;
}

- (void) layoutSubviews {
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.frame = self.contentView.frame;
    
}

-(void)setContentItem:(ContentItem *)contentItem{
    _contentItem = contentItem;
    
    [DownloadManager imageForPhoto:self.contentItem.imageURLString completion:^(UIImage *image) {
        self.imageView.image = image;
        self.titleLabel.text = self.contentItem.title;
        self.byLineLabel.text = self.contentItem.byLine;
    }];
}

@end
