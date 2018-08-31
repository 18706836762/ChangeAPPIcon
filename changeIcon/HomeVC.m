//
//  HomeVC.m
//  changeIcon
//
//  Created by 王园园 on 2018/8/30.
//  Copyright © 2018年 dfs. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()
- (IBAction)wudaiClick:(id)sender;
- (IBAction)riyueClick:(id)sender;


@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)wudaiClick:(id)sender {
    [self changeAppIconWithName:@"wudai"];
}

- (IBAction)riyueClick:(id)sender {
    [self changeAppIconWithName:@"riyue"];
}

//更换方法
- (void)changeAppIconWithName:(NSString *)iconName {
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil; //为空则使用默认icon
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
