//
//  EIWaterfallCollectionViewLayout.h
//  WaterfallCollectionView
//
//  Created by Miroslaw Stanek on 12.07.2013.
//  Copyright (c) 2013 Event Info Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EIWaterfallCollectionViewLayout;

UIKIT_EXTERN NSString * const EIWaterfallTitleKind;

@protocol EIWaterfallCollectionViewDelegate <UICollectionViewDelegate>

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(EIWaterfallCollectionViewLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface EIWaterfallCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) IBOutlet id<EIWaterfallCollectionViewDelegate> delegate;
@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) NSInteger numberOfColumns;

@property (nonatomic) CGFloat itemWidth;
@property (nonatomic) CGFloat titleHeight;

@end
