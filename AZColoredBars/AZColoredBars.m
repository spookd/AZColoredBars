//
//  AZColoredBars.m
//  DR Nyheder
//
//  Created by Nicolai Persson on 11/10/13.
//  Copyright (c) 2013 Danish Broadcasting Corporation. All rights reserved.
//

#import "AZColoredBars.h"

@implementation AZColoredBars
static CGFloat _intensity = .5f;

+ (CGFloat)intensity {
    return _intensity;
}

+ (void)setIntensity:(CGFloat)intensity {
    if (intensity == _intensity)
        return;
    
    intensity = (intensity > 1.f) ? 1.f : intensity;
    intensity = (intensity < 0.f) ? 0.f : intensity;
    
    _intensity = intensity;
    
    NSDictionary *userInfo = @{AZColoredBarsIntensityChangedValue: [NSNumber numberWithFloat:_intensity]};
    [NSNotificationCenter.defaultCenter postNotificationName:AZColoredBarsIntensityChanged object:nil userInfo:userInfo];
}
@end
