//
//  FormViewController.m
//  trabalhoIOSbasico
//
//  Created by macos on 12/17/14.
//  Copyright (c) 2014 utfpr. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()
{
    NSArray *picker_data;
}
@end

@implementation FormViewController

@synthesize txt_nome;
@synthesize picker_profissao;
@synthesize segmented_sexo;
@synthesize slider_idade;
@synthesize lbl_value_idade;

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
    self.slider_idade.value = 0.0;
    
    picker_data = [NSArray arrayWithObjects:@"programador",@"advogado",@"medico",@"vendedor",nil];
    self.picker_profissao.dataSource = self;
    self.picker_profissao.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//nu,mero de colunas
-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(int) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [picker_data count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return picker_data[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"Begin editing");
    return TRUE;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Begin return");
    [textField resignFirstResponder];
    return TRUE;
}
-(IBAction)salvar:(id)sender
{
    NSLog(@"segmented %d",self.segmented_sexo.selectedSegmentIndex);
    NSLog(@"slider %d",(int)self.slider_idade.value);
    NSLog(@"nome %@",self.txt_nome.text);
    NSLog(@"profissao  %@",self.picker_profissao.description);
    

}

-(IBAction)chagesSliderValue:(id)sender
{
      NSLog(@"chande value slider");
    int value_slider =  (int)self.slider_idade.value;
    
    self.lbl_value_idade.text  = [NSString stringWithFormat:@"%d",value_slider];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
