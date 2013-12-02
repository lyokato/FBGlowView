# FBGlowView

This library provides you an easy way to support glowing effect on your view class.

## APPLICATION EXAMPLE

In my app, "Flashback", glowing effect is attached on most of texts and shapes. This time I pick up one for label.

![Flashback](http://static.squarespace.com/static/51c2c539e4b032aad7050f2e/t/5280c72be4b05ebb58c32579/1384171308891/Screens5.png?format=1500w "Flashback")

For more detail, access to [Flashback Calendar](http://flashback-calendar.com/)

## SETTING UP

If you use CocoaPods, add following line into your Podfile

```
pod 'FBGlowView', :git => 'https://github.com/lyokato/FBGlowView.git'
```

or directly git clone or download from this page. 

## IMPLEMENTATION

Inherit FBGlowView, and impmenet your own drawing code in following method.

```
- (void)drawContentInContext:(CGContextRef)ctx
                        rect:(CGRect)rect;
```


### MyView.h
```
#import <FBGlowView/FBGLowView.h>

@interface MyView : FBGlowView
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) UIColor *fillColor;
@end
```

I reccomend you to use padding, to secure space for outer glow.

### MyView.m
```
#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
  self.padding = 10.0f;
}

- (void)drawContentRect:(CGRect)rect
              inContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(self.padding, self.padding, self.width, self.height));
}

@end

```

And you can set just 4 more properties

- glowColor
- glowSize
- innerGlowColor
- innerGlowSize

```
#import "MyView.h"

- (void)setupView
{
    CGRect frame = CGRectMake(10, 100, 300, 100);
    MyView *v = [[MyView alloc] initWithFrame:frame];
    v.backgroundColor = [UIColor clearColor];
    v.glowSize = 20;
    v.glowColor = UIColor.greenColor;
    v.innerGlowSize = 4;
    v.innerGlowColor = UIColor.greenColor;
    v.width = 100;
    v.height = 50;
    v.fillColor = UIColor.whiteColor;
    [self.view addSubview:v];
}
```

## FOR MORE DETAIL

This repository includes demo project, so you can dig into it for more detail. 

