//
//  DemoModuleADetailViewController.m
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@property (nonatomic, strong, readwrite) UILabel *valueLabel;
@property (nonatomic, strong, readwrite) UIImageView *imageView;

@property (nonatomic, strong) UIButton *returnButton;

@end

@implementation AViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

  [self.view addSubview:self.valueLabel];
  [self.view addSubview:self.imageView];
  [self.view addSubview:self.returnButton];

}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
  

    [self.valueLabel sizeToFit];
}

#pragma mark - event response
- (void)didTappedReturnButton:(UIButton *)button
{
    if (self.navigationController == nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - getters and setters
- (UILabel *)valueLabel 
{
    if (_valueLabel == nil) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = [UIFont systemFontOfSize:20];
      _valueLabel.backgroundColor = [UIColor yellowColor];
        _valueLabel.textColor = [UIColor blackColor];
      _valueLabel.frame = CGRectMake(10, 100, 50, 50);
    }
    return _valueLabel;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UIButton *)returnButton
{
    if (_returnButton == nil) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton addTarget:self action:@selector(didTappedReturnButton:) forControlEvents:UIControlEventTouchUpInside];
        [_returnButton setTitle:@"return" forState:UIControlStateNormal];
        [_returnButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _returnButton;
}

@end
