//
//  ZKNetworkManager.h
//  ZKNews
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface ZKNetworkManager : AFHTTPSessionManager

//两种网络请求单例  一种有基URL 另一种没有
+ (instancetype)sharedNetworkTools;
+ (instancetype)sharedNetworkToolsWithoutBaseUrl;

@end
