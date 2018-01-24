//
//  ViewController.h
//  iosProva2
//
//  Created by Dainf on 18/03/15.
//  Copyright (c) 2015 com.utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *txt_aluno;
    UITextField *txt_nota1;
    UITextField *txt_nota2;
    UILabel *lbl_media;
}

@property(nonatomic,retain) IBOutlet UITextField *txt_aluno;
@property(nonatomic,retain) IBOutlet UITextField *txt_nota1;
@property(nonatomic,retain) IBOutlet UITextField *txt_nota2;
@property(nonatomic,retain) IBOutlet UILabel *lbl_media;
-(IBAction)salvar:(id)sender;
-(IBAction)media:(id)sender;
-(IBAction)visualizar:(id)sender;
-(NSString *) getFilePath;

@end

