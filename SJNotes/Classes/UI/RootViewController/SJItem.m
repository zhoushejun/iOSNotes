//
//  SJItem.m
//  SJNotes
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJItem.h"

@implementation SJItem

+ (instancetype)itemWithName:(NSString *)name object:(id)object {
    SJItem *item = [[[self class] alloc] init];
    item.name = name;
    item.object = object;
    
    return item;
}

@end
