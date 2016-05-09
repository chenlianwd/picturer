//
//  FRLoginViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/9.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRLoginViewController.h"
#import "FRAlbumHomeViewController.h"

#define LOGIN_BTN_H 44
@interface FRLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property (nonatomic, strong) UIButton * loginButton;
@end

@implementation FRLoginViewController
static float keyboardHeight;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self createLoginButton];
    self.view.backgroundColor = [UIColor colorWithRed:242 green:242 blue:242 alpha:1];
    self.passwordText.delegate = self;
    _phoneNumText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    //监听password Text改变的通知   出现或者隐藏loginButton
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    //监听键盘出现的通知   创建LoginButton
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
#pragma mark - setUI
-(void)setNav
{
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"登录";
    
    
}
-(void)createLoginButton
{
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //此时键盘高度为0
    //    _loginButton.frame = CGRectMake( 0, SCREEN_HEIGHT - keyboardHeight - LOGIN_BTN_H, SCREEN_WIDTH, LOGIN_BTN_H);
    //NSLog(@"keyboardHeight = %f",keyboardHeight);
    _loginButton.backgroundColor = [UIColor yellowColor];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
}
#pragma mark - Action
-(void)backButtonClick:(UIButton *)_button
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loginButtonClick:(UIButton *)_button
{
    
    [self.navigationController popViewControllerAnimated:YES];
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    controllers[0] = [[FRAlbumHomeViewController alloc] init];
    [self.navigationController setViewControllers:controllers];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneNumText resignFirstResponder];
    [_passwordText resignFirstResponder];
}

#pragma mark - password TextFieldDelegate

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_phoneNumText.text.length != 11) {
        UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号码必须为11位" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            _phoneNumText.text = @"";
            _passwordText.text = @"";
        }];
        
        [alertVc addAction:alert];
        [self presentViewController:alertVc animated:YES completion:nil];
    }
}
#pragma mark - textChange/keyboard notification
/**监听textFieldChange*/
-(void)textFieldEditChanged:(NSNotification *)aNotification
{
    if (_passwordText.text.length == 1 && _phoneNumText ) {
        _loginButton.hidden = NO;
        //NSLog(@"showbutton-------");
        /**loginButton的动画*/
        [UIView animateWithDuration:0.5 animations:^{
            _loginButton.frame = CGRectMake( 0, SCREEN_HEIGHT - keyboardHeight - LOGIN_BTN_H - 80, SCREEN_WIDTH, LOGIN_BTN_H);
        }];
        
    }else if (_passwordText.text.length == 0){
        //NSLog(@"hidebutton----");
        [UIView animateWithDuration:0.5 animations:^{
            _loginButton.frame = CGRectMake( 0, SCREEN_HEIGHT - keyboardHeight - LOGIN_BTN_H - 80, 0, LOGIN_BTN_H);
        }];
    }
}
-(void)keyboardWillShow:(NSNotification *)aNotification
{
    
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardHeight = keyboardRect.size.height;
    //NSLog(@"键盘高度%f",keyboardRect.size.height);
    
}
-(void)keyboardWillHide:(NSNotification *)aNotification
{
    _loginButton.hidden = YES;
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
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
