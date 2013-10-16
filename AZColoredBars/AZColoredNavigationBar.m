//
//  AZColoredNavigationBar.m
//  AZColoredNavigationBar
//
//  Created by Alan on 23/09/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZColoredNavigationBar.h"
#import "AZColoredBars.h"

#ifndef StatusBarHeight
#define StatusBarHeight UIApplication.sharedApplication.statusBarFrame.size.height
#endif

@interface AZColoredNavigationBar() {
    CALayer *colorLayer;
}
@property(nonatomic, readonly) CALayer *colorLayer;
@end

@implementation AZColoredNavigationBar

- (void)listenForChanges {
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(intensityChanged:) name:AZColoredBarsIntensityChanged object:nil];
}

////////////////////////////////////////////////////////////////////////////////////
///  Initialization + teardown
////////////////////////////////////////////////////////////////////////////////////

- (id)init {
    if (self = [super init]) {
        [self listenForChanges];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self listenForChanges];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self listenForChanges];
    }
    
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

////////////////////////////////////////////////////////////////////////////////////
///  Apply the tint color to our "intensity"-layer
////////////////////////////////////////////////////////////////////////////////////

- (void)setBarTintColor:(UIColor *)barTintColor {
    [super setBarTintColor:barTintColor];
    
    if (UIDevice.currentDevice.systemVersion.integerValue < 7)
        return;
    
    self.colorLayer.backgroundColor = barTintColor.CGColor;
}

////////////////////////////////////////////////////////////////////////////////////
///  :-)
////////////////////////////////////////////////////////////////////////////////////

- (void)intensityChanged:(NSNotification *)notification {
    [self setNeedsLayout];
}

- (CALayer *)colorLayer {
    if (!colorLayer) {
        colorLayer = CALayer.layer;
    }
    
    return colorLayer;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (UIDevice.currentDevice.systemVersion.integerValue < 7)
        return;
    
    CGFloat statusBarHeight = StatusBarHeight;
    self.colorLayer.frame   = CGRectMake(0.f, -statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
    self.colorLayer.opacity = AZColoredBars.intensity;
    
    [self.colorLayer removeFromSuperlayer];
    [self.layer insertSublayer:self.colorLayer atIndex:1];
}

@end
