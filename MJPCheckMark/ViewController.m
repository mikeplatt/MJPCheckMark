//
//  ViewController.m
//  MJPCheckMark
//
//  Created by Mike Platt on 28/08/2014.
//  Copyright (c) 2014 RABFAP. All rights reserved.
//

#import "ViewController.h"
#import "MJPCheckMark.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Check Mark Delegate

- (void)checkMarkValueChanged:(MJPCheckMark *)checkMark
{
    NSLog(@"CHECK MARK IS ON: %@", (checkMark.isOn) ? @"YES" : @"NO");
}
@end
