//
//  SizeFittingViewController.m
//  DynamicHeightView
//
//  Created by 梁森 on 2021/5/7.
//

#import "SizeFittingViewController.h"
#import "SizeFittingTableViewCell.h"

/// systemLayoutSizeFitting使用
@interface SizeFittingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation SizeFittingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews{
	[super viewDidLayoutSubviews];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger row = indexPath.row;
	if (row == 0) {
		SizeFittingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(SizeFittingTableViewCell.class) forIndexPath:indexPath];
		cell.reloadBlock = ^{
			[self.tableView reloadData];
		};
		return cell;
	} else {
		UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
		cell.textLabel.text = [NSString stringWithFormat:@"%lu", row];
		return cell;
	}
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
		_tableView.backgroundColor = UIColor.whiteColor;
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.estimatedRowHeight = 200;
		_tableView.rowHeight = UITableViewAutomaticDimension;
		[_tableView registerClass:[SizeFittingTableViewCell class] forCellReuseIdentifier:NSStringFromClass(SizeFittingTableViewCell.class)];
		[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
	}
	return _tableView;
}

@end
