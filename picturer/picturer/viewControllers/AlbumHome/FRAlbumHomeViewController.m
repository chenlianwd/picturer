//
//  FRAlbumHomeViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/9.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRAlbumHomeViewController.h"
#import "FRPresentingView.h"
#import "FRSearchViewController.h"
#import "FRAlbumCell.h"

#import "SocialViewController.h"

@interface FRAlbumHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView * albumTableView;
@property (nonatomic, strong) FRPresentingView * PresentingView;
@property (nonatomic ,strong)UIButton * bottomButton;
@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, assign) BOOL isOuting;

@end

@implementation FRAlbumHomeViewController
{
    //伪造数据
    NSArray * imgArr;
    NSArray * nameArr;
}


+(instancetype)sharedInstance
{
    static FRAlbumHomeViewController  * singleton = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        singleton = [[self alloc]init];
    });
    return singleton;
}
-(FRPresentingView *)PresentingView
{
    if (!_PresentingView) {
        _PresentingView = [[FRPresentingView alloc]init];
    }
    return _PresentingView;
}
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
    _isOuting = NO;
    [self.albumTableView registerNib:[UINib nibWithNibName:@"FRAlbumCell" bundle:nil] forCellReuseIdentifier:@"AlbumCell"];
    [self createSubview];
    //伪造的数据
    imgArr = @[@"user_1.jpg",@"user_2.jpg",@"user_3.jpg",@"user_4.jpg",@"user_5.jpg",@"user_6.jpg",@"user_7.jpg",@"user_8.jpg",@"user_9.jpg",@"user_10.jpg",@"user_11.jpg"];
    nameArr = @[@"album",@"朋友",@"尤克里里",@"kindle",@"收藏",@"arc",@"mrc",@"可乐",@"屋檐",@"50_cent的相册",@"奇怪"];
    
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
//    UIImageView * headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 20, 20)];
//    headImgView.image = [UIImage imageNamed:@"picturer"];
    //self.navigationItem.titleView = headImgView;
    
    self.navigationItem.title = @"picturer";
    //恢复frame
   self.bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT - ADD_ALBUM_H - ADD_ALBUM_H, SCREEN_WIDTH, ADD_ALBUM_H);
    //NSLog(@"%g",self.view.frame.origin.y);
   
}
#pragma mark - setup UI
-(void)createSubview
{
    UIImageView * bgImgView = [[UIImageView alloc]initWithFrame:self.view.frame];
    bgImgView.image = [UIImage imageNamed:@"blurBg"];
    [self.view addSubview:bgImgView];
    
    
    _contentView = [[UIView alloc]initWithFrame:self.view.frame];
    _contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contentView];

    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchButtonClick:)];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"camera"] style:UIBarButtonItemStylePlain target:self action:@selector(cameraButtonClick:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
 
    

    
    self.albumTableView.frame = self.view.frame;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [_contentView addSubview:self.albumTableView];
    
    //**创建相册的弹出视图*/
    
    self.PresentingView.backgroundColor = [UIColor whiteColor];
    [_contentView addSubview:self.PresentingView];
    
    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT - ADD_ALBUM_H - ADD_ALBUM_H, SCREEN_WIDTH, ADD_ALBUM_H);
    self.bottomButton.backgroundColor = COLOR_YELLOW;
    
    UIImageView * addImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add01"]];
    addImageView.frame = CGRectMake(SCREEN_WIDTH / 2 - 20, 10, 40, 40);
    
    [self.bottomButton addSubview:addImageView];
    [self.bottomButton addTarget:self action:@selector(pullCreateAlbumTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bottomButton];
    
    
}
#pragma mark - action
-(void)searchButtonClick:(UIBarButtonItem *)_b
{
    FRSearchViewController * searchVc = [FRSearchViewController sharedInstance];
    searchVc.view.frame = self.view.bounds;
    [self addChildViewController:searchVc];
    [self.view addSubview:searchVc.view];
    //NSLog(@"aaa");
    
}
//调用相机
-(void)cameraButtonClick:(UIBarButtonItem *)_b
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;  //是否可编辑
        //摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        //如果没有提示用户
        
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"未发现摄像头" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertVc addAction:action];
        [self presentViewController:alertVc animated:YES completion:nil];
    }
    
    
}
//拍摄完成后要执行的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //得到图片
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //图片存入系统相册
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    //**保存到自己的相册*/
#warning mark----------------------------------
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

