//
//  PreviewViewController.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "PreviewViewController.h"
#import "PreviewCell.h"
#import "ContentItem.h"


@interface PreviewViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) Source *source;

@end

@implementation PreviewViewController

- (void) viewDidLoad {
    [self prepareContentCollectionView];
    self.view.backgroundColor = [UIColor grayColor];
    self.sourceModel = [[SourceModel alloc] init];
    self.source = [[Source alloc] init];
    [self updateContentDataForSource:self.sourceModel.sourceList[0]];
}

- (void) viewDidLayoutSubviews {
    //self.contentCollectionView.frame = self.view.frame;
}

#pragma Mark -- Collection View DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.contentArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PreviewCell *previewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"contentCell" forIndexPath:indexPath];
    
    ContentItem *item = (ContentItem *)self.contentArray[indexPath.row];
    previewCell.contentItem = item;
    
    return previewCell;
}

#pragma Mark -- Collection View Delegate 

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ContentItem *item = (ContentItem *)self.contentArray[indexPath.row];
    
    //delegate method to launch webview screen.
    [self.previewDelegate contentWasSeleted:item source:self.source];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

#pragma Mark -- Helper

- (void) prepareContentCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    
    self.contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) collectionViewLayout:flowLayout];
    [self.contentCollectionView registerClass:[PreviewCell class] forCellWithReuseIdentifier:@"contentCell"];
    self.contentCollectionView.dataSource = self;
    self.contentCollectionView.delegate = self;
    self.contentCollectionView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.contentCollectionView];
    
}

- (void) updateContentDataForSource: (Source *) source {
    self.source = source;
    [SourceModel objectsForSource:source completion:^(NSArray *content) {
        self.contentArray = content;
        [self.contentCollectionView reloadData];
    }];
}
@end
