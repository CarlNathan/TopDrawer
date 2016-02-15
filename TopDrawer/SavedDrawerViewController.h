//
//  SavedDrawerViewController.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface SavedDrawerViewController : UIViewController <detailViewDeleteDelegate>

- (void) deleteObject: (ContentItem *) contentItem;

@end