/**
 *  点击add按钮创建视图
 *
 */
-(void)pullCreateAlbumTap:(UIButton *)button
{
    UIView * addView = [button.subviews lastObject];
    addView.tag = 111;
    static BOOL isOpen = NO;
    __weak typeof(self)weakSelf = self;
    if (isOpen == NO) {
        self.PresentingView.frame = CGRectMake(0, SCREEN_HEIGHT - 150, SCREEN_HEIGHT, 100);
        
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            [addView setTransform:CGAffineTransformMakeRotation( (90+45) * (CGFloat)(M_PI) / 180.0)];
            /**弹出创建相册album的动画    */
    
            weakSelf.PresentingView.frame = CGRectMake(0, SCREEN_HEIGHT - button.bounds.size.height - 150, SCREEN_WIDTH, 100);
            
            
        } completion:^(BOOL finished) {
            weakSelf.albumTableView.userInteractionEnabled = NO;
            isOpen = YES;
        }];
    } else {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //相对于当前变换后的位置来变换回去。
            addView.transform = CGAffineTransformRotate(CGAffineTransformMakeRotation((90+45) * (CGFloat)(M_PI) / 180.0), (- (90+45) * (CGFloat)(M_PI) / 180.0));
            /**收回创建相册album的视图    */
            
            weakSelf.PresentingView.frame = CGRectMake(0, SCREEN_HEIGHT - 100 , SCREEN_WIDTH, 100);
            
            
        } completion:^(BOOL finished) {
            weakSelf.albumTableView.userInteractionEnabled = YES;
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
#pragma mark 在滑动某一行的时候，显示出更多的按钮
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
    return 90;
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * cellID = @"AlbumCell";
    FRAlbumCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:imgArr[indexPath.row]];
    cell.albumName.text = nameArr[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - touch superView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"touch");
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        //相对于当前变换后的位置来变换回去。
        UIView * addView = [self.view viewWithTag:111];//**用tag找到addView*/
        addView.transform = CGAffineTransformRotate(CGAffineTransformMakeRotation((90+45) * (CGFloat)(M_PI) / 180.0), (- (90+45) * (CGFloat)(M_PI) / 180.0));
        /**收回创建相册album的视图    */
        
        weakSelf.PresentingView.frame = CGRectMake(0, SCREEN_HEIGHT , SCREEN_WIDTH, 100);
        
        
    } completion:^(BOOL finished) {
        weakSelf.albumTableView.userInteractionEnabled = YES;
    }];

    
}
#pragma mark -srcoll
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   //NSLog(@"huahuahuahau");
    _contentView.frame = CGRectMake(0,- scrollView.contentOffset.y, SCREEN_WIDTH, SCREEN_HEIGHT);

    
}
//结束滑动
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    __weak typeof(self)weakSelf = self;
    if (_isOuting == NO) {
        
        if (scrollView.contentOffset.y < -120) {
            _isOuting = YES;
            
            [UIView animateWithDuration:0.4 animations:^{
    
                //改contentView的frame
                weakSelf.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, weakSelf.view.bounds.size.height);
                weakSelf.bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, weakSelf.view.bounds.size.height);

                //weakSelf.contentView.alpha = 0;
                //[self presentViewController:[FRSocialHomeViewController new] animated:NO completion:nil];
                //[self.navigationController pushViewController:[FRSocialHomeViewController new] animated:NO];
                
                [self.navigationController pushViewController:[SocialViewController new] animated:NO];
            } completion:^(BOOL finished) {
            //
               
                
            }];
            
            //[self.contentView removeFromSuperview];
            
                    }

    }
    else if (_isOuting == YES) {

        if (scrollView.contentOffset.y < -120) {
            _isOuting = NO;
            [UIView animateWithDuration:0.4 animations:^{
                 
                
            }];
            self.contentView.frame = self.view.frame;
           // weakSelf.contentView.alpha = 1;
            
        }
        
    }
    [self.view layoutIfNeeded];
    
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
