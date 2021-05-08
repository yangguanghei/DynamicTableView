//
//  SizeFittingTableViewCell.m
//  DynamicHeightView
//
//  Created by 梁森 on 2021/5/7.
//

#import "SizeFittingTableViewCell.h"
#import <Masonry.h>
#import "AutoTableViewCell.h"

@interface SizeFittingTableViewCell ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation SizeFittingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self initSubviews];
	}
	return self;
}

- (void)initSubviews{
	self.tableView.backgroundColor = [UIColor greenColor];
	[self.contentView addSubview:self.tableView];
	[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.right.top.bottom.equalTo(self.contentView);
	}];
	
	[self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//	if ([keyPath isEqualToString:@"contentSize"]) {
//		[self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
//			make.left.right.top.bottom.equalTo(self.contentView);
//			make.height.equalTo(@(self.tableView.contentSize.height));
//		}];
//		if (self.reloadBlock) {
//			self.reloadBlock();
//		}
//	}
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
	[self.tableView layoutIfNeeded];
	CGFloat h = self.tableView.contentSize.height;
	return CGSizeMake(targetSize.width, h);
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//	return 100.0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	AutoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(AutoTableViewCell.class) forIndexPath:indexPath];
	cell.contentView.backgroundColor = [UIColor redColor];
	return cell;
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		_tableView.backgroundColor = UIColor.whiteColor;
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.estimatedRowHeight = 1;
//		_tableView.rowHeight = UITableViewAutomaticDimension;
//		_tableView.sectionHeaderHeight = 0.0;
//		_tableView.sectionFooterHeight = 0.0;
		[_tableView registerClass:[AutoTableViewCell class] forCellReuseIdentifier:NSStringFromClass(AutoTableViewCell.class)];
	}
	return _tableView;
}
@end
