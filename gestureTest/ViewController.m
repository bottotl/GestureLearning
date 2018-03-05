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

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return YES;
}

- (void)didTap:(UITapGestureRecognizer *)sender {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
}

@end

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet TestView *aView;
@property (weak, nonatomic) IBOutlet TestView *bView;
@property (weak, nonatomic) IBOutlet TestView *dView;
@property (weak, nonatomic) IBOutlet TestView *cView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aView.tag = 1;
    self.bView.tag = 2;
    self.cView.tag = 3;
    self.dView.tag = 4;
    
    UITapGestureRecognizer *viewTap = [UITapGestureRecognizer new];
    viewTap.delegate = self;
    [viewTap addTarget:self action:@selector(didTapView:)];
    [self.view addGestureRecognizer:viewTap];
    self.view.tag = 0;
}

- (void)didTapView:(UITapGestureRecognizer *)sender {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"[%@], %@",NSStringFromSelector(_cmd), self);
    return NO;
}
@end
