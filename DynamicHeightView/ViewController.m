//
//  ViewController.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "ViewController.h"
#import "DynamicTableViewCell.h"

#import "ListViewController.h"

static NSString *identify = @"DynamicTableViewCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray * anotherArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.title = @"高度动态布局";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"动态高度" style:UIBarButtonItemStyleDone target:self action:@selector(goToListVC)];
}

- (void)goToListVC{
	ListViewController * listVC = [ListViewController new];
	[self.navigationController pushViewController:listVC animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    cell.dataArr = self.dataSource[indexPath.row];
	__weak typeof(self) weakSelf = self;
	cell.reloadBlock = ^{
		if (weakSelf.dataSource.count != weakSelf.anotherArray.count) {
			weakSelf.dataSource = weakSelf.anotherArray;
		} else {
			weakSelf.dataSource = weakSelf.dataArr;
		}
		[weakSelf.tableView reloadData];
	};
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return tableView.rowHeight;
//}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 300.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
        [_tableView registerClass:[DynamicTableViewCell class] forCellReuseIdentifier:identify];
    }
    return _tableView;
}

- (NSArray *)dataSource{
	if (_dataSource == nil) {
		_dataSource = self.dataArr;
	}
	return _dataSource;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"成都",@"天津"],
					 @[@"重庆",@"武汉",@"贵阳",@"郑州",@"济南",@"西安",@"合肥",@"南京",@"南宁",@"太原",@"昆明",@"福州"],
					 @[@"宁波",@"青岛",@"大连",@"珠海",@"厦门",@"上海",@"烟台"],
					 @[@"金堂",@"金牛",@"内江",@"高新",@"合肥",@"合肥",@"合肥"],
					 @[@"合肥",@"合肥",@"合肥",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明",@"昆明"],
					 @[@"珠海",@"珠海",@"珠海",@"珠海",@"珠海",@"珠海",@"珠海"],
					 @[@"绵阳",@"绵阳",@"绵阳",@"绵阳",@"绵阳",@"绵阳",@"绵阳"]
					];
    }
    return _dataArr;
}

- (NSArray *)anotherArray {
	if (_anotherArray == nil) {
		_anotherArray = @[@[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"],
						  @[@"😄", @"😄", @"😄"]
						 ];
	}
	return _anotherArray;
}
@end
