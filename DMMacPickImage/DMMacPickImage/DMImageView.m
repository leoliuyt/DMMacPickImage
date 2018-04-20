//
//  DMImageView.m
//  DMMacPickImage
//
//  Created by lbq on 2018/4/20.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMImageView.h"

@implementation DMImageView
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.wantsLayer = YES;
//    }
//    return self;
//}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSImage *image = [NSImage imageNamed:@"user_default_autor_background"];
    self.layer.contents = image;
    self.layer.backgroundColor = NSColor.redColor.CGColor;
    [image drawInRect:dirtyRect];
}

@end
