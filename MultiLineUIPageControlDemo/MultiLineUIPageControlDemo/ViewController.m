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
	
    MultiLineUIPageControl *pc = [[MultiLineUIPageControl alloc] initWithFrame:CGRectMake(10.0f, 40.0f, 300.0f, 130.0f)];
    pc.backgroundColor = [UIColor grayColor];
    pc.numberOfPages = 120;
    pc.dotsVerticalSpace = 2.0f;
    pc.dotsHorizontalSpace = 4.0f;
    [self.view addSubview:pc];
    
    NSLog(@"numberOfLines: %d", [pc numberOfLines]);
    
    
    pc = [[MultiLineUIPageControl alloc] initWithFrame:CGRectMake(10.0f, 200.0f, 200.0f, 20.0f)];
    pc.backgroundColor = [UIColor grayColor];
    pc.numberOfPages = 5;
    pc.dotsHorizontalSpace = 20.0f;
    [self.view addSubview:pc];
}

@end
