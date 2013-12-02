#import "FBGlowView.h"

@implementation FBGlowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultParameters];
    }
    return self;
}

- (void)setupDefaultParameters
{
    self.glowColor         = [UIColor whiteColor];
    self.innerGlowColor    = [UIColor whiteColor];
    self.glowSize          = 0.0;
    self.innerGlowSize     = 0.0;
}

- (void)drawContentRect:(CGRect)rect 
              inContext:(CGContextRef)ctx
{
    // implement this method in your subclass
}

- (void)drawRect:(CGRect)rect
{
    CGSize s = rect.size;
    CGRect r = (CGRect){CGPointZero, s};
    
    UIGraphicsBeginImageContextWithOptions(s, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawContentRect:rect inContext:ctx];
    
    UIImage *contentImage = UIGraphicsGetImageFromCurrentImageContext();
    CGContextClearRect(ctx, r);
    
    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextFillRect(ctx, r);
    CGContextTranslateCTM(ctx, 0.0, r.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextClipToMask(ctx, r, contentImage.CGImage);
    CGContextClearRect(ctx, r);
    CGContextRestoreGState(ctx);
    
    UIImage *inverted = UIGraphicsGetImageFromCurrentImageContext();
    CGContextClearRect(ctx, r);
    
    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, self.innerGlowColor.CGColor);
    CGContextSetShadowWithColor(ctx, CGSizeZero, self.innerGlowSize, self.innerGlowColor.CGColor);
    [inverted drawAtPoint:CGPointZero];
    CGContextTranslateCTM(ctx, 0.0, r.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextClipToMask(ctx, r, inverted.CGImage);
    CGContextClearRect(ctx, r);
    CGContextRestoreGState(ctx);
    UIImage *innerShadow = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextSetShadowWithColor(ctx, CGSizeZero, self.glowSize, self.glowColor.CGColor);
    [contentImage drawAtPoint:CGPointMake(0.0, 0.0)];
    CGContextRestoreGState(ctx);
    [innerShadow drawAtPoint:CGPointMake(0.0, 0.0)];
}

@end
