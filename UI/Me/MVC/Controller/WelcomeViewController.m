//
//  WelcomeViewController.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/9.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//

#import "WelcomeViewController.h"
#import "LoginAndRegistViewController.h"
#import "RegistViewController.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>
{
    UIScrollView *welcomeView;//滚动视图
    UIPageControl *pageControl;
}
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self welcomeView];
    [self markView];
    
}


// 欢迎页面
- (void)welcomeView{
    
    welcomeView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    welcomeView.backgroundColor = [UIColor blackColor];
    welcomeView.contentSize = CGSizeMake(SCREEN_WIDTH*4, SCREEN_HEIGHT);
    welcomeView.pagingEnabled = YES;
    welcomeView.bounces = NO;
    welcomeView.showsHorizontalScrollIndicator =NO;
    welcomeView.delegate = self;
    [self.view addSubview:welcomeView];
    
    NSArray *viewNameList = @[@"b1.jpg",@"b2.jpg",@"b3.jpg",@"b4.jpg"];
    
    for (int i = 0; i<4; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        imageView.image = [UIImage imageNamed:viewNameList[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        [welcomeView addSubview:imageView];
        
        
        if (i==3) {
            NSArray *arrayName = @[@"登录",@"注册"];
            
            for (int j =0; j<2; j++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.backgroundColor = [UIColor brownColor];
                
                [button setTitle:arrayName[j] forState:UIControlStateNormal];
                button.layer.cornerRadius = 13;
                button.layer.masksToBounds = YES;
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                button.tag = 100+j;
                button.frame = CGRectMake(30+(SCREEN_WIDTH-15)/2*j,620 , (SCREEN_WIDTH-100)/2, 50);
              
                [imageView addSubview:button];
                [button addTarget:self action:@selector(skipButton:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            
    }
        
}
    

}

- (void)skipButton:(UIButton *)sender{
    
    if (sender.tag==100) {
        [self presentViewController:[LoginAndRegistViewController new] animated:YES completion:^{
            
        }];
    }
    if(sender.tag==101){
        [self presentViewController:[RegistViewController new] animated:YES completion:^{
            
        }];
    }
    
    
    
    

    
    
    
}



// 小圆点
-(void)markView{
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 700, SCREEN_WIDTH, 10)];
    
    
    pageControl.numberOfPages = 4;
    
    [self.view addSubview:pageControl];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    pageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    
    
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
