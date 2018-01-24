//
//  FormViewController.h
//  trabalhoIOSbasico
//
//  Created by macos on 12/17/14.
//  Copyright (c) 2014 utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    UIPickerView *picker_profissao;
    UITextField  *txt_nome;
    UISlider     *slider_idade;
    UISegmentedControl *segmented_sexo;
    UILabel *lbl_value_idade;
}

@property(nonatomic,retain) IBOutlet UIPickerView *picker_profissao;
@property(nonatomic,retain) IBOutlet UITextField  *txt_nome;
@property(nonatomic,retain) IBOutlet UISlider     *slider_idade;
@property(nonatomic,retain) IBOutlet UISegmentedControl *segmented_sexo;
@property(nonatomic,retain) IBOutlet UILabel *lbl_value_idade;

-(IBAction)salvar:(id)sender;
-(IBAction)chagesSliderValue:(id)sender;

@end
