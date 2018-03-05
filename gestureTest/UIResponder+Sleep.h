//
//  UIResponder+Sleep.h
//  gestureTest
//
//  Created by syfll on 2018/3/2.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Sleep)
- (void)jft_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
- (void)jft_touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
- (void)jft_touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
- (void)jft_touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
@end
