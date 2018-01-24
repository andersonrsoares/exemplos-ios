//
//  ViewController.m
//  audiostremobjective
//
//  Created by Anderson Soares on 22/04/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

@interface ViewController ()

@end

Player *player;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    player = [Player instancia];
   
    [_ai stopAnimating];
    [player setUrlRadio:@"https://s3.amazonaws.com/kargopolov/BlueCafe.mp3" withActivityIndicator:_ai playButton:_play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playclique:(id)sender {
    [[player player] play];
}

@end
