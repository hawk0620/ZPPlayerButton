//
//  ViewController.m
//  PlayerButtonDemo
//
//  Created by 陈浩 on 15/11/7.
//  Copyright © 2015年 陈浩. All rights reserved.
//

#import "ViewController.h"
#import "ZPPlayButton.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL isPause;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isPause = YES;
    
    ZPPlayButton *paper = [ZPPlayButton button];
    paper.lineNum = 4;
    paper.cornerRadius = 1;
    paper.initializePositions = @[@12.0, @0, @9.0, @5.0];
    
//    paper.tintColor = [UIColor orangeColor];
    
    [paper setup];
    
    paper.center = self.view.center;
    [paper addTarget:self action:@selector(playButtonDone:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:paper];
    
}

- (void)playButtonDone:(ZPPlayButton *)button {
    if (self.isPause) {
        [button startAnimation];
    } else {
        [button stopAnimation];
    }
    
    self.isPause = !self.isPause;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
