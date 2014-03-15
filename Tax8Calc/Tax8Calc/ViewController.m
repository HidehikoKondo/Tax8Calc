//
//  ViewController.m
//  Tax8Calc
//
//  Created by UDONKONET on 2014/03/09.
//  Copyright (c) 2014年 UDONKONET. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize displayField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        calculator = [[Calculator alloc] init];
    }
    return self;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction) press:(id)sender {
    NSLog(@"%@",[sender titleForState:UIControlStateNormal]);
    
    //ラベルの1番目の文字列が0 かつ　文字数が1以下　かつ　入力しキーが0の場合は処理しない。
    NSString *str = [(UILabel*)displayField text];
    
    if([str isEqualToString:@"0"] && [sender tag] == 10){
        NSLog(@"何もしない");
    }else{
        NSMutableString *str =  [NSMutableString stringWithString:[sender titleForState:UIControlStateNormal]];
        [calculator input:str];
        [displayField setText:[calculator displayValue]];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        calculator = [[Calculator alloc] init];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
