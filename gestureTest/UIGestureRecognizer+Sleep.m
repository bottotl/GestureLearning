//
//  UIGestureRecognizer+Sleep.m
//  gestureTest
//
//  Created by syfll on 2018/3/2.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "UIGestureRecognizer+Sleep.h"

@implementation UIGestureRecognizer (Sleep)
- (BOOL)jft_delegateShouldReceiveTouch:(UITouch *)delegate {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return [self jft_delegateShouldReceiveTouch:delegate];
}

@end
