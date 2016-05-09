//
//  FRAlbumHomeViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/9.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRAlbumHomeViewController.h"

@interface FRAlbumHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * albumTableView;

@end

@implementation FRAlbumHomeViewController
-(UITableView *)albumTableView
{
    if (!_albumTableView) {
        _albumTableView = [[UITableView alloc]init];
        [self.view addSubview:_albumTableView];
    }
    return _albumTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumTableView.delegate = self;
    self.albumTableView.dataSource = self;
    [self.albumTableView registerNib:[UINib nibWithNibName:@"FRAlbumCell" bundle:nil] forCellReuseIdentifier:@"AlbumCell"];
    [self createSubview];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //**设置nav*/
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"picturer";

    
    
}
#pragma mark - setup UI
-(void)createSubview
{
    
    UIImageView * searchView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    searchView.image = [UIImage imageNamed:@"search"];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonClick:)];
    leftItem.customView = searchView;
    
    UIImageView * cameraView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    cameraView.image = [UIImage imageNamed:@"camera"];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraButtonClick:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.albumTableView.frame = self.view.frame;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.albumTableView];
    
    UIButton * bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT - ADD_ALBUM_H - ADD_ALBUM_H, SCREEN_WIDTH, ADD_ALBUM_H);
    bottomButton.backgroundColor = COLOR_YELLOW;
    
    UIImageView * addImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add01"]];
    addImageView.frame = CGRectMake(SCREEN_WIDTH / 2 - 20, 10, 40, 40);
    
    [bottomButton addSubview:addImageView];
    [bottomButton addTarget:self action:@selector(pullCreateAlbumTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bottomButton];
    
}
#pragma mark - action
-(void)searchButtonClick:(UIBarButtonItem *)_b
{
    
}
-(void)cameraButtonClick:(UIBarButtonItem *)_b
{
    
}
/**
 *  点击add按钮创建视图
 *
 */
-(void)pullCreateAlbumTap:(UIButton *)button
{
    UIView * addView = [button.subviews lastObject];
    static BOOL isOpen = NO;
    if (isOpen == NO) {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            [addView setTransform:CGAffineTransformMakeRotation( (90+45) * (CGFloat)(M_PI) / 180.0)];
            /**弹出创建相册album的视图    */
            
            
        } completion:^(BOOL finished) {
            isOpen = YES;
        }];
    } else {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //相对于当前变换后的位置来变换回去。
            addView.transform = CGAffineTransformRotate(CGAffineTransformMakeRotation((90+45) * (CGFloat)(M_PI) / 180.0), (- (90+45) * (CGFloat)(M_PI) / 180.0));
            /**收回创建相册album的视图    */
            
            
            
            NSLog(@"nononono");
        } completion:^(BOOL finished) {
            isOpen = NO;
        }];
        
    }
    
    

}
#pragma mark 编辑按钮
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.albumTableView setEditing:YES animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark 在滑动手势删除某一行的时候，显示出更多的按钮
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath

{
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //从左滑到右的动画
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        //NSLog(@"点击了删除");
        UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:@"确定删除相册？" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           // NSLog(@"删除");
        }];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //do nothing
            //NSLog(@"取消");
        }];
        [alertVc addAction:cancelAction];
        [alertVc addAction:sureAction];
        [self presentViewController:alertVc animated:YES completion:nil];
        
        // 1. 更新数据
        //[_allDataArray removeObjectAtIndex:indexPath.row];
        
        // 2. 更新UI
        
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    // 添加一个分享按钮
    
    UITableViewRowAction * shareRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"分享" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //从左滑到右的动画
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        //NSLog(@"点击了分享");
    }];
    shareRowAction.backgroundColor = COLOR_YELLOW;
    //shareRowAction.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    /*
     //    // 添加一个置顶按钮
     
     UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
     
     NSLog(@"点击了置顶");
     // 1. 更新数据
     
     //[_allDataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
     
     // 2. 更新UI
     
     NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
     [tableView moveRowAtIndexPath:indexPath toIndexPath:firstIndexPath];
     
     }];
     
     topRowAction.backgroundColor = [UIColor lightGrayColor];
     */
    // 添加一个编辑按钮
    UITableViewRowAction * editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"编辑" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //从左滑到右的动画
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        //NSLog(@"点击了编辑");
    }];
    editRowAction.backgroundColor = [UIColor lightGrayColor];
    // 将设置好的按钮放到数组中返回
    return @[deleteRowAction,shareRowAction,editRowAction];
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 100;
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * cellID = @"AlbumCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    return cell;
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
