//
//  DetailViewController.h
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentItem.h"
#import "Source.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ContentItem *contentItem;
@property (strong, nonatomic) Source *source;

@end
