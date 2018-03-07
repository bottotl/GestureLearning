//
//  AppDelegate.m
//  gestureTest
//
//  Created by syfll on 2018/2/28.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "AppDelegate.h"
#import "JRSwizzle.h"
#import "UIGestureRecognizer+Sleep.h"
#import "UIView+Sleep.h"
#import "UIResponder+Sleep.h"//
#import "UIWindow+Sleep.h"
#import "UIApplication+Sleep.h"
#import "JRSwizzle+Block.h"

@interface AppDelegate ()
@property (nonatomic, assign) CFRunLoopObserverRef entryObserverRef;

@property (nonatomic, assign) CFRunLoopObserverRef beforeTimersObserverRef;

@property (nonatomic, assign) CFRunLoopObserverRef beforeSourcesObserverRef;

@property (nonatomic, assign) CFRunLoopObserverRef beforeWaitingObserverRef;

@property (nonatomic, assign) CFRunLoopObserverRef afterWaitingObserverRef;

@property (nonatomic, assign) CFRunLoopObserverRef exitObserverRef;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupMainRunloopObserver];
    [self startAbserver];
    __block NSInvocation *invocation = nil;
    invocation = [NSClassFromString(@"UIGestureEnvironment") jft_swizzleMethod:NSSelectorFromString(@"addGestureRecognizer:") withBlock:^(id environment, UIGestureRecognizer *gesture){
        [invocation setArgument:&gesture atIndex:2];
        [invocation invokeWithTarget:environment];
    } error:nil];

    [UIGestureRecognizer jr_swizzleMethod:@selector(_touchesBegan:withEvent:) withMethod:@selector(jft_touchesBegan:withEvent:) error:nil];
    
    [UIGestureRecognizer jr_swizzleMethod:@selector(_touchesCancelled:withEvent:) withMethod:@selector(jft_touchesCancelled:withEvent:) error:nil];
    
    [UIGestureRecognizer jr_swizzleMethod:@selector(_touchesEnded:withEvent:) withMethod:@selector(jft_touchesEnded:withEvent:) error:nil];
    
    [UIGestureRecognizer jr_swizzleMethod:@selector(_touchesMoved:withEvent:) withMethod:@selector(jft_touchesMoved:withEvent:) error:nil];
    
    [UIView jr_swizzleMethod:@selector(hitTest:withEvent:) withMethod:@selector(jft_hitTest:withEvent:) error:nil];
    [UIView jr_swizzleMethod:@selector(pointInside:withEvent:) withMethod:@selector(jft_pointInside:withEvent:) error:nil];

    [UIResponder jr_swizzleMethod:@selector(touchesBegan:withEvent:) withMethod:@selector(jft_touchesBegan:withEvent:) error:nil];

    [UIResponder jr_swizzleMethod:@selector(touchesCancelled:withEvent:) withMethod:@selector(jft_touchesCancelled:withEvent:) error:nil];

    [UIResponder jr_swizzleMethod:@selector(touchesEnded:withEvent:) withMethod:@selector(jft_touchesEnded:withEvent:) error:nil];

    [UIResponder jr_swizzleMethod:@selector(touchesMoved:withEvent:) withMethod:@selector(jft_touchesMoved:withEvent:) error:nil];

    [UIWindow jr_swizzleMethod:@selector(sendEvent:) withMethod:@selector(jft_sendEvent:) error:nil];
    [UIApplication jr_swizzleMethod:@selector(sendEvent:) withMethod:@selector(jft_sendEvent:) error:nil];
    return YES;
}

- (void)setupMainRunloopObserver
{
    // kCFRunLoopEntry
    CFRunLoopObserverRef entryObserverRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopEntry, YES, INT_MIN, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity){
        printf("kCFRunLoopEntry\n");
    });
    self.entryObserverRef = entryObserverRef;
    
    // kCFRunLoopBeforeTimers
    CFRunLoopObserverRef beforeTimersObserverRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeTimers, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity){
        printf("kCFRunLoopBeforeTimers\n");
    });
    self.beforeTimersObserverRef = beforeTimersObserverRef;
    
    // kCFRunLoopBeforeSources
    CFRunLoopObserverRef beforeSourcesObserverRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeSources, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity){
        printf("kCFRunLoopBeforeSources\n");
    });
    self.beforeSourcesObserverRef = beforeSourcesObserverRef;
    
    // kCFRunLoopBeforeWaiting
    CFRunLoopObserverRef beforeWaitingObserverRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity){
        printf("kCFRunLoopBeforeWaiting\n");
    });
    self.beforeWaitingObserverRef = beforeWaitingObserverRef;
    
    
    // kCFRunLoopAfterWaiting
    CFRunLoopObserverRef afterWaitingObserverRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAfterWaiting, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity){
        printf("kCFRunLoopAfterWaiting\n");
    });
    self.afterWaitingObserverRef = afterWaitingObserverRef;
    
    // kCFRunLoopExit
    CFRunLoopObserverRef exitObserverRef = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopExit, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity){
        printf("kCFRunLoopExit\n");
    });
    self.exitObserverRef = exitObserverRef;
}
- (void)startAbserver
{
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    CFRunLoopRef mainRunLoopRef = [mainRunLoop getCFRunLoop];
    
    CFRunLoopAddObserver(mainRunLoopRef, self.entryObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopAddObserver(mainRunLoopRef, self.beforeTimersObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopAddObserver(mainRunLoopRef, self.beforeSourcesObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopAddObserver(mainRunLoopRef, self.afterWaitingObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopAddObserver(mainRunLoopRef, self.exitObserverRef, kCFRunLoopCommonModes);
}

- (void)endAbserver {
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    CFRunLoopRef mainRunLoopRef = [mainRunLoop getCFRunLoop];
    
    CFRunLoopRemoveObserver(mainRunLoopRef, self.entryObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopRemoveObserver(mainRunLoopRef, self.beforeTimersObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopRemoveObserver(mainRunLoopRef, self.beforeSourcesObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopRemoveObserver(mainRunLoopRef, self.afterWaitingObserverRef, kCFRunLoopCommonModes);
    
    CFRunLoopRemoveObserver(mainRunLoopRef, self.exitObserverRef, kCFRunLoopCommonModes);
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
