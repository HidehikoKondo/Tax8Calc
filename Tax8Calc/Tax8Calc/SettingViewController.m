//
//  SettingViewController.m
//  Tax8Calc
//
//  Created by 近藤秀彦 on 2014/03/16.
//  Copyright (c) 2014年 UDONKONET. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    

    
    //userdefaultsに背景色を取得して反映
    self.view.backgroundColor = [self colorForKey:@"color"];
    
    //押してないボタンは星をつけない
    for(int i = 101; i < 125; i++){
        if(
           [(UIColor*)self.view.backgroundColor isEqual:
           ((UIButton *)[self.view viewWithTag:i]).backgroundColor
           
           ]
           ){
            [(UIButton *)[self.view viewWithTag:i] setTitle:@"★" forState:UIControlStateNormal];
        }else{
            [(UIButton *)[self.view viewWithTag:i] setTitle:@"" forState:UIControlStateNormal];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)selectColor:(id)sender{
    NSLog(@"色選択");
    
    //senderからボタンを生成
    UIButton *btn = sender;
    //senderのボタンから背景色を取得して反映
    self.view.backgroundColor = [btn backgroundColor];
    
    //userdefaultsに背景色を保存
    [self setColor:[btn backgroundColor] forKey:@"color"];
    
    //選択したボタンに星をつける
    [btn setTitle:@"★" forState:UIControlStateNormal];
    
    
    //押してないボタンは星をつけない
    for(int i = 101; i < 125; i++){
        if(btn.tag !=  ((UIButton *)[self.view viewWithTag:i]).tag){
            [(UIButton *)[self.view viewWithTag:i] setTitle:@"" forState:UIControlStateNormal];
        }
    }
}



- (UIColor *)colorForKey:(NSString *)defaultName {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    NSData *colorData = [ud objectForKey:defaultName];
    if (colorData!=nil) {
        return (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    } else {
        return nil;
    }
}

- (void)setColor:(UIColor *)value forKey:defaultName {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得

    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:value];
    [ud setObject:colorData forKey:defaultName];
}

@end
