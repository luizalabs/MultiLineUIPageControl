//
//  ViewController.m
//  MultiLineUIPageControlDemo
//
//  Created by Bruno Correa on 26/03/14.
//  Copyright (c) 2014 LuizaLabs. All rights reserved.
//

#import "ViewController.h"
#import "MultiLineUIPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    MultiLineUIPageControl *pc = [[MultiLineUIPageControl alloc] initWithFrame:CGRectMake(10.0f, 40.0f, 300.0f, 200.0f)];
    pc.backgroundColor = [UIColor grayColor];
    pc.numberOfPages = 300;
    [self.view addSubview:pc];
}

@end
