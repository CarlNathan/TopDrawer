//
//  SavedDrawerViewController.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SavedDrawerViewController.h"
#import "SavedCollectionViewController.h"
#import "PreviewView.h"
#import "SavedContentItem.h"

#define BAR_HEIGHT 64
#define COLLECTION_VIEW_HEIGHT_LOWERED 100

@interface SavedDrawerViewController () <UICollectionViewDelegate, savedCollectionViewControllerDelegate>

@property (strong, nonatomic) SavedCollectionViewController *collectionViewController;
@property (strong, nonatomic) PreviewView *previewView;

@end

@implementation SavedDrawerViewController

- (void) viewDidLoad {
    [self preparePreviewView];
    [self prepareCollectionViewController];
    self.view.userInteractionEnabled = YES;
}

- (void) viewDidLayoutSubviews {
    CGSize size = self.view.frame.size;
    self.previewView.frame = CGRectMake(0, BAR_HEIGHT, size.width, size.height - COLLECTION_VIEW_HEIGHT_LOWERED);
    self.collectionViewController.view.frame = CGRectMake(0, BAR_HEIGHT, size.width, size.height - BAR_HEIGHT);
    
}

- (void) preparePreviewView{
    self.previewView = [PreviewView emptyPreviewView];
    //previewView
    
    [self.view addSubview:self.previewView];
}

- (void) prepareCollectionViewController {
    self.collectionViewController = [[SavedCollectionViewController alloc] init];
    self.collectionViewController.delegate = self;
    
    [self displayContentController:self.collectionViewController];
    
}

- (void) displayContentController: (UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

#pragma Mark - Saved Collection Controller Delegate

- (void) didSelectSavedItem: (SavedContentItem *) item{
    NSLog(@"selected item");
    self.previewView.contentItem = item;
    [self lowerCollectionView];
}


#pragma Mark - Helper

- (void) lowerCollectionView {
    NSLog(@"Lowered");
    CGSize size = self.view.frame.size;
    self.collectionViewController.view.frame = CGRectMake(0, size.height-COLLECTION_VIEW_HEIGHT_LOWERED, size.width, COLLECTION_VIEW_HEIGHT_LOWERED);
}

- (void) raiseCollectionview {
    
}

@end
