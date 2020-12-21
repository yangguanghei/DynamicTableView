//
//  SomeCellDynamicViewController.m
//  DynamicHeightView
//
//  Created by 梁森 on 2020/12/21.
//

#import "SomeCellDynamicViewController.h"

#import "ListTableView.h"
#import "SomeDynamicTableViewCell.h"

@interface SomeCellDynamicViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ListTableView *tableView;

@end

@implementation SomeCellDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	SomeDynamicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
	cell.titleLabel.text = @"可自适应高度多的点点滴滴看见啊来反馈京津冀斤斤计较斤斤计立刻就看见了就离开家了快乐健康逻辑快乐健康了快乐较斤斤计较。斤斤计较零零落落零零落落零零落落零零落落可自适应高度可自适应高度可自适应高度可自适应高度😄";
	return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger row = indexPath.row;
	if (row == 0) {
		self.tableView.rowHeight = UITableViewAutomaticDimension;
		return self.tableView.rowHeight;
	} else {
		return 80;
	}
}

- (ListTableView *)tableView {
	if (!_tableView) {
		_tableView = [[ListTableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
		_tableView.backgroundColor = UIColor.whiteColor;
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.estimatedSectionHeaderHeight = 0.0;
		_tableView.estimatedSectionFooterHeight = 0.0;
		[_tableView registerClass:[SomeDynamicTableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
	}
	return _tableView;
}

@end
