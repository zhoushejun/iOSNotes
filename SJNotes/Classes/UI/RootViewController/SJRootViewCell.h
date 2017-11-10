//
//  SJRootViewCell.h
//  SJNotes
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJItem;

@interface SJRootViewCell : UITableViewCell

- (void)loadContentWithData:(SJItem *)item indexPath:(NSIndexPath *)indexPath;

@end
