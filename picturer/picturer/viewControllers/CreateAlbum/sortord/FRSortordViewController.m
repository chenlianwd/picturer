//
//  FRSortordViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/12.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRSortordViewController.h"

@interface FRSortordViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *timeOrderImg;
@property (weak, nonatomic) IBOutlet UIImageView *timeUnOrderImg;
@property (weak, nonatomic) IBOutlet UIButton *timeOrderBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeUnOrderBtn;

@end

@implementation FRSortordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.timeOrderImg.hidden = YES;
    self.timeUnOrderImg.hidden = YES;
    [self createSubviews];
}

- (IBAction)timeOrderTap:(UIButton *)sender {
    self.timeOrderImg.hidden = NO;
    self.timeUnOrderImg.hidden = YES;
   
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(@"按上传时间顺序排列");
    }
}
- (IBAction)timeUnOrdertap:(UIButton *)sender {
    self.timeOrderImg.hidden = YES;
    self.timeUnOrderImg.hidden = NO;
    
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(@"按上传时间倒序排列");
    }
}
-(void)createSubviews
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 44, 44);
    [saveBtn setTitle:@"完成" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(dosave:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    self.navigationItem.rightBarButtonItem = saveItem;
    self.navigationItem.title = @"标签";
    
    
}
-(void)doBack:(UIButton *)_b
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)dosave:(UIButton *)_b
{
    //NSLog(@"dosave");
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)returnSortordText:(ReturnSortordTextBlock)block
{
    self.returnTextBlock = block;
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
