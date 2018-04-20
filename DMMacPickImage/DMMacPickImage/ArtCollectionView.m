//
//  ArtCollectionView.m
//  DMMacPickImage
//
//  Created by lbq on 2018/4/16.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ArtCollectionView.h"
#import "ArtCollectionViewItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ArtCollectionView()<NSCollectionViewDataSource>
@property (weak) IBOutlet NSCollectionView *collectionView;
@property (weak) IBOutlet NSScrollView *scrollView;

@end
@implementation ArtCollectionView

//- (instancetype)init
//{
//    self = [super init];
//
//    return self;
//}

- (void)awakeFromNib
{
    [super awakeFromNib];
//    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"ArtCollectionViewItem" bundle:nil];
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.collectionView.dataSource = self;
    //    [self.collectionView registerNib:nib forItemWithIdentifier:@"ItemCell"];
    [self.collectionView registerClass:[ArtCollectionViewItem class] forItemWithIdentifier:@"ItemCell"];
    NSCollectionViewFlowLayout *layout = self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(60, 60);
    layout.scrollDirection = NSCollectionViewScrollDirectionHorizontal;
    self.collectionView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setList:(NSArray *)list
{
    _list = list;
    [self.collectionView reloadData];
}

//MARK: NSCollectionViewDataSource

/* Asks the data source for the number of items in the specified section.
 */
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}


- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    ArtCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    NSString *url = @"https://www.showonline.com.cn/image/2c91faca60c4f34a0162a93525e14a43.jpg";
    //    NSString *url = @"http://web.xinhuamingjia.com/ChinaPainting/mntnas/infoxhmj/mingjiaworkpic/2016/10/09/small_1475978798648.jpg";
    [item.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    return item;
}


@end
