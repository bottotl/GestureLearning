//
//  UIApplication+Sleep.m
//  gestureTest
//
//  Created by syfll on 2018/3/2.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "UIApplication+Sleep.h"

@implementation UIApplication (Sleep)
- (void)jft_sendEvent:(UIEvent *)event {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    [self jft_sendEvent:event];
}
@end
