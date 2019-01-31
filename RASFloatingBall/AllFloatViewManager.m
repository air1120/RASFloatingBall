//
//  AllFloatViewManager.m
//  RASFloatingBall
//
//  Created by Rason on 2019/1/23.
//  Copyright © 2019年 Rason. All rights reserved.
//

#import "AllFloatViewManager.h"
#import "RASFloatingBall.h"
@interface AllFloatViewManager()
+ (void)show:(UIView *)followView;
+ (void)hide;
@end
@implementation AllFloatViewManager
static RASFloatingBall *floating;
+ (void)show:(UIView *)floatView{
    if (!floating) {
        floating = [[RASFloatingBall alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
        // 自动靠边
        floating.autoCloseEdge = YES;
        floating.edgePolicy = RASFloatingBallEdgePolicyLeftRight;
        [floating setContent:[UIImage imageNamed:@"apple"] contentType:RASFloatingBallContentTypeImage];
        [floating visible];
        
        floating.clickHandler = ^(RASFloatingBall * _Nonnull floatingBall) {
            [floatingBall.parentView addSubview:floatView];
            
            floatView.hidden = !floatView.hidden;
            if(floatView.hidden==false){
                CGPoint point = floatingBall.center;
                if (point.x<=[UIScreen mainScreen].bounds.size.width/2) {
                    point.x = floatingBall.frame.size.width/2 + 8 + floatView.frame.size.width;
                }else{
                    point.x = [UIScreen mainScreen].bounds.size.width - floatingBall.frame.size.width - 8 -floatView.frame.size.width/2;
                }
                
                floatView.center = point;
                floatingBall.backgroundViewClickHandler  = ^(RASFloatingBall * _Nonnull floatingBall) {
                    floatingBall.clickHandler(floatingBall);
                };
            }else{
                floatingBall.backgroundViewClickHandler = NULL;
            }
            
        };
        floating.autoCloseEdgeStartHandler = ^(RASFloatingBall * _Nonnull floatingBall) {
            floatView.hidden = YES;
        };
        floating.panStartHandler = ^(RASFloatingBall * _Nonnull floatingBall) {
            //        [floatingBall hide];
            floatView.hidden = YES;
        };
    }
    floating.hidden = false;
}
+ (void)hide{
    floating.hidden = true;
}
@end
