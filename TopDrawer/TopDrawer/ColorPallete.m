//
//  ColorPallete.m
//  Rotten Mangoes
//
//  Created by Carl Udren on 2/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ColorPallete.h"

@implementation ColorPallete

+ (instancetype) defaultColorPallete{
    
    static ColorPallete *defaultColorPallete;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultColorPallete = [[self alloc] init];
    });
    return defaultColorPallete;
}

- (instancetype) init{
    self = [super init];
    if (self) {
        _primaryColor = [UIColor colorWithRed:21.0/255.0 green:44.0/255.0 blue:64.0/255.0 alpha:1.0];
        _secondaryColor = [UIColor colorWithRed:153.0/255.0 green:173.0/255.0 blue:191.0/255.0 alpha:1.0];
        _accentColor = [UIColor colorWithRed:4.0/255.0 green:119.0/255.0 blue:191.0/255.0 alpha:1.0];
        _fourthColor = [UIColor colorWithRed:97.0/255.0 green:120.0/255.0 blue:140.0/255.0 alpha:1.0];
    }
    return self;
}

@end
