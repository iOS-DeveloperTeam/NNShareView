# NNShareView

> 封装了分享视图，支持手机截屏分享及图片分享，一个测试小demo；


## 手机截屏分享：


继承自 `NNScreenshotViewController` 这个类，即可实现截图效果；想知道点击的是哪个按钮（微信，朋友圈，扣扣，空间），需重写父类的一个方法：

- demo：

```
- (void)shareButtonAction:(NSInteger)integer {
    NSLog(@"截屏分享_首页_点击了第 %ld 个按钮", integer);
}
```

- 示例图：

![](https://github.com/iOS-DeveloperTeam/NNFigure/blob/master/shareView/截屏.gif)


## 图片分享：

签订`NNShareViewDelegate`代理，实现代理方法即可`shareButtonAction:`

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

- 示例图：

![](https://github.com/iOS-DeveloperTeam/NNFigure/blob/master/shareView/图片.gif)


