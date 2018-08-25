//
//  NNShareView.m
//  NNShareView
//
//  Created by 刘朋坤 on 2018/8/24.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNShareView.h"

@implementation NNShareView

- (instancetype)initWithFrame:(CGRect)frame screenshotImage:(UIImage *)screenshotImage {
    if (self = [super initWithFrame:frame]) {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        // 动画
        [self animationDuration:0.8];
        [self creatChildViews:screenshotImage];
    }
    return self;
}

/** 创建子视图 */
- (void)creatChildViews:(UIImage *)screenshotImage {
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        view.alpha = 0.7;
    }];
    [self addSubview:view];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-145, self.frame.size.width, 145)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomView addSubview:bottomButton];
    bottomButton.frame = CGRectMake(0, 100, bottomView.frame.size.width, 45);
    [bottomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bottomButton setTitle:@"取消" forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    bottomButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    NSArray *imageArray = @[@"微信", @"朋友圈", @"qq", @"qq空间"];
    
    for (int i = 0; i<imageArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [bottomView addSubview:button];
        button.frame = CGRectMake((self.frame.size.width/imageArray.count)*i, 0, self.frame.size.width/imageArray.count, 100);
        [button setTitle:imageArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat imageWith = button.imageView.frame.size.width;
        CGFloat imageHeight = button.imageView.frame.size.height;
        CGFloat labelWidth = button.titleLabel.intrinsicContentSize.width;
        CGFloat labelHeight = button.titleLabel.intrinsicContentSize.height;
        button.imageEdgeInsets = UIEdgeInsetsMake(-labelHeight, 0, 0, -labelWidth);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight, 0);
        button.tag = i;
    }
    
    UIImageView *shareimage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 60, self.frame.size.width-80, self.frame.size.height-245)];
    shareimage.image = screenshotImage;
    [self addSubview:shareimage];
}

/** 按钮点击事件 */
- (void)shareButtonAction:(UIButton *)sender {
    if (self.shareViewDelegate && [self.shareViewDelegate respondsToSelector:@selector(shareButtonAction:)]) {
        [self.shareViewDelegate shareButtonAction:sender.tag];
    }
}

/** 视图消失 */
- (void)dismiss {
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.01;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/** 缩放动画 */
- (void)animationDuration:(CFTimeInterval)duration {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01, 0.01, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    [self.layer addAnimation:animation forKey:nil];
}

@end
