//
//  ArtCollectionViewItem.m
//  DMMacPickImage
//
//  Created by lbq on 2018/4/16.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ArtCollectionViewItem.h"


@interface ArtCollectionViewItem ()
@end

@implementation ArtCollectionViewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSLog(@"%s",__func__);
        self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
}

- (void)viewWillAppear
{
    [super viewWillAppear];
//     view.layer?.backgroundColor = NSColor.lightGray.cgColor

    
}


@end
