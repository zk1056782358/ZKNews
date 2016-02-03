//
//  ZKHttpTools.m
//  ZKNews
//
//  Created by Mac Mini For ZK on 16/2/3.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZKHttpTools.h"
#import <AFNetworking.h>

@implementation ZKHttpTools

+ (void)sendGetRequestWithUrl:(NSString *)urlStr parameters:(NSDictionary *)paramDic success:(successBlock)success failure:(failureBlock)failure {
    //和AFNetworing相关的调用
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableSet *mgrSet = [NSMutableSet set];
    [mgrSet addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = mgrSet;
    [manager GET:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //服务器成功返回;responseObject回传控制器
        //相当于函数
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //服务器失败返回;error回传控制器
        //相当于函数
        failure(error);
    }];

}


@end

