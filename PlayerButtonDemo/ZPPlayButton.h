//
//  PaperButton.h
//  Pods
//
//  Created by 陈浩 on 15/6/19.
//
//

#import <UIKit/UIKit.h>

@interface ZPPlayButton : UIControl

@property (nonatomic, assign) NSUInteger lineNum;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) NSArray *initializePositions;

+ (instancetype)button;
+ (instancetype)buttonWithOrigin:(CGPoint)origin;

- (void)setup;
- (void)startAnimation;
- (void)stopAnimation;

@end
