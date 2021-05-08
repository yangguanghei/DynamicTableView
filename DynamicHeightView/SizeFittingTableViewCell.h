//
//  SizeFittingTableViewCell.h
//  DynamicHeightView
//
//  Created by 梁森 on 2021/5/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SizeFittingTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^reloadBlock)(void);

@end

NS_ASSUME_NONNULL_END
