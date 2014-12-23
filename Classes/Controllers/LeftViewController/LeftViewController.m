//
//  LeftViewController.m
//  TestViewDeck
//
//  Created by wangjun on 14-12-22.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import "LeftViewController.h"
#import "HomeViewController.h"
#import "DescoverViewController.h"
#import "MyMusicViewController.h"
#import "SettingViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *menuTableView;
@property (nonatomic, strong) IBOutlet UIView *tableHeadView;
@property (nonatomic, strong) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) NSArray *menuArray;
@property (nonatomic, strong) NSArray *menuItem;

@end

@implementation LeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuArray = @[@"Home",@"Descover",@"MyMusic",@"Setting"];
    
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    
    _menuTableView.tableHeaderView = self.tableHeadView;
    
    HomeViewController *homeController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeController];
    
    DescoverViewController *descoverController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DescoverViewController"];
    UINavigationController *descoverNav = [[UINavigationController alloc] initWithRootViewController:descoverController];
    
    MyMusicViewController *mymusicController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyMusicViewController"];
    UINavigationController *mymusicNav = [[UINavigationController alloc] initWithRootViewController:mymusicController];
    
    SettingViewController *settingController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingViewController"];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:settingController];
    self.menuItem = @[homeNav,descoverNav,mymusicNav,settingNav];
    
    self.viewDeckController.centerController = homeNav;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public
- (void)switchLeftMenu:(MenuType)type
{
    NSInteger chooseIndex = type - 1;
    if (self.menuItem.count > chooseIndex)
    {
        [self.viewDeckController closeLeftView];
        self.viewDeckController.centerController = self.menuItem[chooseIndex];
    }
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MenuCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (self.menuArray.count > indexPath.row)
    {
        cell.textLabel.text = self.menuArray[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.menuItem.count > indexPath.row)
    {
        [self.viewDeckController closeLeftView];
        self.viewDeckController.centerController = self.menuItem[indexPath.row];
    }
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
