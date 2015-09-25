//
//  ViewController.m
//  force
//
//  Created by 杨嘉浩 on 15/9/25.
//  Copyright © 2015年 ykh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *forceLabel;
@property (nonatomic,strong) UIProgressView *forceLevelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _forceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _forceLabel.font = [UIFont systemFontOfSize:30];
    _forceLabel.textColor = [UIColor blackColor];
    _forceLevelView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    _forceLevelView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 + 50);
    [self.view addSubview:_forceLabel];
    [self.view addSubview:_forceLevelView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self handleTouches:touches];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self handleTouches:touches];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setForcePercentage:0];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setForcePercentage:0];
}

-(void)handleTouches:(NSSet<UITouch *> *)touches{
    for (UITouch *touch in touches) {
        CGFloat force = touch.force;
        CGFloat percentage = force/touch.maximumPossibleForce;
        [self setForcePercentage:percentage];
        break;
    }
}

-(void)setForcePercentage:(CGFloat)percentage{
    _forceLabel.text = [NSString stringWithFormat:@"force:%.1f%%",percentage*100];
    [_forceLabel sizeToFit];
    _forceLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _forceLevelView.progress = percentage;
}

@end
