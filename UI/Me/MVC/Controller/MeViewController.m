//
//  MeViewController.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/8.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//

#import "MeViewController.h"
#import "M_CustomTableViewCell.h"
#import "M_TrainGreadViewController.h"
#import "M_LogoViewController.h"
#import "M_PersonDataViewController.h"

#import "M_CollectViewController.h"
#import "M_SetUpViewController.h"
#import "M_ShareViewController.h"

@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
}
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";

    
    
    [self creatNewTableView];
    
    
    
    
}


- (void)creatNewTableView{
    


    
    myTableView = [[UITableView alloc]initWithFrame:SCREEN_BOUNDS style:UITableViewStyleGrouped];
    
    
    myTableView.delegate = self;
    myTableView.dataSource =self;
    myTableView.showsVerticalScrollIndicator = NO;
    
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
    // 左侧按钮 视图
    UIBarButtonItem *leftButtonView = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"添加.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriend:)];
    
    
    self.navigationItem.leftBarButtonItem = leftButtonView;
    
    UIBarButtonItem *rightButtonView = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"设置.png"] style:UIBarButtonItemStylePlain target:self action:@selector(setButton:)];
    
    self.navigationItem.rightBarButtonItem = rightButtonView;
    
    
}

// 分享按钮触发时间
- (void)addFriend:(UIBarButtonItem *)sender{
    
    [self.navigationController pushViewController:[M_ShareViewController new] animated:YES];
    
    
    
}
// 设置按钮
- (void)setButton:(UIBarButtonItem *)sender{
    
    
    [self.navigationController pushViewController:[M_SetUpViewController new] animated:YES];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    
    
    M_CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        
        cell = [[M_CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.alpha = 0.5;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
        if(indexPath.row==0){
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
            view.backgroundColor = [UIColor grayColor];
            view.alpha = 0.5;
            
            [cell addSubview:view];
        
        }
        
    }
    
    NSArray *nameList = @[@"训练等级",@"我得到徽章",@"个人资料",@"我的收藏"];
    
    
    
    cell.myImageView.image = [UIImage imageNamed:nameList[indexPath.row]];
    
    cell.myLabel.text = nameList[indexPath.row];
    
    
    
    
    return cell;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 4;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 150;
    
}
// 表头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
//    设置用户头像按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    button.frame = CGRectMake(20, 10, 70, 70 );
    button.backgroundColor = [UIColor redColor];
    
    
    
    [button setBackgroundImage:[UIImage imageNamed:@"女生.jpeg"] forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 35;
    button.layer.masksToBounds = YES;
    
    [button addTarget:self action:@selector(addImageView:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    // 设置用户的名字
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 200, 50)];
    label.text = @"用户自己的名字";
    
    [view addSubview:label];
   
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 90, SCREEN_WIDTH, 2)];
    
    view1.backgroundColor = [UIColor grayColor];
    [view addSubview:view1];
    
    NSArray * nameList = @[@"动态0",@"关注0",@"粉丝0"];
    //(90+i*70, 95, 50, 50)
    for (int i=0; i<3; i++) {
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
                             
      button2.frame = CGRectMake(50+i*120, 95, 100, 50);
       
        [button2 setTitle:nameList[i] forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [view addSubview:button2];
        
    }
    
    
        
    
    
    
    
    return view;
    
    
    
}

// 上传自己的照片事件
- (void)addImageView:(UIButton *)sender{
    
    
  
    
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            
            [ self.navigationController pushViewController:[M_TrainGreadViewController new] animated:YES];
            
            break;
        case 1:
            [self.navigationController pushViewController:[M_LogoViewController new] animated:YES];
            
            break;
            
        case 2:
            [self.navigationController pushViewController:[M_PersonDataViewController new] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[M_CollectViewController new] animated:YES];
            
            break;
            
        default:
            
            break;
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
