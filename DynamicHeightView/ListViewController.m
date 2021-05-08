//
//  ListViewController.m
//  DynamicHeightView
//
//  Created by 梁森 on 2020/11/20.
//

#import "ListViewController.h"

#import <Masonry/Masonry.h>

#import "ListTableView.h"

#import "SomeCellDynamicViewController.h"
#import "SizeFittingViewController.h"

@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource>
{
	NSInteger lines;
}
@property (nonatomic, strong) ListTableView *tableView;

@property (nonatomic, strong) UILabel * label;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.title = @"UITableView高度自适应";
	
	self.view.backgroundColor = UIColor.orangeColor;
	
	[self.view addSubview:self.tableView];
	[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.right.equalTo(self.view);
		make.top.equalTo(self.view.mas_top).offset(100);
	}];
	
	lines = 2;
	[self.tableView reloadData];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"改变行数" style:UIBarButtonItemStyleDone target:self action:@selector(changeLines)];
	
	[self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
	
	
	UIView * superView = [UIView new];
	[self.view addSubview:superView];
	self.label = [UILabel new];
	[superView addSubview:self.label];
	self.label.numberOfLines = 0;
	[superView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.view.mas_left).offset(10);
		make.right.equalTo(self.view.mas_right).offset(-10);
		make.top.equalTo(self.tableView.mas_bottom).offset(30);
	}];
	[self.label mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(superView.mas_left).offset(10);
		make.right.equalTo(superView.mas_right).offset(-10);
		make.top.equalTo(superView.mas_top).offset(10);
		make.bottom.equalTo(superView.mas_bottom).offset(-10);
	}];
	NSString * text = @"我是第一☝️我是第一☝️我是第一☝️我是第一☝️我是第一☝️我是第一☝️我是第一☝️";
	self.label.text = text;
	
	superView.backgroundColor = [UIColor greenColor];
	self.label.backgroundColor = [UIColor redColor];
	
	
	NSMutableArray * mutableArr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
	int count = 0;
	int first = 0;
	for (int i = 0; i < self.navigationController.viewControllers.count; i ++) {
		UIViewController * vc = self.navigationController.viewControllers[i];
		if ([vc isKindOfClass:[ListViewController class]]) {
			count ++;
			if (count == 1) {
				first = i;
			}
			if (count > 1) {
				[mutableArr removeObjectAtIndex:first];
				self.navigationController.viewControllers = mutableArr;
				break;
			}
		}
	}
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	NSString * text = @"我是第一☝️我是第一☝️我是第一☝️我是第一☝️我是第一☝️我是第一☝️我是第一☝️";
	NSString * text1 = @"你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️你是第一☝️";
	if ([self.label.text isEqualToString:text]) {
		self.label.text = text1;
	} else {
		self.label.text = text;
	}
	
	ListViewController * vc = [ListViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
	if ([keyPath isEqualToString:@"contentSize"]) {
		[self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
			make.left.right.equalTo(self.view);
			make.top.equalTo(self.view.mas_top).offset(100);
			make.height.equalTo(@(self.tableView.contentSize.height));
		}];
	}
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger row = indexPath.row;
	if (row == 0) {
		SizeFittingViewController * vc = [SizeFittingViewController new];
		[self.navigationController pushViewController:vc animated:YES];
	} else {
		SomeCellDynamicViewController * vc = [SomeCellDynamicViewController new];
		[self.navigationController pushViewController:vc animated:YES];
	}
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
