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
#define BAR_HEIGHT 0

@interface DetailViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIImageView *savedAnimationView;

@end

@implementation DetailViewController

- (void) viewDidLoad{
    [self prepareWebView];
    //[self prepareHeaderView];
    [self prepareGestureRecognizers];
    [self prepareSaveButton];
    [self prepareSaveAnimationView];
}

- (void) viewDidLayoutSubviews{
    CGSize size = self.view.bounds.size;
    self.headerView.frame = CGRectMake(0, BAR_HEIGHT, size.width, HEADER_HEIGHT);
    self.webView.frame = CGRectMake(0, BAR_HEIGHT, size.width, size.height - BAR_HEIGHT - BAR_HEIGHT);
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    self.savedAnimationView.center = self.view.center;
}

- (void) prepareWebView {
    self.webView = [[UIWebView alloc] init];
    
    NSURL *url = [NSURL URLWithString:self.contentItem.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.backgroundColor = [UIColor whiteColor];
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
    self.contentItem.isSaved = YES;
    [self prepareSaveButton];
    [self showSavedAnimation];
}


- (void) prepareSaveButton{
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveContent)];
    if (!self.contentItem.isSaved) {
        self.navigationItem.rightBarButtonItem = saveButton;
    } else if (self.contentItem.isSaved){
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteContent)];
        self.navigationItem.rightBarButtonItem = saveButton;
    }
}

- (void) prepareSaveAnimationView {
    self.savedAnimationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    self.savedAnimationView.image = [UIImage imageNamed:@"App hard disk.png"];
    self.savedAnimationView.alpha = 0;
    [self.view addSubview:self.savedAnimationView];
}

- (void) showSavedAnimation {
    
    self.savedAnimationView.alpha = 0.7;
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.savedAnimationView.alpha = 0;
    } completion:nil];

}

- (void) deleteContent {
    [self.deleteDelegate deleteObject: self.contentItem];
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.contentItem.isSaved = NO;
}

@end
