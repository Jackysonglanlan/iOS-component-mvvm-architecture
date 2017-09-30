//
//  YQJUIRouter.h
//  Yiqijiao
//
//  Created by jackysong on 29/09/2017.
//  Copyright © 2017 yiqijiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YQJNavgator.h"

#import "AppDelegate.h"

@interface YQJUIRouter : NSObject

@property(nonatomic, readonly) YQJNavgator *nav;

-(void)config:(AppDelegate*)appDele;

@end
