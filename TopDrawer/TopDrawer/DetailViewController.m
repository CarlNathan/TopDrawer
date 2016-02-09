//
//  DetailViewController.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation DetailViewController

- (void) viewDidLoad{
    [self prepareWebView];
}

- (void) viewDidLayoutSubviews{
    
    self.webView.frame = self.view.bounds;
}

- (void) prepareWebView {
    self.webView = [[UIWebView alloc] init];
}

@end
