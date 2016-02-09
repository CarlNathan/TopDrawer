//
//  PreviewCell.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentItem.h"
#import "DownloadManager.h"

@interface PreviewCell : UICollectionViewCell

@property (strong, nonatomic) ContentItem *contentItem;

@end
