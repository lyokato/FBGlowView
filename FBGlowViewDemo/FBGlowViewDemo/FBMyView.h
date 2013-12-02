//
//  FBMyView.h
//  FBGlowViewDemo
//
//  Created by Lyo Kato on 2013/12/02.
//  Copyright (c) 2013年 OCTUDIO. All rights reserved.
//

#import <FBGlowView/FBGlowView.h>

@interface FBMyView : FBGlowView
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) UIColor *fillColor;
- (void)fitSize;
@end
