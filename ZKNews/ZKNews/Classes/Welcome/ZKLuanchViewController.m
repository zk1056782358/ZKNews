//
//  ZKLuanchViewController.m
//  ZKNews
//
//  Created by Mac Mini For ZK on 16/2/3.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZKLuanchViewController.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "ZKHttpTools.h"

static CGFloat const LaunchDuration = 2.0;

@interface ZKLuanchViewController ()

@property (nonatomic, strong) UIImageView *launchImage;
@property (nonatomic, strong) UIImageView *logoImage;

@end

@implementation ZKLuanchViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.launchImage];
    [self.view addSubview:self.logoImage];
    //加载启动图片
    [self updateLaunchImage];
}

#pragma mark - private method
- (void)updateLaunchImage {
    NSInteger now = [[[NSDate alloc] init] timeIntervalSince1970];
    NSString *launchImageUrl = [NSString stringWithFormat:@"http://g1.163.com/madr?app=7A16FBB6&platform=ios&category=startup&location=1&timestamp=%ld",(long)now];
    ZKLog(@"%@", launchImageUrl);
    
    [ZKHttpTools sendGetRequestWithUrl:launchImageUrl parameters:nil success:^(id json) {
        ZKLog(@"LaunchImage load success!");
        NSArray *adArray = [json valueForKey:@"ads"];
        NSString *imgUrl = adArray[0][@"res_url"][0];
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        
        [manager downloadImageWithURL:[NSURL URLWithString:imgUrl] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            self.launchImage.image = image;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(LaunchDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                ZKLog(@"加载完成！");
#pragma warning TODO
            });
        }];
    } failure:^(NSError *error) {
        ZKLog(@"LaunchImage load failure! %@", error.userInfo);
    }];
}

#pragma mark - getter and setter
- (UIImageView *)launchImage {
    if (nil == _launchImage) {
        _launchImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 135)];
    }
    return _launchImage;
}

- (UIImageView *)logoImage {
    if (nil == _logoImage) {
        _logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 135, kScreenWidth, 135)];
        _logoImage.image = [UIImage imageNamed:@"adBottom"];
    }
    return _logoImage;
}

#pragma mark 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
