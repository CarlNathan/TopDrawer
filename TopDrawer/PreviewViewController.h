//
//  PreviewViewController.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentItem.h"
#import "PreviewCell.h"
#import "Source.h"
#import "SourceModel.h"

@protocol PreviewParentDelegate <NSObject>

- (void) contentWasSeleted: (ContentItem *) item source: (Source *) source;

@end

@interface PreviewViewController : UIViewController

@property (strong, nonatomic) NSArray *contentArray;
@property (strong, nonatomic) SourceModel *sourceModel;
@property (weak, nonatomic) id <PreviewParentDelegate> previewDelegate;
@property (strong, nonatomic) UICollectionView *contentCollectionView;

- (void) updateContentDataForSource: (Source *) source;

@end
