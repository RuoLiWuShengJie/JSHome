//
//  BmobTools.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/10.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//


#import "BmobTools.h"



@implementation BmobTools
// 创建用户
+ (void)addBmboUser:(NSString *)user password:(NSString*)password success:(successful)success{
    
    BmobObject *gameScore = [BmobObject objectWithClassName:user];
    [gameScore setObject:password forKey:@"password"];
    
    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        
        success(isSuccessful,error);
        
        
        
    }];
    
    
    
    
    
    
}




@end
