//
//  DetalheViewController.m
//  trabalhoIOSbasico
//
//  Created by Dainf on 18/12/14.
//  Copyright (c) 2014 utfpr. All rights reserved.
//

#import "DetalheViewController.h"

@interface DetalheViewController ()

@end

@implementation DetalheViewController

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
    // Do any additional setup after loading the view from its nib.
    self.lbl_idade.text = self.idade;
    self.lbl_nome.text = self.nome;
    self.lbl_profissao.text = self.profissao;
    self.lbl_sexo.text = self.sexo;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
