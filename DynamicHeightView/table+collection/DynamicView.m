//
//  DynamicView.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "DynamicView.h"
#import "DynamicCollectionViewCell.h"
#import <Masonry/Masonry.h>

static NSString *identify = @"DynamicCollectionViewCell";

@interface DynamicView () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation DynamicView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self);
//        make.height.equalTo(@(0));
    }];
	
	self.collectionView.backgroundColor = [UIColor greenColor];
    
//    [self.collectionView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    if ([keyPath isEqualToString:@"contentSize"]) {
//        CGFloat height = self.collectionView.contentSize.height;
//        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@(height));
//        }];
//    }
//}

- (void)setDataArr:(NSArray *)dataArr{
	_dataArr = dataArr;
	[self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DynamicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.title = self.dataArr[indexPath.row];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60.0, 60.0);
}

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout colorForSectionAtIndex:(NSInteger)section {
    return [UIColor whiteColor];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第 %@ 个item",@(indexPath.item));
}

#pragma mark - getter

- (DynamicCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10.0;
        layout.minimumInteritemSpacing = 10.0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[DynamicCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[DynamicCollectionViewCell class] forCellWithReuseIdentifier:identify];
		
    }
    return _collectionView;
}

@end


