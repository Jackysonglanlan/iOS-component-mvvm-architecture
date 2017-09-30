//
//  LoginViewModel.m
//  YiqijiaoTests
//
//  Created by jackysong on 27/09/2017.
//  Copyright © 2017 yiqijiao. All rights reserved.
//

#import "LoginViewModel.h"

#import "YQJNavgator.h"

/////// VM

@implementation LoginViewModel

- (void)initialize {
  
  RAC(self, avatarURL) = [[RACObserve(self, username)
                           map:^(NSString *username) {
                             // 根据用户名，查数据库，异步返回 头像地址
                             return @"avatarURL";
                           }]
                          distinctUntilChanged];
  
  _validLoginSignal = [[RACSignal
                            combineLatest:@[ RACObserve(self, username), RACObserve(self, password) ]
                            reduce:^(NSString *username, NSString *password) {
                              return @(username.length > 0 && password.length > 0);
                            }]
                           distinctUntilChanged];
  
  _loginCommand = [[RACCommand alloc] initWithSignalBlock:^(NSString *oneTimePassword) {
    // do login
    
    [self.navgator pushViewController:@"LoginVC" animated:YES];
    
    return [RACSignal never];
  }];
}

@end
