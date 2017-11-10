//
//  PublicMacros.h
//  SJNotes
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#ifndef PublicMacros_h
#define PublicMacros_h

/** @name version */
// @{
#define CurrentDevice        [UIDevice currentDevice]
#define CurrentSystemVersion [CurrentDevice systemVersion]
#define IOS_VERSION          [CurrentSystemVersion floatValue]
// @}end of version

/** @name 获取屏幕 宽度、高度 */
// @{
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// @}end of 获取屏幕 宽度、高度

#endif /* PublicMacros_h */
