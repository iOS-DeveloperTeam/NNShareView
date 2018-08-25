//
//  NNTestViewController.m
//  NNShareView
//
//  Created by 刘朋坤 on 2018/8/24.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNTestViewController.h"
#import "NNShareView.h"

@interface NNTestViewController ()<NNShareViewDelegate>

@end

@implementation NNTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"点击屏幕试试";
}

- (void)shareButtonAction:(NSInteger)integer {
    NSLog(@"截屏分享_测试界面_点击了第 %ld 个按钮", integer);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImage *image = [UIImage imageNamed:@"dog01"];
    NNShareView *shareviews = [[NNShareView alloc] initWithFrame:[UIScreen mainScreen].bounds screenshotImage:image];
    shareviews.shareViewDelegate = self;
}

@end
