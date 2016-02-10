//
//  HeaderView.m
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "HeaderView.h"

#define AVATAR_SIZE 40
#define AVATAR_INSET 20
#define ITEM_SPACING 20
#define TITLE_INSET_HEIGHT 15

@interface HeaderView ()

@property (strong, nonatomic) ContentItem *contentItem;
@property (strong, nonatomic) Source *source;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *bylineLabel;

@end

@implementation HeaderView

+ (instancetype)headerWithContentItem: (ContentItem *) contentItem source: (Source *) source
{
    HeaderView *header = [[HeaderView alloc] init];
    header.contentItem = contentItem;
    header.source = source;
    
    header.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    header.imageView.image = source.image;
    header.imageView.backgroundColor = [UIColor whiteColor];
    [header addSubview:header.imageView];
    
    header.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    header.titleLabel.text = header.contentItem.title;
    [header addSubview:header.titleLabel];
    header.backgroundColor = [UIColor grayColor];
    
    return header;
}

- (void) layoutSubviews {
    CGSize size = self.frame.size;
    self.imageView.frame = CGRectMake(AVATAR_INSET, AVATAR_INSET, AVATAR_SIZE, AVATAR_SIZE);
    self.titleLabel.frame = CGRectMake(AVATAR_SIZE + AVATAR_INSET + ITEM_SPACING, TITLE_INSET_HEIGHT, size.width - AVATAR_INSET - AVATAR_SIZE - ITEM_SPACING - ITEM_SPACING, 20);
}

@end
