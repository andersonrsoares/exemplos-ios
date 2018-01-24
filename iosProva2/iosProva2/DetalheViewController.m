//
//  DetalheViewController.m
//  iosProva2
//
//  Created by Dainf on 18/03/15.
//  Copyright (c) 2015 com.utfpr. All rights reserved.
//

#import "DetalheViewController.h"

@interface DetalheViewController ()


@end

@implementation DetalheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.lbl_aluno.text = self.aluno;
    self.lbl_nota1.text = self.nota1;
    self.lbl_nota2.text = self.nota2;
    self.lbl_media.text = self.media;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)fechar:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
