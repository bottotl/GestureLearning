//
//  JRSwizzle+Block.h
//  gestureTest
//
//  Created by syfll on 2018/3/4.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JFTSwizzleBlock)
+ (BOOL)jft_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (NSInvocation*)jft_swizzleMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;
@end
