//
//  ViewController.m
//  NNShareView
//
//  Created by 刘朋坤 on 2018/8/24.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)shareButtonAction:(NSInteger)integer {
    NSLog(@"截屏分享_首页_点击了第 %ld 个按钮", integer);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[NSClassFromString(@"NNTestViewController") new] animated:YES];
}

@end
