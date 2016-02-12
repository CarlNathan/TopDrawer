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
#import "V8HorizontalPickerView.h"

#define MINIMUM_ITEM_SPACING 2
#define EDGE_INSET_SYMETRIC 2
#define HEADER_HEIGHT 20
#define SOURCE_LAYOUT_HEIGHT 40
#define BAR_HEIGHT 56

@interface ContentViewController () <UICollectionViewDelegate, PreviewParentDelegate, V8HorizontalPickerViewDataSource, V8HorizontalPickerViewDelegate>

@property (strong, nonatomic) V8HorizontalPickerView *sourceViewController;
@property (strong, nonatomic) PreviewViewController *previewViewController;
@property (strong, nonatomic) SourceModel *sourceModel;

@end

@implementation ContentViewController

- (void) viewDidLoad {
    self.sourceModel = [[SourceModel alloc] init];
    self.sourceModel.sourceNames = [self.sourceModel sourceTitles];
    [self preparePreviewView];
    [self prepareSourceView];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.previewViewController.contentCollectionView reloadData];
}

- (void) viewDidLayoutSubviews {
    CGSize size = self.view.frame.size;
    self.sourceViewController.frame = CGRectMake(0, BAR_HEIGHT, size.width, SOURCE_LAYOUT_HEIGHT);
    self.previewViewController.view.frame = CGRectMake(0, BAR_HEIGHT + SOURCE_LAYOUT_HEIGHT, size.width, size.height-SOURCE_LAYOUT_HEIGHT-BAR_HEIGHT - BAR_HEIGHT);
    self.previewViewController.contentCollectionView.frame = CGRectMake(0, 0, size.width, size.height-BAR_HEIGHT - SOURCE_LAYOUT_HEIGHT - BAR_HEIGHT);
    [self.previewViewController.contentCollectionView invalidateIntrinsicContentSize];



    
}

- (void) prepareSourceView {
    
    self.sourceViewController = [[V8HorizontalPickerView alloc] init];
    self.sourceViewController.dataSource = self;
    self.sourceViewController.delegate = self;
    self.sourceViewController.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:64.0/255.0 blue:128.0/255.0 alpha:1.0];
    self.sourceViewController.textColor = [UIColor whiteColor];
    self.sourceViewController.selectedTextColor = [UIColor whiteColor];
    self.sourceViewController.indicatorPosition = V8HorizontalPickerIndicatorBottom;
    self.sourceViewController.elementFont = [UIFont fontWithName:@"Helvetica Neue Light" size:14];
    self.sourceViewController.selectionPoint = CGPointMake(self.view.center.x, 0);
    [self.view addSubview:self.sourceViewController];
    
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

#pragma Mark -- V8 horozontal picker view

- (NSInteger)numberOfElementsInHorizontalPickerView:(V8HorizontalPickerView *)picker
{
    return self.sourceModel.sourceList.count;
}

- (NSInteger)horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index
{
    return 150;
}

- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index
{
    return self.sourceModel.sourceNames[index];
}

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index
{
    [self.previewViewController updateContentDataForSource: self.sourceModel.sourceList[index]];
}


@end
