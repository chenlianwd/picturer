//
//  SocialViewController.m
//  picturer
//
//  Created by 陈亮 on 16/5/12.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "SocialViewController.h"
#import "FRSocialhomeCollectionViewCell.h"

#import "FRMyhomeViewController.h"
#import "FRCollectionViewController.h"
#import "FRFoundingViewController.h"
#import "FRFriendViewController.h"
#import "FRMiaorenViewController.h"
#import "FRSettingViewController.h"
#import "FRAdressListViewController.h"

typedef NS_ENUM(NSInteger,FRSocialIndex) {
    FRSocialIndexMyHome,
    FRSocialIndexFriend,
    FRSocialIndexmiaoren,
    FRSocialIndexFound,
    FRSocialIndexCollection,
    FRSocialIndexAddressList,
    FRSocialIndexSetting,
};

@interface SocialViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * imgArr ;
@property (nonatomic, strong) NSArray * nameArr;
@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    //注册cell
    [self.collectionView registerClass:[FRSocialhomeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    /**
     *  其实数组应该只设7个元素，可是collectionView 的cell个数没超过的话，又滑动不了，只好多弄几个进去了，想想还有别的解决办法没有。
     */
    _imgArr = @[@"icon_1",@"icon_2",@"icon_3",@"icon_4",@"icon_5",@"icon_6",@"icon_7",@"",@"",@"",@"",@""];
    _nameArr = @[@"主页",@"朋友",@"妙人",@"发现",@"收藏",@"通讯录",@"设置",@"",@"",@"",@"",@""];
}
//**以下两方法是改变来回切换后navigationbar的状态、颜色及文字 、其他*/
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = COLOR_YELLOW;
    //前景色黑色即字体变黑色
 
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //**设置nav*/
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    self.navigationController.navigationBar.translucent = NO;
}
#pragma mark -- setup UI
-(void)setupUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //self.navigationController.navigationBar.barTintColor = COLOR_YELLOW;
    //self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"picturer";
    
    self.navigationItem.hidesBackButton = YES;
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.scrollEnabled = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.view addSubview:self.collectionView];
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    FRSocialhomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        //NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    if (indexPath.row>7) {
        cell.imgView.image = nil;
        cell.label.text = nil;
    } else {
        cell.imgView.image = [UIImage imageNamed:_imgArr[indexPath.row]];
        cell.label.text = _nameArr[indexPath.row];
    }
    
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //如果总的cell没有超过屏幕就不能滑动了。。
    return CGSizeMake((SCREEN_WIDTH-40)/3, (SCREEN_HEIGHT-10)/4);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}
//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   // NSLog(@"选择%ld",indexPath.row);
    switch (indexPath.row) {
        case FRSocialIndexMyHome:
            [self.navigationController pushViewController:[FRMyhomeViewController new] animated:YES];
        
            break;
        case FRSocialIndexFriend:
            [self.navigationController pushViewController:[FRFriendViewController new] animated:YES];
            break;
        case FRSocialIndexmiaoren:
            [self.navigationController pushViewController:[FRMiaorenViewController new] animated:YES];
            break;
        case FRSocialIndexFound:
            [self.navigationController pushViewController:[FRFoundingViewController new] animated:YES];
            break;
        case FRSocialIndexCollection:
            [self.navigationController pushViewController:[FRCollectionViewController new] animated:YES];
            break;
        case FRSocialIndexAddressList:
            [self.navigationController pushViewController:[FRAdressListViewController new] animated:YES];
            break;
        case FRSocialIndexSetting:
            [self.navigationController pushViewController:[FRSettingViewController new] animated:YES];
            break;
        default:
            break;
    }
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    __weak typeof(self)weakSelf = self;
    if (scrollView.contentOffset.y < -120) {
        //NSLog(@"gogogo");
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.collectionView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.collectionView.bounds.size.height);
        
        }];
        [self.navigationController popViewControllerAnimated:NO];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
