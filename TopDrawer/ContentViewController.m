//
//  ContentViewController.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ContentViewController.h"
#import "SourceViewController.h"
#import "PreviewViewController.h"

#define MINIMUM_ITEM_SPACING 2
#define EDGE_INSET_SYMETRIC 2
#define HEADER_HEIGHT 20
#define SOURCE_LAYOUT_HEIGHT 200

@interface ContentViewController () <UICollectionViewDelegate>

@property (strong, nonatomic) SourceViewController *sourceViewController;
@property (strong, nonatomic) PreviewViewController *previewViewController;

@end

@implementation ContentViewController

- (void) viewDidLoad {
    [self prepareSourceView];
    [self preparePreviewView];
    
}

- (void) viewDidLayoutSubviews {
    CGSize size = self.view.bounds.size;
    self.sourceViewController.view.frame = CGRectMake(0, 0, size.width, SOURCE_LAYOUT_HEIGHT);
    CGRect sourceFrame = self.sourceViewController.view.frame;
    self.previewViewController.view.frame = CGRectMake(0, sourceFrame.size.height, size.width, size.height-sourceFrame.size.height);
    
}

- (void) prepareSourceView {
    
    self.sourceViewController = [[SourceViewController alloc] init];
    [self displayContentController:self.sourceViewController];
    
}


- (void) preparePreviewView {
    self.previewViewController = [[PreviewViewController alloc] init];
    [self displayContentController:self.previewViewController];
    
}

- (void) displayContentController: (UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}


@end
