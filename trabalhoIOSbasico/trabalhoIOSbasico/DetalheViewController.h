//
//  DetalheViewController.h
//  trabalhoIOSbasico
//
//  Created by Dainf on 18/12/14.
//  Copyright (c) 2014 utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheViewController : UIViewController
{
    UILabel *lbl_nome;
    UILabel *lbl_profissao;
    UILabel *lbl_sexo;
    UILabel *lbl_idade;
    NSString *nome;
    NSString *profissao;
    NSString *sexo;
    NSString *idade;
}
-(IBAction)close:(id)sender;

@property(nonatomic,retain) IBOutlet UILabel *lbl_nome;
@property(nonatomic,retain) IBOutlet UILabel *lbl_profissao;
@property(nonatomic,retain) IBOutlet UILabel *lbl_sexo;
@property(nonatomic,retain) IBOutlet UILabel *lbl_idade;


@property NSString *nome;
@property NSString *profissao;
@property NSString *sexo;
@property NSString *idade;
@end
