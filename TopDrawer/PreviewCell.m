//
//  PreviewCell.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "PreviewCell.h"

#define TITLELABEL_INSET 20
#define BYLINE_LABEL INSET 20
#define ITEM_SPACING 20
#define GRADIENT_HEIGHT 100

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
        _byLineLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.byLineLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.numberOfLines = 2;
        self.contentView.backgroundColor = [UIColor blackColor];
        
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.byLineLabel];
        
                
    }
    return self;
}

- (void) layoutSubviews {
    CGSize size = self.frame.size;
    self.imageView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.x, self.contentView.frame.size.width, self.contentView.frame.size.width);
    self.titleLabel.frame = CGRectMake(TITLELABEL_INSET, size.height - (GRADIENT_HEIGHT) , size.width - 2 * TITLELABEL_INSET, 60);
    self.byLineLabel.frame = CGRectMake(TITLELABEL_INSET, size.height + ITEM_SPACING + 30, size.width - 2 * TITLELABEL_INSET, 50);
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, size.height - (size.height - self.imageView.frame.size.height) - GRADIENT_HEIGHT, self.contentView.frame.size.width, GRADIENT_HEIGHT);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    
    [_imageView.layer insertSublayer:gradient atIndex:0];
    
    
}

-(void)setContentItem:(ContentItem *)contentItem{
    _contentItem = contentItem;
    
    [DownloadManager imageForPhoto:self.contentItem.imageURLString completion:^(UIImage *image) {
        self.imageView.image = image;
        self.titleLabel.text = self.contentItem.title;
        self.byLineLabel.text = self.contentItem.byLine;
    }];
}

- (void) prepareForReuse {
    self.imageView.image = nil;
}

@end
