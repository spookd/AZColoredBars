//
//  AZColoredBars.h
//  DR Nyheder
//
//  Created by Nicolai Persson on 11/10/13.
//  Copyright (c) 2013 Danish Broadcasting Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZColoredNavigationBar.h"
#import "AZColoredToolbar.h"

#define AZColoredBarsIntensityChanged      @"AZColoredBarsIntensityChanged"
#define AZColoredBarsIntensityChangedValue @"AZColoredBarsIntensityChangedValue"

@interface AZColoredBars : NSObject
+ (CGFloat)intensity;
+ (void)setIntensity:(CGFloat)intensity;
@end
