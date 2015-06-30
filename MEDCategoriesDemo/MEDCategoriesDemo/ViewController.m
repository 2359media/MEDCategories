//
//  ViewController.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "ViewController.h"
#import <UIColor+MEDAdditions.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIColor *color = [UIColor greenColor];
    UIColor *darkenColor = [color med_darkenColor];
    UIColor *lightenColor = [color med_lightenColor];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
