//
//  RASCustomButton.m
//  RASFloatingBall
//
//  Created by Rason on 2017/4/29.
//  Copyright © 2017年 Rason. All rights reserved.
//

#import "RASCustomButton.h"

@implementation RASCustomButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = (contentRect.size.width - self.imageSize.width) * 0.5;
    CGRect rect = CGRectMake(x, 0, self.imageSize.width,self.imageSize.height);
    return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, self.imageSize.height, contentRect.size.width, contentRect.size.height - self.imageSize.height );
}

@end
