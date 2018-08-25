# NNShareView

> 分享视图，支持手机截屏分享及图片分享；


## 手机截屏分享：


集成自 `NNScreenshotViewController` 这个类，即可实现截图效果，想要知道点击的是哪个按钮（微信，朋友圈，扣扣，空间），需重写父类的一个方法：

- 示例图：

![](https://github.com/iOS-DeveloperTeam/NNFigure/blob/master/shareView/截屏.mov)


- demo：

```
- (void)shareButtonAction:(NSInteger)integer {
    NSLog(@"截屏分享_首页_点击了第 %ld 个按钮", integer);
}
```

## 图片分享：

签订`NNShareViewDelegate`代理，实现代理方法即可`shareButtonAction:`

- 示例图：

![](https://github.com/iOS-DeveloperTeam/NNFigure/blob/master/shareView/图片.gif)


- demo：

```
- (void)shareButtonAction:(NSInteger)integer {
    NSLog(@"截屏分享_测试界面_点击了第 %ld 个按钮", integer);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImage *image = [UIImage imageNamed:@"dog01"];
    NNShareView *shareviews = [[NNShareView alloc] initWithFrame:[UIScreen mainScreen].bounds screenshotImage:image];
    shareviews.shareViewDelegate = self;
}
```


