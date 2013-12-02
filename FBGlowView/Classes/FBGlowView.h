#import <UIKit/UIKit.h>

@interface FBGlowView : UIView
@property (nonatomic, assign) CGFloat  glowSize;
@property (nonatomic, assign) CGFloat  innerGlowSize;
@property (nonatomic, strong) UIColor *glowColor;
@property (nonatomic, strong) UIColor *innerGlowColor;
@end

@interface FBGlowView (Protected)
- (void)drawContentRect:(CGRect)rect 
              inContext:(CGContextRef)ctx;
@end

