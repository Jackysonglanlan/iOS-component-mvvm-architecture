//
//  CTMediator+CTMediatorModuleAActions.m
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "ModuleA.h"

NSString * const kCTMediatorInterfaceA = @"A";

NSString * const kCTMediatorActionNativFetchDetailViewController = @"nativeFetchDetailViewController";
NSString * const kCTMediatorActionNativePresentImage = @"nativePresentImage";
NSString * const kCTMediatorActionNativeNoImage = @"nativeNoImage";
NSString * const kCTMediatorActionShowAlert = @"showAlert";
NSString * const kCTMediatorActionCell = @"cell";
NSString * const kCTMediatorActionConfigCell = @"configCell";

@implementation CTMediator (CTMediatorModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail
{
    UIViewController *viewController = [self performTarget:kCTMediatorInterfaceA
                                                    action:kCTMediatorActionNativFetchDetailViewController
                                                    params:@{@"mainComponent":[NSString stringWithFormat:@" value in %@", self]}
                                         shouldCacheTarget:NO
                                        ];
  
    
  
  
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    } else {
        return [[UIViewController alloc] init];
    }
}

- (void)CTMediator_presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kCTMediatorInterfaceA
                     action:kCTMediatorActionNativePresentImage
                     params:@{@"image":image}
          shouldCacheTarget:NO];
    } else {
        [self performTarget:kCTMediatorInterfaceA
                     action:kCTMediatorActionNativeNoImage
                     params:@{@"image":[UIImage imageNamed:@"noImage"]}
          shouldCacheTarget:NO];
    }
}

- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
      paramsToSend[@"cancelAction"] = ^(NSDictionary *data){
        [self performTarget:@"B"
                     action:@"foobar"
                     params:data
          shouldCacheTarget:NO];
      };
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kCTMediatorInterfaceA
                 action:kCTMediatorActionShowAlert
                 params:paramsToSend
      shouldCacheTarget:NO];
}

- (UITableViewCell *)CTMediator_tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    return [self performTarget:kCTMediatorInterfaceA
                        action:kCTMediatorActionCell
                        params:@{
                                 @"identifier":identifier,
                                 @"tableView":tableView
                                 }
             shouldCacheTarget:YES];
}

- (void)CTMediator_configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath
{
    [self performTarget:kCTMediatorInterfaceA
                 action:kCTMediatorActionConfigCell
                 params:@{
                          @"cell":cell,
                          @"title":title,
                          @"indexPath":indexPath
                          }
      shouldCacheTarget:YES];
}

- (void)CTMediator_cleanTableViewCellTarget
{
    [self releaseCachedTargetWithTargetName:kCTMediatorInterfaceA];
}

@end
