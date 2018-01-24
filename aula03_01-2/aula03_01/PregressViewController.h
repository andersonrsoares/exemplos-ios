//
//  PregressViewController.h
//  aula03_01
//
//  Created by Dainf on 11/12/14.
//  Copyright (c) 2014 com.utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PregressViewController : UIViewController
{
    UIProgressView *progresso;
    UIActivityIndicatorView * indicator;
    UILabel *porcentagem;
    
}

@property(nonatomic,retain) IBOutlet UIProgressView *progresso;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *indicator;
@property(nonatomic,retain) IBOutlet UILabel *porcentagem;

-(IBAction)show:(id)sender;
-(IBAction)hide:(id)sender;
-(void)initComponet;
@end



