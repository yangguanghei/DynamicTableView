//
//  ListTableView.m
//  DynamicHeightView
//
//  Created by 梁森 on 2020/11/20.
//

#import "ListTableView.h"

@implementation ListTableView

- (void)layoutSubviews {
	[super layoutSubviews];

	// 如果不相等就更新
	if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])) {
		[self invalidateIntrinsicContentSize];
	}
}

- (CGSize)intrinsicContentSize {
	return self.contentSize;
}

@end
