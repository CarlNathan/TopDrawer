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

@interface PreviewViewController : UIViewController

@property (strong, nonatomic) NSArray *contentArray;
@property (strong, nonatomic) SourceModel *sourceModel;

- (void) updateContentDataForSource: (Source *) source;

@end
