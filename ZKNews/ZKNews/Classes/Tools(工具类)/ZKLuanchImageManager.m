//
//  ZKLuanchImageManager.m
//  ZKNews
//
//  Created by admin on 16/2/3.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZKLuanchImageManager.h"

@implementation ZKLuanchImageManager


#pragma mark - 加载最新的启动图片
+ (void)loadLatestLuanchImage {
    NSTimeInterval now = [[[NSDate alloc] init] timeIntervalSince1970];
    NSString *luanchImageUrl = [NSString stringWithFormat:@"http://g1.163.com/madr?app=7A16FBB6&platform=ios&category=startup&location=1&timestamp=%ld", (NSInteger)now];
}

@end
