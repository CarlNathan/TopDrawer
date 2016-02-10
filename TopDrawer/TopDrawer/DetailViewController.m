//
//  DetailViewController.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "DetailViewController.h"
#import "HeaderView.h"
#import "CoreDataStack.h"
#import "SavedContentItem.h"

#define HEADER_HEIGHT 80
#define BAR_HEIGHT 64

@interface DetailViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIView *headerView;

@end

@implementation DetailViewController

- (void) viewDidLoad{
    [self prepareWebView];
    [self prepareHeaderView];
    [self prepareGestureRecognizers];

}

- (void) viewDidLayoutSubviews{
    CGSize size = self.view.bounds.size;
    self.headerView.frame = CGRectMake(0, BAR_HEIGHT, size.width, HEADER_HEIGHT);
    self.webView.frame = CGRectMake(0, HEADER_HEIGHT + BAR_HEIGHT, size.width, size.height - HEADER_HEIGHT - BAR_HEIGHT);
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
}

- (void) prepareWebView {
    self.webView = [[UIWebView alloc] init];
    
    NSURL *url = [NSURL URLWithString:self.contentItem.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.webView];
}

- (void) prepareHeaderView {
    
    HeaderView *headerView = [HeaderView headerWithContentItem:self.contentItem source:self.source];
    self.headerView = headerView;
    
    [self.view addSubview:self.headerView];
    
}

- (void) prepareGestureRecognizers {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveContent)];
    [self.headerView addGestureRecognizer:tap];
}

- (void) saveContent {
    CoreDataStack *defaultStack = [CoreDataStack defaultStack];
    SavedContentItem *item = [NSEntityDescription insertNewObjectForEntityForName:@"SavedContentItem" inManagedObjectContext:defaultStack.managedObjectContext];
    item.title = self.contentItem.title;
    item.urlString = self.contentItem.urlString;
    item.date = self.contentItem.date;
    item.byLine = self.contentItem.byLine;
    item.imageURLString = self.contentItem.imageURLString;
    [defaultStack saveContext];
}

@end
