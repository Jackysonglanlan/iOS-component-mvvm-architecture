//
//  LoginViewModel.h
//  YiqijiaoTests
//
//  Created by jackysong on 27/09/2017.
//  Copyright © 2017 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic, copy, readonly) NSURL *avatarURL;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

// 监听 username password，如果有改变，自动触发校验逻辑
@property (nonatomic, strong, readonly) RACSignal *validLoginSignal;

// 登录逻辑
@property (nonatomic, strong, readonly) RACCommand *loginCommand;

@end
