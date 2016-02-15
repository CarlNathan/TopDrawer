//
//  SavedCollectionViewController.h
//  TopDrawer
//
//  Created by Carl Udren on 2/9/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataStack.h"
#import "SavedContentItem.h"
#import "ContentItem.h"

@protocol savedCollectionViewControllerDelegate <NSObject>

- (void) didSelectSavedItem: (SavedContentItem *) item;

@end

@interface SavedCollectionViewController : UIViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) id <savedCollectionViewControllerDelegate> delegate;

- (void) deleteObject: (ContentItem *) contentItem;


@end
