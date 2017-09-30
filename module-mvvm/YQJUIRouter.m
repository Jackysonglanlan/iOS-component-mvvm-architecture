//
//  YQJUIRouter.m
//  Yiqijiao
//
//  Created by jackysong on 29/09/2017.
//  Copyright © 2017 yiqijiao. All rights reserved.
//

#import "YQJUIRouter.h"


@implementation YQJUIRouter

-(UIViewController*)routeToVCByClassName:(NSString*)vcName{
  return [[NSClassFromString(vcName) alloc] initWithRouter:self];
}

-(void)config:(AppDelegate*)appDele{
  _nav = [YQJNavgator new];
  
  
  [[_nav rac_signalForSelector:@selector(pushViewController:animated:)] subscribeNext:^(NSString *vcClassName) {
    [appDele.window.rootViewController.navigationController pushViewController:[self routeToVCByClassName:vcClassName]
                            animated:NO];
  }];
  
}


@end
