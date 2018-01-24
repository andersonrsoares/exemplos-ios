//
//  DetalheViewController.h
//  iosProva2
//
//  Created by Dainf on 18/03/15.
//  Copyright (c) 2015 com.utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheViewController : UIViewController
{
    UILabel *lbl_aluno;
    UILabel *lbl_nota1;
    UILabel *lbl_nota2;
    UILabel *lbl_media;
    
    NSString *aluno;
    NSString *nota1;
    NSString *nota2;
    NSString *media;
}

@property(nonatomic,retain) IBOutlet UILabel *lbl_aluno;
@property(nonatomic,retain) IBOutlet UILabel *lbl_nota1;
@property(nonatomic,retain) IBOutlet UILabel *lbl_nota2;
@property(nonatomic,retain) IBOutlet UILabel *lbl_media;

@property NSString *aluno;
@property NSString *nota1;
@property NSString *nota2;
@property NSString *media;

-(IBAction)fechar:(id)sender;
@end
