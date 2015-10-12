//
//  ViewController.m
//  3DTouch
//
//  Created by 李曈 on 15/10/11.
//  Copyright © 2015年 lt. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController (){
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第一页";
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 60, 30)];
    [nextBtn setTitle:@"下一个" forState:0];
    [nextBtn setBackgroundColor:[UIColor orangeColor]];
    [nextBtn addTarget:self action:@selector(push) forControlEvents:1<<6];
    [self.view addSubview:nextBtn];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(150, 150, 100, 30)];
    textField.layer.borderWidth = 1.0;
    textField.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:textField];
}
-(void)push{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
