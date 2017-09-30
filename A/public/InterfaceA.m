//
//  Target_A.m
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "InterfaceA.h"
#import "AViewController.h"

typedef void (^CTUrlRouterCallbackBlock)(NSDictionary *info);

@implementation InterfaceA

- (instancetype)init
{
  self = [super init];
  if (self) {
    
  }
  return self;
}

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params{
    AViewController *viewController = [[AViewController alloc] init]; 
  viewController.valueLabel.text = [NSString stringWithFormat:@"In A - get param: %@", params[@"mainComponent"]];
    return viewController;
}

- (id)Action_nativePresentImage:(NSDictionary *)params
{
    AViewController *viewController = [[AViewController alloc] init];
    viewController.valueLabel.text = @"this is image";
    viewController.imageView.image = params[@"image"];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    return nil;
}

- (id)Action_showAlert:(NSDictionary *)params
{
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        CTUrlRouterCallbackBlock callback = params[@"cancelAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CTUrlRouterCallbackBlock callback = params[@"confirmAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alert from Module A" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    return nil;
}

- (id)Action_nativeNoImage:(NSDictionary *)params
{
    AViewController *viewController = [[AViewController alloc] init];
    viewController.valueLabel.text = @"no image";
    viewController.imageView.image = [UIImage imageNamed:@"noImage"];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    
    return nil;
}

- (UITableViewCell *)Action_cell:(NSDictionary *)params
{
    UITableView *tableView = params[@"tableView"];
    NSString *identifier = params[@"identifier"];
    
    // 这里的TableViewCell的类型可以是自定义的，我这边偷懒就不自定义了。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (id)Action_configCell:(NSDictionary *)params
{
    NSString *title = params[@"title"];
    NSIndexPath *indexPath = params[@"indexPath"];
    UITableViewCell *cell = params[@"cell"];
    
    // 这里的TableViewCell的类型可以是自定义的，我这边偷懒就不自定义了。
    cell.textLabel.text = [NSString stringWithFormat:@"%@,%ld", title, (long)indexPath.row];
    
//    if ([cell isKindOfClass:[XXXXXCell class]]) {
//        正常情况下在这里做特定cell的赋值，上面就简单写了
//    }
    
    return nil;
}

@end
