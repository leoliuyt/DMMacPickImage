//
//  SecondViewController.m
//  DMMacPickImage
//
//  Created by lbq on 2018/4/17.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "SecondViewController.h"
#import "ArtCollectionView.h"
#import <Masonry.h>
@interface SecondViewController ()
@property (nonatomic, strong) ArtCollectionView *collectionView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    

    NSArray *arr;
    BOOL loaded = [[NSBundle mainBundle] loadNibNamed:@"ArtCollectionView" owner:self topLevelObjects:&arr];
    if (loaded) {
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[ArtCollectionView class]]) {
                self.collectionView = obj;
                *stop = YES;
            }
        }];
    }
    loaded = [[NSBundle mainBundle] loadNibNamed:@"ArtCollectionView2" owner:nil topLevelObjects:&arr];
    [self.view addSubview:self.collectionView];
    //    self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@60.);
    }];
    
    [self.collectionView setList:nil];
}

@end
