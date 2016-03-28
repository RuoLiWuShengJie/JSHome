//
//  M_CustomTableViewCell.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/11.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//

#import "M_CustomTableViewCell.h"

@implementation M_CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 30, 30)];
        self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:self.myImageView];
        // 分割线
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH-20, 1)];
        lineView.backgroundColor = [UIColor grayColor];
         
        
        
        [self.contentView addSubview: lineView];
        
        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, 100, 50)];
        
        
        [self.contentView addSubview:self.myLabel];
        
        
        
        
    }
    
    
    
    
    return  self;
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
