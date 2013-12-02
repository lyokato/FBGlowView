//
//  FBMyView.m
//  FBGlowViewDemo
//
//  Created by Lyo Kato on 2013/12/02.
//  Copyright (c) 2013年 OCTUDIO. All rights reserved.
//

#import "FBMyView.h"

@implementation FBMyView

- (void)fitSize
{
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.padding*2 + self.width,
                            self.padding*2+self.height);
}

- (void)drawContentRect:(CGRect)rect inContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(self.padding, self.padding, self.width, self.height));
}
@end
