//
//  AutoTableViewCell.m
//  DynamicHeightView
//
//  Created by 梁森 on 2021/5/7.
//

#import "AutoTableViewCell.h"

#import <Masonry.h>

@implementation AutoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self initSubviews];
	}
	return self;
}

- (void)initSubviews{
	UILabel * lbl = [UILabel new];
	[self.contentView addSubview:lbl];
	lbl.numberOfLines = 0;
	[lbl mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.right.top.equalTo(self.contentView);
		make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
	}];
	lbl.text = @"打开看得见老家的经济困境库达科技；考六级啊打开了房间啊都是风急浪大睡觉了极大了解对方离开";
}



@end
