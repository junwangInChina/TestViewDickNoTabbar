//
//  RootViewController.m
//  TestViewDeck
//
//  Created by wangjun on 14-12-22.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import "RootViewController.h"
#import "LeftViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LeftViewController *leftViewController = [storyboard instantiateViewControllerWithIdentifier:@"LeftViewController"];

    self = [super initWithCenterViewController:nil
                            leftViewController:leftViewController];
    self.delegate = leftViewController;
    
    if (self)
    {
        self.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
