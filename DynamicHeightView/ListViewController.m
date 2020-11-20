//
//  ListViewController.m
//  DynamicHeightView
//
//  Created by 梁森 on 2020/11/20.
//

#import "ListViewController.h"

#import <Masonry/Masonry.h>

#import "ListTableView.h"

@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource>
{
	NSInteger lines;
}
@property (nonatomic, strong) ListTableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.backgroundColor = UIColor.orangeColor;
	
//	UIView * redBackView = [UIView new];
//	redBackView.backgroundColor = [UIColor redColor];
//	[self.view addSubview:redBackView];
//
//	[redBackView mas_makeConstraints:^(MASConstraintMaker *make) {
//		make.top.equalTo(self.view.mas_top).offset(100);
//		make.left.right.equalTo(self.view);
//	}];
	
	[self.view addSubview:self.tableView];
	[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.right.equalTo(self.view);
		make.top.equalTo(self.view.mas_top).offset(100);
	}];
	
	lines = 2;
	[self.tableView reloadData];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"改变行数" style:UIBarButtonItemStyleDone target:self action:@selector(changeLines)];
}

- (void)changeLines{
	if (lines == 2) {
		lines = 5;
	} else {
		lines = 2;
	}
	[self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return lines;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
	cell.backgroundColor = [UIColor greenColor];
	return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return  80;
}

- (ListTableView *)tableView {
	if (!_tableView) {
		_tableView = [[ListTableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
		_tableView.backgroundColor = UIColor.whiteColor;
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.estimatedSectionHeaderHeight = 0.0;
		_tableView.estimatedSectionFooterHeight = 0.0;
		[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
	}
	return _tableView;
}

@end