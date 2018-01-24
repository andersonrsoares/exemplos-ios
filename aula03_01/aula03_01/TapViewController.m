//
//  TapViewController.m
//  aula03_01
//
//  Created by Dainf on 11/12/14.
//  Copyright (c) 2014 com.utfpr. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *simgleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:simgleFingerTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"Entrei aqui");
    int counts = [self.lbl_count.text intValue];
    counts += 1;
    self.lbl_count.text = [NSString stringWithFormat:@"%d",counts];
}

@end
