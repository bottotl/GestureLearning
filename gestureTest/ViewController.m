//
//  ViewController.m
//  gestureTest
//
//  Created by syfll on 2018/2/28.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end
@implementation TestView
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _tap = [UITapGestureRecognizer new];
        _tap.delegate = self;
        [_tap addTarget:self action:@selector(didTap:)];
        [self addGestureRecognizer:_tap];
    }
    return self;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *view = [super hitTest:point withEvent:event];
//    if (self.tag != 0) {
//        return self;
//    }
//    return view;
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
//    return NO;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}
//
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
//    return YES;
//}

- (void)didTap:(UITapGestureRecognizer *)sender {
    NSAssert(sender.view.tag == 2, @"something went wrong");
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
}

@end

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet TestView *aView;
@property (weak, nonatomic) IBOutlet TestView *bView;
@property (weak, nonatomic) IBOutlet TestView *dView;
@property (weak, nonatomic) IBOutlet TestView *cView;

@property (nonatomic, strong) UITapGestureRecognizer *vcGesture;
@property (nonatomic, strong) UITapGestureRecognizer *aGesture;
@property (nonatomic, strong) UITapGestureRecognizer *bGesture;
@property (nonatomic, strong) UITapGestureRecognizer *cGesture;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.tag = 0;
    self.aView.tag = 1;
    self.bView.tag = 2;
    self.cView.tag = 3;
    self.dView.tag = 4;
    
    UITapGestureRecognizer *viewTap = [UITapGestureRecognizer new];
    viewTap.delegate = self;
    [viewTap addTarget:self action:@selector(didTapView:)];
    [self.view addGestureRecognizer:viewTap];
    self.vcGesture = viewTap;
    self.aGesture = self.aView.gestureRecognizers.firstObject;
    self.bGesture = self.bView.gestureRecognizers.firstObject;
    self.cGesture = self.cView.gestureRecognizers.firstObject;
    

    NSTimer *timer = [[NSTimer alloc] initWithFireDate:0 interval:0.1 target:self selector:@selector(doSomeThing) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}

- (void)doSomeThing {
    [self removeViewAndRemoveGesture];
    [self addViewAndAddGesture];
}

- (void)removeViewAndRemoveGesture {
    [self.aView removeFromSuperview];
    [self.bView removeFromSuperview];
    [self.cView removeFromSuperview];
    
    [self.aView removeGestureRecognizer:self.aGesture];
    [self.bView removeGestureRecognizer:self.bGesture];
    [self.cView removeGestureRecognizer:self.cGesture];
}

- (void)addViewAndAddGesture {
    [self.view addSubview:self.aView];
    [self.view addSubview:self.bView];
    [self.view addSubview:self.cView];
    
    [self.aView addGestureRecognizer:self.aGesture];
    [self.bView addGestureRecognizer:self.bGesture];
    [self.cView addGestureRecognizer:self.cGesture];
    
}


- (void)didTapView:(UITapGestureRecognizer *)sender {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
//    return YES;
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
//    return YES;
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
//    return NO;
//}
@end
