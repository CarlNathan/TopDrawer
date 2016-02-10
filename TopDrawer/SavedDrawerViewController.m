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
#import "DetailViewController.h"

#define BAR_HEIGHT 64
#define COLLECTION_VIEW_HEIGHT_LOWERED 200

@interface SavedDrawerViewController () <UICollectionViewDelegate, savedCollectionViewControllerDelegate>

@property (strong, nonatomic) SavedCollectionViewController *collectionViewController;
@property (strong, nonatomic) PreviewView *previewView;
@property (assign, nonatomic) BOOL collectionViewIsLowered;

@end

@implementation SavedDrawerViewController

- (void) viewDidLoad {
    [self preparePreviewView];
    [self prepareCollectionViewController];
    self.view.userInteractionEnabled = YES;
    self.collectionViewIsLowered = NO;
    [self prepareGestureRecognizers];
}

- (void) viewDidLayoutSubviews {
    CGSize size = self.view.frame.size;
    if (!self.collectionViewIsLowered) {
    self.previewView.frame = CGRectMake(0, BAR_HEIGHT, size.width, size.height - COLLECTION_VIEW_HEIGHT_LOWERED);
    self.collectionViewController.view.frame = CGRectMake(0, BAR_HEIGHT, size.width, size.height - BAR_HEIGHT);
    } else {
        self.previewView.frame = CGRectMake(0, BAR_HEIGHT, size.width, size.height - COLLECTION_VIEW_HEIGHT_LOWERED);
        self.collectionViewController.view.frame = CGRectMake(0, size.height - COLLECTION_VIEW_HEIGHT_LOWERED, size.width, COLLECTION_VIEW_HEIGHT_LOWERED);
    }
    
}

- (void) preparePreviewView{
    self.previewView = [PreviewView emptyPreviewView];
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
    if (!self.collectionViewIsLowered) {
        self.collectionViewIsLowered = YES;
        [self viewDidLayoutSubviews];
        
    }
}

- (void) raiseCollectionview {
    
}

- (void) prepareGestureRecognizers {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(previewWasTapped)];
    [self.previewView addGestureRecognizer:tap];
}

- (void) previewWasTapped {
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.contentItem = [ContentItem contentItemFromSavedContentItem:self.previewView.contentItem];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
