//
//  PreviewView.m
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "PreviewView.h"
#import "DownloadManager.h"

#define IMAGE_SIZE 50
#define IMAGE_INSET 20
#define ITEM_SPACING 20
#define BAR_HEIGHT 64
#define LABEL_HEIGHT 30

@interface PreviewView ()

@property (strong, nonatomic) UILabel *byLineLabel;
@property (strong, nonatomic) UILabel *dateLabel;

@end

@implementation PreviewView

+ (instancetype) emptyPreviewView{
    PreviewView *previewView = [[PreviewView alloc] init];
    previewView.titleLabel  = [[UILabel alloc] init];
    [previewView addSubview:previewView.titleLabel];
    previewView.byLineLabel = [[UILabel alloc] init];
    [previewView addSubview:previewView.byLineLabel];
    previewView.dateLabel = [[UILabel alloc] init];
    [previewView addSubview:previewView.dateLabel];
    previewView.imageView = [[UIImageView alloc] init];
    [previewView addSubview:previewView.imageView];
    previewView.backgroundColor = [UIColor whiteColor];

    return previewView;
}

- (void) layoutSubviews {
    CGSize size = self.frame.size;
    self.imageView.frame = CGRectMake(IMAGE_INSET, BAR_HEIGHT + IMAGE_INSET, IMAGE_SIZE, IMAGE_SIZE);
    self.titleLabel.frame = CGRectMake(IMAGE_INSET + IMAGE_SIZE + ITEM_SPACING, ITEM_SPACING, size.width - IMAGE_SIZE - IMAGE_INSET - ITEM_SPACING - ITEM_SPACING, LABEL_HEIGHT);
    self.dateLabel.frame = CGRectMake(IMAGE_INSET + IMAGE_SIZE + ITEM_SPACING, 2* ITEM_SPACING + LABEL_HEIGHT, size.width - IMAGE_SIZE - IMAGE_INSET - ITEM_SPACING - ITEM_SPACING, LABEL_HEIGHT);
    self.byLineLabel.frame = CGRectMake(IMAGE_INSET + IMAGE_SIZE + ITEM_SPACING, 3* ITEM_SPACING + 2 *LABEL_HEIGHT, size.width - IMAGE_SIZE - IMAGE_INSET - ITEM_SPACING - ITEM_SPACING, LABEL_HEIGHT);
    
}

- (void) setContentItem:(SavedContentItem *)contentItem {
    _contentItem = contentItem;
    self.titleLabel.text = contentItem.title;
    self.titleLabel.numberOfLines = 0;
    self.dateLabel.text = contentItem.date;
    self.byLineLabel.text = contentItem.byLine;
    [DownloadManager imageForPhoto:contentItem.imageURLString completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
}

@end
