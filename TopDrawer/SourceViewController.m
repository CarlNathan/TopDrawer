//
//  SourceViewController.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "SourceViewController.h"

@interface SourceViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *sourceArray;
@property (strong, nonatomic) UICollectionView *sourceCollectionView;


@end

@implementation SourceViewController

- (void) viewDidLoad {
    SourceModel *sourceModel = [[SourceModel alloc] init];
    self.sourceArray = sourceModel.sourceList;
    NSLog(@"%@", self.sourceArray);
    [self prepareCollectionView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) viewDidLayoutSubviews {
    
}

#pragma Mark -- CollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SourceCell *sourceCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sourceCell" forIndexPath:indexPath];
    
    Source *source = (Source *)self.sourceArray[indexPath.row];
    sourceCell.imageView.image = source.image;
    
    return sourceCell;
}

#pragma Mark -- Helper Methods

- (void) prepareCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.minimumInteritemSpacing = 2;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        
    self.sourceCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayout];
    [self.sourceCollectionView registerClass:[SourceCell class] forCellWithReuseIdentifier:@"sourceCell"];
    self.sourceCollectionView.dataSource = self;
    self.sourceCollectionView.delegate = self;
    self.sourceCollectionView.userInteractionEnabled = YES;
    self.sourceCollectionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.sourceCollectionView];

}

#pragma Mark -- CollectionView Delegate

- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    //delegateMethodFor displaying content view
}


@end
