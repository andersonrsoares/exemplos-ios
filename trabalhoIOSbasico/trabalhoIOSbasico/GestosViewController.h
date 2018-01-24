//
//  GestosViewController.h
//  trabalhoIOSbasico
//
//  Created by Dainf on 18/12/14.
//  Copyright (c) 2014 utfpr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestosViewController : UIViewController
{
    UILabel *lbl_count;
    
}

@property(nonatomic,retain) IBOutlet UILabel *lbl_count;
-(void)handleSingleTap:(UITapGestureRecognizer *) recognizer;
@end
