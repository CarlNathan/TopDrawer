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
#import "DetailViewController.h"
#import "ContentItem.h"
#import "SourceViewController.h"

#define MINIMUM_ITEM_SPACING 2
#define EDGE_INSET_SYMETRIC 2
#define HEADER_HEIGHT 20
#define SOURCE_LAYOUT_HEIGHT 40
#define BAR_HEIGHT 56

@interface ContentViewController () <UICollectionViewDelegate, ParentDelegate, PreviewParentDelegate>

@property (strong, nonatomic) SourceViewController *sourceViewController;
@property (strong, nonatomic) PreviewViewController *previewViewController;

@end

@implementation ContentViewController

- (void) viewDidLoad {
    [self preparePreviewView];
    [self prepareSourceView];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.previewViewController.contentCollectionView reloadData];
}

- (void) viewDidLayoutSubviews {
    CGSize size = self.view.frame.size;
    self.sourceViewController.view.frame = CGRectMake(0, BAR_HEIGHT, size.width, SOURCE_LAYOUT_HEIGHT);
    self.sourceViewController.sourceCollectionView.frame = CGRectMake(0, 0, size.width, SOURCE_LAYOUT_HEIGHT);
    self.previewViewController.view.frame = CGRectMake(0, BAR_HEIGHT + SOURCE_LAYOUT_HEIGHT, size.width, size.height-SOURCE_LAYOUT_HEIGHT-BAR_HEIGHT - BAR_HEIGHT);
    self.previewViewController.contentCollectionView.frame = CGRectMake(0, 0, size.width, size.height-BAR_HEIGHT - SOURCE_LAYOUT_HEIGHT - BAR_HEIGHT);
    [self.sourceViewController.sourceCollectionView invalidateIntrinsicContentSize];
    [self.previewViewController.contentCollectionView invalidateIntrinsicContentSize];
    self.sourceViewController.sourceCollectionView.pagingEnabled = YES;



    
}

- (void) prepareSourceView {
    
    self.sourceViewController = [[SourceViewController alloc] init];
    self.sourceViewController.parent = self;
    [self displayContentController:self.sourceViewController];
    
}


- (void) preparePreviewView {
    self.previewViewController = [[PreviewViewController alloc] init];
    self.previewViewController.previewDelegate = self;
    [self displayContentController:self.previewViewController];
    
}

- (void) displayContentController: (UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void) launchDetailController: (ContentItem *) contentItem {
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.contentItem = contentItem;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma Mark -- Child view controller Delegates

- (void) sourcesDidChange:(Source *)source{
    
    [self.previewViewController updateContentDataForSource:source];
}

- (void) contentWasSeleted: (ContentItem *) item source: (Source *) source{
    
    [self launchDetailController:item];
}

@end
