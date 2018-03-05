//
//  UIView+Sleep.h
//  gestureTest
//
//  Created by syfll on 2018/3/2.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Sleep)
- (UIView *)jft_hitTest:(CGPoint)point withEvent:(UIEvent *)event;
- (BOOL)jft_pointInside:(CGPoint)point withEvent:(UIEvent *)event;
@end
