//
//  RegistViewController.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/9.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginAndRegistViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>
{
    UIScrollView *myScrollowView;
}
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    imageView.image = [UIImage imageNamed:@"朦胧.jpeg"];
    imageView.userInteractionEnabled = YES;
    [self.view  addSubview:imageView];
    
    myScrollowView = [[UIScrollView alloc]initWithFrame:SCREEN_BOUNDS];
    
    myScrollowView.contentSize = CGSizeMake(0, SCREEN_HEIGHT+1);
    myScrollowView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    myScrollowView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:myScrollowView];
    
    
    //    渐变字体Label,需要一张照片作为背景
    UIColor *titleColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.png"]];
    NSString *title = @"Fit";
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2+100, 100, 300, 144)];
    titleLabel.textColor = titleColor;
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:85];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    [myScrollowView addSubview:titleLabel];
    
    
    
    
    [self regisonView];
    
}
// 注册视图
- (void)regisonView{
    
    
    NSArray *nameList = @[@"请输入用户名",@"不少于六位的密码",@"请再次输入密码",@"请输入手机号",@"请输入验证码"];
    
    NSArray *imageNameList = @[@"user.png",@"key.png",@"key.png",@"手机.png",@"键盘.png"];
    NSMutableArray *imageList = [NSMutableArray array];
    for (int i =0; i<5; i++) {
        
        UIImageView *imageView = [[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        UIImage *image = [UIImage imageNamed:imageNameList[i]];
        
        imageView.image = image;
        [imageList addObject:imageView];
        
    }
    
    // 输入框
    for (int i =0 ;i<5;i++){
        
        UITextField *textfiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 220+i*60, 200, 50)];
        textfiled.placeholder = nameList[i];
        textfiled.leftView = imageList[i ];
        textfiled.leftViewMode = UITextFieldViewModeAlways;
        textfiled.tag = 100+i;
        textfiled.delegate = self;
        textfiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        [myScrollowView addSubview:textfiled];
    }

    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    button.frame = CGRectMake(120, 530, 0, 0);
    
    [button setTitle:@"开始注册" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    
    [button addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    
    [myScrollowView addSubview:button];
    
    
    
    
    
}
// 注册按钮 事件
-(void)regist:(UIButton *)sender{
    UITextField *textFiled1 = [self.view viewWithTag:100];
    UITextField *textFiled = [self.view viewWithTag:101];
    
    [textFiled resignFirstResponder];
    [textFiled1 resignFirstResponder];
    
    [BmobTools addBmboUser:textFiled.text password:textFiled1.text success:^(BOOL isSuccessful, NSError *error) {
        
        if (isSuccessful) {
            
            [self presentViewController:[LoginAndRegistViewController new] animated:YES completion:^{
                
            } ];
            
        }else{
            
            NSLog(@"%@",error);
            
        }
        
    }];
    
    
    
    
    
    
    
    
    
    
    
    
}





- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField.tag==103||textField.tag==104) {
        [UIView animateWithDuration:0.5 animations:^{
            myScrollowView.contentOffset = CGPointMake(0, 100);
            
        }];
    }
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textFiel{
    
    [UIView animateWithDuration:0.5 animations:^{
       myScrollowView.contentOffset = CGPointMake(0, 0);
    }];
    
  
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    
    return YES;
    
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
