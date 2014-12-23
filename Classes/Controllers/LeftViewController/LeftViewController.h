//
//  LeftViewController.h
//  TestViewDeck
//
//  Created by wangjun on 14-12-22.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface LeftViewController : UIViewController <IIViewDeckControllerDelegate>

- (void)switchLeftMenu:(MenuType)type;

@end
