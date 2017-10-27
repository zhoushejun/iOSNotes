//
//  UIColor+Random.m
//  SJNotes
//
//  Created by jocentzhou on 2017/10/27.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+ (UIColor *)randomColor {
    CGFloat r = (arc4random()%255)/255.0;
    CGFloat g = (arc4random()%255)/255.0;
    CGFloat b = (arc4random()%255)/255.0;
    return [[UIColor alloc] initWithRed:r green:g blue:b alpha:1.0];
}

@end
