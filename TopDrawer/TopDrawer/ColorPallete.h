//
//  ColorPallete.h
//  Rotten Mangoes
//
//  Created by Carl Udren on 2/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorPallete : NSObject

@property (strong, nonatomic) UIColor *primaryColor;
@property (strong, nonatomic) UIColor *secondaryColor;
@property (strong, nonatomic) UIColor *accentColor;
@property (strong, nonatomic) UIColor *fourthColor;

+ (instancetype) defaultColorPallete;


@end
