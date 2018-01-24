//
//  ViewController.m
//  iosProva2
//
//  Created by Dainf on 18/03/15.
//  Copyright (c) 2015 com.utfpr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

@synthesize txt_aluno;
@synthesize txt_nota1;
@synthesize txt_nota2;
@synthesize lbl_media;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sqlite3 *myDatabase;
    if (sqlite3_open([[self getFilePath] UTF8String], &myDatabase) != SQLITE_OK)  {
        NSAssert(FALSE, @"FALHA DA ABERTURA DO BANCO DE DADOS");
    }
    
    const char *sql_smt = "CREATE TABLE IF NOT EXISTS ALUNOS(ID INTEGER PRIMARY KEY AUTOINCREMENT,ALUNO TEXT,NOTA1 TEXT,NOTA2 TEXT,MEDIA TEXT)";
    
    char *errMsg;
    
    if(sqlite3_exec(myDatabase, sql_smt, NULL, NULL, &errMsg) == SQLITE_OK)
    {
        NSLog(@"MASSA");
    }else
    {
        NSLog(@"NAO MASSA");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    //    if(textField == self.txt_nome){
    //        [self becomeFirstResponder]
    //    }
    [self.view endEditing:TRUE];
    return YES;
}

-(IBAction)salvar:(id)sender
{
    sqlite3 *myDatabase;
    sqlite3_stmt *startment;
    if (sqlite3_open([[self getFilePath] UTF8String], &myDatabase) != SQLITE_OK)  {
        NSAssert(FALSE, @"FALHA DA ABERTURA DO BANCO DE DADOS");
    }
    else
    {
        NSString *innerSQL = [NSString stringWithFormat:@"INSERT INTO ALUNOS(ALUNO,NOTA1,NOTA2,MEDIA) VALUES(\"%@\",\"%@\",\"%@\",\"%@\")",self.txt_aluno.text,self.txt_nota1.text,self.txt_nota2.text,self.lbl_media.text];
        
        const char *insert_stmt  = [innerSQL UTF8String];
        NSLog(@"Teste: %@",innerSQL);
        
        sqlite3_prepare(myDatabase, insert_stmt, -1, &startment, NULL);
        
        
        if(sqlite3_step(startment) == SQLITE_DONE)
        {
            //NSAssert(FALSE, @"REGISTRO SALVO COM SECESSO");
            self.lbl_media.text = @"0,0";
            self.txt_aluno.text = @"";
            self.txt_nota1.text = @"";
            self.txt_nota2.text = @"";
            
            UIAlertView *janela = [[UIAlertView alloc] initWithTitle:@"Sucesso" message:@"Registro salvo com sucesso!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [janela show];
        }else
        {
            NSLog(@"NAO SALVO");
        }
    }
}
-(IBAction)media:(id)sender;
{
    float nota1 = [self.txt_nota1.text floatValue];
    float nota2 = [self.txt_nota2.text floatValue];
    
    float media = (nota1+nota2)/2;
    
    
    self.lbl_media.text = [[NSNumber numberWithFloat:media] stringValue];
}

-(IBAction)visualizar:(id)sender;
{

}

-(NSString *) getFilePath
{
    NSArray *userDomainPath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, TRUE);
    
    NSString *documentsDir = [userDomainPath objectAtIndex:0];
    
    return [documentsDir stringByAppendingString:@"mydatabase.db"];
}
@end
