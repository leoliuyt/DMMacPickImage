//
//  ViewController.m
//  DMMacPickImage
//
//  Created by lbq on 2018/4/12.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"
#import <Quartz/Quartz.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController()
@property (weak) IBOutlet NSImageView *imageView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSString *url = @"https://www.showonline.com.cn/image/2c91faca60c4f34a0162a93525e14a43.jpg";
    //    NSString *url = @"http://web.xinhuamingjia.com/ChinaPainting/mntnas/infoxhmj/mingjiaworkpic/2016/10/09/small_1475978798648.jpg";
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    [task resume];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)selectButtonClicked:(id)sender {
    [self pictureTakerWay];
//    [self openPanelWay];
}

- (void)openPanelWay{
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    __weak typeof(self)weakSelf = self;
    //是否可以创建文件夹
    panel.canCreateDirectories = YES;
    //是否可以选择文件夹
    panel.canChooseDirectories = YES;
    //是否可以选择文件
    panel.canChooseFiles = YES;
    
    //是否可以多选
    [panel setAllowsMultipleSelection:NO];
    
    //显示
    [panel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
        //是否点击open 按钮
        if (result == NSModalResponseOK) {
            //NSURL *pathUrl = [panel URL];
            NSString *pathString = [panel.URLs.firstObject path];
//            weakSelf.urlTextField.stringValue = pathString;
            weakSelf.imageView.image = [[NSImage alloc] initWithContentsOfFile:pathString];
        }
    }];
    // 悬浮电脑主屏幕上
    //    [panel beginWithCompletionHandler:^(NSInteger result) {
    //
    //    }];
}

- (void)pictureTakerWay
{
    //设置镜像，默认Yes
    [[IKPictureTaker pictureTaker]setMirroring:NO];
    [[IKPictureTaker pictureTaker]beginPictureTakerWithDelegate:self
                                                 didEndSelector:@selector(pictureTakerDidEnd:returnCode:contextInfo:)
                                                    contextInfo:nil];
}

- (void)pictureTakerDidEnd:(IKPictureTaker *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    NSImage *image = [sheet outputImage];
    if(image !=nil && (returnCode == NSModalResponseOK) ) {
        self.imageView.image = image;
    }
}
@end
