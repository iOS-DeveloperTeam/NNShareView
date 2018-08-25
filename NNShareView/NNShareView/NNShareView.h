//
//  NNShareView.h
//  NNShareView
//
//  Created by 刘朋坤 on 2018/8/24.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNShareViewDelegate<NSObject>
@optional
- (void)shareButtonAction:(NSInteger)integer;
@end

@interface NNShareView : UIView

- (instancetype)initWithFrame:(CGRect)frame screenshotImage:(UIImage *)screenshotImage;

@property (nonatomic, weak) id<NNShareViewDelegate> shareViewDelegate;

@end
