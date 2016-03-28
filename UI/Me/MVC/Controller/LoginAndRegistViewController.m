//
//  LoginAndRegistViewController.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/9.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//
#import "AppDelegate.h"
#import "LoginAndRegistViewController.h"
#import "RegistViewController.h"

@interface LoginAndRegistViewController ()

@end

@implementation LoginAndRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    imageView.image = [UIImage imageNamed:@"朦胧.jpeg"];
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
    
    //    渐变字体Label,需要一张照片作为背景
    UIColor *titleColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.png"]];
    NSString *title = @"Fit";
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2+100, 100, 300, 144)];
    titleLabel.textColor = titleColor;
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:85];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleLabel];
    
    
    [self inputTextFiledView];
    
}
// 登录
- (void)inputTextFiledView{
    NSArray *nameList = @[@"请输入用户名",@"不少于六位的密码"];
    
    NSArray *imageNameList = @[@"user.png",@"key.png"];
    NSMutableArray *imageList = [NSMutableArray array];
    for (int i =0; i<2; i++) {
        
        UIImageView *imageView = [[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        UIImage *image = [UIImage imageNamed:imageNameList[i]];
        
        imageView.image = image;
        [imageList addObject:imageView];
        
        
        
        
        
    }
    
   // 输入框
    for (int i =0 ;i<2;i++){
        
        UITextField *textfiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 250+i*70, 200, 50)];
        textfiled.placeholder = nameList[i];
        textfiled.leftView = imageList[i ];
        textfiled.leftViewMode = UITextFieldViewModeAlways;
        textfiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfiled.tag = 50+i;
        [self.view addSubview:textfiled];
    }
    
    NSArray *buttonTitle = @[@"登录",@"忘记密码"];
    
    for (int i =0; i<2; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(50+i*200, 400, 0, 0 );
        
        [button setTitle:buttonTitle[i] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal ];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button sizeToFit];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
    }
    
    //立即注册按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button1.frame = CGRectMake(300, 650, 0, 0);
    
    [button1 setTitle:@"立即注册" forState:UIControlStateNormal];
    
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [button1 sizeToFit];
    
    [button1 addTarget:self action:@selector(registControl:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    
}
// 跳转 到注册界面
- (void)registControl:(UIButton *)sender{
    
    [self presentViewController:[RegistViewController new] animated:YES completion:^{
        
    }];
    
}



- (void)buttonAction:(UIButton *)sender{
    UITextField *t1 = [self.view viewWithTag:50];
    UITextField *t2 = [self.view viewWithTag:51];
    [t1 resignFirstResponder];
    [t2 resignFirstResponder];
    
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    [app creatMain];
    
    
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
