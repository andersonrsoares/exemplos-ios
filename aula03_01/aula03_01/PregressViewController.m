//
//  PregressViewController.m
//  aula03_01
//
//  Created by Dainf on 11/12/14.
//  Copyright (c) 2014 com.utfpr. All rights reserved.
//

#import "PregressViewController.h"

@interface PregressViewController ()

@end

@implementation PregressViewController

@synthesize progresso;
@synthesize indicator;
@synthesize porcentagem;


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
	indicator.hidden = TRUE;
    progresso.hidden = TRUE;
    [self initComponet];
}

-(void)initComponet
{
    indicator.hidden = TRUE;
    progresso.hidden = TRUE;
    progresso.progress = 0.0;
}


-(void)makeMyProgressBarMoving{
    NSLog(@"estou sendo chamado");
    float actual = [progresso progress];
    if(actual < 1){
        NSLog(@"entrei aqui");
        progresso.progress = actual + 0.1;
        self.porcentagem.text = [NSString stringWithFormat:@"%f",actual];
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)show:(id)sender
{
    indicator.hidden = FALSE;
    [indicator startAnimating];
    progresso.hidden = false;
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    
}

-(IBAction)hide:(id)sender
{
    [indicator stopAnimating];
}


@end
