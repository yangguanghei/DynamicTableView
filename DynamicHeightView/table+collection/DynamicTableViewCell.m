//
//  DynamicTableViewCell.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "DynamicTableViewCell.h"
#import "DynamicView.h"
#import <Masonry/Masonry.h>

@interface DynamicTableViewCell ()
{
	BOOL _hasSec;
}
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) DynamicView *dynamicView;

@end

@implementation DynamicTableViewCell

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority {
    CGSize size = [super systemLayoutSizeFittingSize:targetSize withHorizontalFittingPriority:horizontalFittingPriority verticalFittingPriority:verticalFittingPriority];
    [self.dynamicView.collectionView layoutIfNeeded];
    CGFloat height = self.dynamicView.collectionView.collectionViewLayout.collectionViewContentSize.height;
    return CGSizeMake(size.width, height + size.height);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return  self;
}

- (void)setupSubViews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.dynamicView];
        
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20.0);
        make.right.lessThanOrEqualTo(self.contentView.mas_right).offset(-20);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(10.0);
    }];
    
    [self.dynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
		make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
	
	_hasSec = YES;
	self.contentView.backgroundColor = [UIColor orangeColor];

}

- (void)clickLbl:(UITapGestureRecognizer *)tap{
	_hasSec = !_hasSec;
	if (self.reloadBlock) {
		self.reloadBlock();
	}
}


#pragma mark - setter

- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    self.dynamicView.dataArr = dataArr;
}

#pragma mark - getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"点击改变数据源";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
		UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLbl:)];
		[_titleLabel addGestureRecognizer:tap];
		_titleLabel.backgroundColor = [UIColor redColor];
		_titleLabel.userInteractionEnabled = YES;
    }
    return  _titleLabel;
}

- (DynamicView *)dynamicView {
    if (!_dynamicView) {
        _dynamicView = [[DynamicView alloc] init];
    }
    return _dynamicView;
}

@end
