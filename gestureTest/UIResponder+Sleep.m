//
//  UIResponder+Sleep.m
//  gestureTest
//
//  Created by syfll on 2018/3/2.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "UIResponder+Sleep.h"

@implementation UIResponder (Sleep)
- (void)jft_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    [self jft_touchesBegan:touches withEvent:event];
}

- (void)jft_touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    [self jft_touchesMoved:touches withEvent:event];
}

- (void)jft_touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    [self jft_touchesEnded:touches withEvent:event];
}
- (void)jft_touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    [self jft_touchesCancelled:touches withEvent:event];
}
@end
