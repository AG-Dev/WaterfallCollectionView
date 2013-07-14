//
//  EIViewController.m
//  WaterfallCollectionView
//
//  Created by Miroslaw Stanek on 12.07.2013.
//  Copyright (c) 2013 Event Info Ltd. All rights reserved.
//

#import "EIViewController.h"
#import "EIWaterfallCollectionViewCell.h"
#import "EIWaterfallCollectionViewLayout.h"
#import "EIWaterfallHeaderReusableView.h"

static NSString* const WaterfallCellIdentifier = @"WaterfallCell";
static NSString* const WaterfallHeaderIdentifier = @"WaterfallHeader";

@interface EIViewController () <EIWaterfallCollectionViewDelegate, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *cellHeights;

@end

@implementation EIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cv.delegate = self;
    
    EIWaterfallCollectionViewLayout *cvLayout = [[EIWaterfallCollectionViewLayout alloc] init];
    cvLayout.delegate = self;
    [self.cv setCollectionViewLayout:cvLayout];
    [self.cv reloadData];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [[self.cv collectionViewLayout] invalidateLayout];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EIWaterfallCollectionViewCell *waterfallCell = [collectionView dequeueReusableCellWithReuseIdentifier:WaterfallCellIdentifier
                                                                                             forIndexPath:indexPath];
    waterfallCell.lblTitle.text = [NSString stringWithFormat: @"Item %d", indexPath.item];
    return waterfallCell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(EIWaterfallCollectionViewLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeights[indexPath.section + 1 * indexPath.item] floatValue];
}

- (NSMutableArray *)cellHeights {
    if (!_cellHeights) {
        _cellHeights = [NSMutableArray arrayWithCapacity:50];
        for (NSInteger i = 0; i < 50; i++) {
            _cellHeights[i] = @(arc4random()%100*2+100);
        }
    }
    return _cellHeights;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath; {
    EIWaterfallHeaderReusableView *titleView =
    [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                       withReuseIdentifier:WaterfallHeaderIdentifier
                                              forIndexPath:indexPath];
    titleView.lblTitle.text = [NSString stringWithFormat: @"Section %d", indexPath.section];
    return titleView;
}

@end
