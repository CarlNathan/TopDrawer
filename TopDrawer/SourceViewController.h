//
//  SourceViewController.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Source.h"
#import "SourceCell.h"
#import "SourceModel.h"

@protocol ParentDelegate <NSObject>

- (void) sourcesDidChange: (Source *) source;

@end


@interface SourceViewController : UIViewController

@property (weak, nonatomic) id <ParentDelegate> parent;
@property (strong, nonatomic) UICollectionView *sourceCollectionView;


@end
