//
//  FRMoreHomeViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/10.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRMoreHomeViewController.h"
#import "FRAlbumHomeViewController.h"
@interface FRMoreHomeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation FRMoreHomeViewController

+(instancetype)sharedInstance
{
    static FRMoreHomeViewController  * singleton = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        singleton = [[self alloc]init];
    });
    return singleton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 2);
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"picturer";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBar.barTintColor = COLOR_YELLOW;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    self.navigationController.navigationBar.alpha = 0;
    
    [UIView animateWithDuration:0.6 animations:^{
        self.navigationController.navigationBar.alpha = 1;
    }];
    
}
#pragma mark -srcoll
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"滑动了");
    __weak typeof(self)weakSelf = self;
    if (scrollView.contentOffset.y < -120) {
        
        [UIView animateWithDuration:0.5 animations:^{

        } completion:^(BOOL finished) {
            
        }];
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
