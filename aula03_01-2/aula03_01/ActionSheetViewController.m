//
//  ActionSheetViewController.m
//  aula03_01
//
//  Created by Dainf on 11/12/14.
//  Copyright (c) 2014 com.utfpr. All rights reserved.
//

#import "ActionSheetViewController.h"

@interface ActionSheetViewController ()

@end

@implementation ActionSheetViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sheetActionSheet:(id)sender
{
    UIActionSheet *popup = [[UIActionSheet alloc]
                            initWithTitle:@"select sharing"
                            delegate:self
                            cancelButtonTitle:@"cancel"
                            destructiveButtonTitle:nil
                            otherButtonTitles:@"share on facebook",
                                              @"share on twiter",
                                              @"share via e-mail",
                                              @"save to camera rool",
                                              @"rate this app",nil];
     popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

-(void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (popup.tag) {
        case 1:
            switch (buttonIndex) {
                case 0:
                    NSLog(@"Facebook");
                    break;
                case 1:
                    NSLog(@"Twiter");
                    break;
                case 2:
                    NSLog(@"Camera");
                    break;
                case 3:
                    NSLog(@"Email");
                    break;
                case 4:
                    NSLog(@"App");
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }

}

@end
