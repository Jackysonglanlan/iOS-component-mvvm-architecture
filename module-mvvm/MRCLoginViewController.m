//
//  MRCLoginViewController.m
//  YiqijiaoTests
//
//  Created by jackysong on 27/09/2017.
//  Copyright © 2017 yiqijiao. All rights reserved.
//

#import "MRCLoginViewController.h"

#import "LoginViewModel.h"

#import "YQJUIRouter.h"

/////// V

@interface MRCLoginViewController ()

@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation MRCLoginViewController

- (instancetype)init{
  self = [super init];
  if (self) {
    self.viewModel = [[LoginViewModel alloc] initWithNavDelegator: router.nav];
  }
  return self;
}

-(void)viewDidLoad{
}

- (void)bindViewModel {
  ///// 开始数据绑定: model 绑定 view /////
  
  @weakify(self)
  [RACObserve(self.viewModel, avatarURL) subscribeNext:^(NSURL *avatarURL) {
     @strongify(self)
    // 异步刷 UI, 更新头像
  }];
  
  // 绑定 用户名/密码
  RAC(self.viewModel, username)  =  [RACSignal return:@"sdfdsfdsfdsfds"]; //self.usernameTextField.rac_textSignal;
  RAC(self.viewModel, password)  = self.passwordTextField.rac_textSignal;
  // 绑定 button enabled 状态的校验逻辑
  RAC(self.loginButton, enabled) = self.viewModel.validLoginSignal;
  
  ///// 开始数据绑定: view 绑定 model /////
  
  // 主动触发登录逻辑
  [[self.loginButton
    rac_signalForControlEvents:UIControlEventTouchUpInside]
   subscribeNext:^(id x) {
     // 驱动 vm 执行业务 (登录)
     @strongify(self)
     [self.viewModel.loginCommand execute:nil];
     [self.navigationController pushViewController:nil animated:NO];
   }];
  
  [self.router.navDelegator push]
}

@end
