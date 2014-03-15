//
//  ViewController.h
//  Tax8Calc
//
//  Created by UDONKONET on 2014/03/09.
//  Copyright (c) 2014年 UDONKONET. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController{
    id          displayField;
    Calculator *calculator;

}

@property (nonatomic) IBOutlet id displayField;

- (IBAction) press:(id)sender;



@end
