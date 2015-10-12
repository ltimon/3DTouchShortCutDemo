//
//  SecondViewController.m
//  3DTouch
//
//  Created by 李曈 on 15/10/11.
//  Copyright © 2015年 lt. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController (){
    CGPoint touchPoint;
    UIImageView *_canDraw;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第二页";
    _canDraw = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_canDraw];
    _canDraw.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    touchPoint = [[touches anyObject] locationInView:_canDraw];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:_canDraw];
    
    UIGraphicsBeginImageContext(_canDraw.frame.size);
    [_canDraw.image drawInRect:CGRectMake(0.0, 0.0, _canDraw.frame.size.width, _canDraw.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    float lineWidthc = 10.0;
    if ([touch respondsToSelector:@selector(force)]) {
        NSLog(@"force:%f", touch.force);
        lineWidthc = lineWidthc * touch.force;
    }
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), lineWidthc);
    
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 34/255.0, 155/255.0, 1.0, 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    _canDraw.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    touchPoint = currentPoint;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
