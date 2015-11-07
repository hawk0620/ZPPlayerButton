# ZPPlayerButton

![alt tag](http://7xkwuq.com1.z0.glb.clouddn.com/player_button.gif)

init 

+ (instancetype)button;
+ (instancetype)buttonWithOrigin:(CGPoint)origin;

config

@property (nonatomic, assign) NSUInteger lineNum;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) NSArray *initializePositions;

setup

- (void)setup;

animation

- (void)startAnimation;
- (void)stopAnimation;


