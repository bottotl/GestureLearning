//
//  UIView+Sleep.m
//  gestureTest
//
//  Created by syfll on 2018/3/2.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "UIView+Sleep.h"

@implementation UIView (Sleep)
- (UIView *)jft_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return [self jft_hitTest:point withEvent:event];
}

- (BOOL)jft_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return [self jft_pointInside:point withEvent:event];
}
@end
