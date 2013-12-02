//
//  FBViewController.m
//  FBGlowViewDemo
//
//  Created by Lyo Kato on 2013/12/02.
//  Copyright (c) 2013年 OCTUDIO. All rights reserved.
//

#import "FBViewController.h"
#import "FBMyView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]


@interface FBViewController ()

@end

@implementation FBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    [self setupGlowView];
}

- (void)setupGlowView
{
    FBMyView *v = [[FBMyView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    v.width = 30;
    v.height = 20;
    v.padding = 30;
    v.fillColor = UIColorFromRGB(0xffdd66);
    v.innerGlowColor = UIColorFromRGB(0xee3300);
    v.glowColor = UIColorFromRGB(0xee3300);
    v.innerGlowSize = 5.0;
    v.glowSize = 10.0f;
    [v fitSize];
    [self.view addSubview:v];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
