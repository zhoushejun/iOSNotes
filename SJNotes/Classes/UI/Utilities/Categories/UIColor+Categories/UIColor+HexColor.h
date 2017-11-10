//
//  UIColor+HexColor.h
//  WeHalal
//
//  Created by ChenGe on 14-8-6.
//  Copyright (c) 2014年 Panda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorFromHexString:(NSString *)hexString;

+(UIColor *)colorWithHexString:(NSString *)hexStr;

@end
