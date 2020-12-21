//
//  SomeDynamicTableViewCell.m
//  DynamicHeightView
//
//  Created by 梁森 on 2020/12/21.
//

#import "SomeDynamicTableViewCell.h"

#import <Masonry/Masonry.h>

@interface SomeDynamicTableViewCell ()


@end

@implementation SomeDynamicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		
		[self.contentView addSubview:self.titleLabel];
		[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
			make.left.equalTo(self.contentView.mas_left).offset(10);
			make.right.equalTo(self.contentView.mas_right).offset(-10);
			make.top.equalTo(self.contentView.mas_top).offset(10);
			make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
		}];
		
	}
	return  self;
}

- (UILabel *)titleLabel{
	if (_titleLabel == nil) {
		_titleLabel = [UILabel new];
		_titleLabel.numberOfLines = 0;
	}
	return _titleLabel;
}

@end
