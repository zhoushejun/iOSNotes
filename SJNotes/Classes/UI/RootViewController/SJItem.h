//
//  SJItem.h
//  SJNotes
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

/**
 @file      SJItem.h
 @abstract  在 SJSystemFramesViewController 的 cell 中显示的内容 和 点击 cell 时响应的类
 @author    shejun.zhou
 @version   1.0 16/1/16 Creation
 */

#import <Foundation/Foundation.h>

@interface SJItem : NSObject

@property (nonatomic, strong) NSString *name; ///< 在 SJSystemFramesViewController 的 cell 中显示的内容
@property (nonatomic, strong) id object;///< 点击 cell 时响应的类

+ (instancetype)itemWithName:(NSString *)name object:(id)object;

@end
