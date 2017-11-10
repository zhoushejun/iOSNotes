//
//  DebugLog.h
//  SJNotes
//
//  Created by shejun.zhou on 16/1/17.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#ifndef DebugLog_h
#define DebugLog_h

/** @name DEBUG 模式下打印日志和当前行数 */
// @{
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content--->>> \n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define NSLogCurrentFunction     \
{NSString *functionName = [NSString stringWithFormat:@" %s ", __FUNCTION__];\
NSMutableString *flagString  = [NSMutableString string];\
for (int i = 0; i < functionName.length; i++) {\
    if (i == 0 || (i == functionName.length - 1)) {\
        [flagString appendString:@"+"];\
        continue;\
    }\
    [flagString appendString:@"-"];\
}\
NSString *logSting = [NSString stringWithFormat:@"\n%@\n%@\n%@\n", flagString, functionName, flagString];\
printf("%s", logSting.UTF8String);}
#else
#define NSLog(FORMAT, ...) nil
#define NSLogCurrentFunction nil;
#endif
// @}end of DEBUG 模式下打印日志和当前行数

#endif /* DebugLog_h */
