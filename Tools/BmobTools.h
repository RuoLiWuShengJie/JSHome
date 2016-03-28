//
//  BmobTools.h
//  JSHome
//
//  Created by 吴胜杰 on 16/3/10.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//
// 是否加入数据库 成功
typedef void(^successful)(BOOL isSuccessful, NSError *error );

#import <Foundation/Foundation.h>

@interface BmobTools : NSObject

+ (void)addBmboUser:(NSString *)user password:(NSString*)password success:(successful)success;


@end
