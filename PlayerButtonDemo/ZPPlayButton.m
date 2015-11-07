//
//  PaperButton.m
//  Pods
//
//  Created by 陈浩 on 15/6/19.
//
//

#import "ZPPlayButton.h"

@interface ZPPlayButton ()

@property (nonatomic, assign) CGFloat initYPosition;
@property (nonatomic, strong) NSMutableArray *layers;

@end

@implementation ZPPlayButton

#pragma mark - Instance methods
+ (instancetype)button
{
    return [self buttonWithOrigin:CGPointZero];
}

+ (instancetype)buttonWithOrigin:(CGPoint)origin
{
    return [[self alloc] initWithFrame:CGRectMake(origin.x,
                                                  origin.y,
                                                  24,
                                                  24)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setup
{
    self.layers = [NSMutableArray arrayWithCapacity:1];
    CGColorRef color = [self.tintColor CGColor];
    CGFloat height = CGRectGetHeight(self.bounds);
    
    // user can set value
    if (self.lineNum == 0) {
        self.lineNum = 4;
    }
    
    if (self.cornerRadius == 0) {
        self.cornerRadius = 1;
    }
    
    if (self.duration == 0) {
        self.duration = 0.4;
    }
    
    if (self.lineWidth == 0) {
        self.lineWidth = 2;
    }

    
    CGFloat allWidth = self.lineNum * self.lineWidth;
    CGFloat perSpace = (CGRectGetMaxX(self.bounds) - allWidth) / (self.lineNum - 1);
    
    if (self.initializePositions.count != self.lineNum) {
        self.lineNum = 4;
        self.initializePositions = @[@12.0,@0.0,@9.0,@3.0];
    }
    
    for (int index = 0; index < self.lineNum; index++) {
        CALayer *layer = [CALayer layer];
        layer.cornerRadius = self.cornerRadius;
        layer.backgroundColor = color;
        layer.frame = CGRectMake((perSpace + self.lineWidth) * index, 0, self.lineWidth, height);
        
        if (index == 0) {
            self.initYPosition = layer.position.y;
        }
        CGFloat initPosition = [self.initializePositions[index] floatValue];
        [self initLayerPosition:layer yPosition:initPosition];
        
        [self.layers addObject:layer];
        [self.layer addSublayer:layer];
    }
    
}

#pragma mark - CoreAnimation
- (void)layerDown:(CALayer *)layer {
    
    CGFloat finalValue = (self.initYPosition + CGRectGetHeight(self.bounds)) - 4;
    CGFloat realValue = finalValue - self.initYPosition;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
    float downTime = (finalValue - layer.position.y) * (self.duration / realValue);
//    float upTime = (realValue - layer.position.y) * (0.5 / realValue);
    
    animation.keyTimes = @[@0,@(downTime),@(downTime + self.duration), @1];
    animation.values = @[@(layer.position.y),@(finalValue),@(self.initYPosition), @(layer.position.y)];
    animation.duration = self.duration * 2;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    
    [layer addAnimation:animation forKey:@"animation"];
}

- (void)startAnimation {
    for (CALayer *layer in self.layers) {
        [self layerDown:layer];
    }
}

- (void)stopAnimation {
    for (CALayer *layer in self.layers) {
        [layer removeAllAnimations];
        
    }
}

#pragma mark - private method
- (void)initLayerPosition:(CALayer *)layer yPosition:(CGFloat)yPosition {
    
    CGPoint point = layer.position;
    point.y = point.y + yPosition;
    layer.position = point;
}

@end
