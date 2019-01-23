//
//  AppDelegate.h
//  RASFloatingBall
//
//  Created by Rason on 2017/4/22.
//  Copyright © 2017年 Rason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RASFloatingBall.h"

@interface AppDelegateManager : NSObject

+ (instancetype)shareManager;

@property (nonatomic, strong) RASFloatingBall *floatinBall;
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@end

