//
//  DynamicTableViewCell.h
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, copy) void(^reloadBlock) (void);

@end

NS_ASSUME_NONNULL_END
