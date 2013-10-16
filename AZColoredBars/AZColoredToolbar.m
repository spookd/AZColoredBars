//
//  AZColoredToolbar.m
//  DR Nyheder
//
//  Created by Nicolai Persson on 11/10/13.
//  Copyright (c) 2013 Danish Broadcasting Corporation. All rights reserved.
//

#import "AZColoredToolbar.h"
#import "AZColoredBars.h"

@interface AZColoredToolbar() {
    CALayer *colorLayer;
}
- (void)intensityChanged:(NSNotification *)notification;

@property(nonatomic, readonly) CALayer *colorLayer;
@end

@implementation AZColoredToolbar

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
    
    CGRect frame = self.bounds;
    frame.origin = CGPointZero;
    
    self.colorLayer.frame = frame;
    colorLayer.opacity    = AZColoredBars.intensity;
    
    [self.colorLayer removeFromSuperlayer];
    [self.layer insertSublayer:self.colorLayer atIndex:1];
}

@end
