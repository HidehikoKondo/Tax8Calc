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
    
    // 画像を表示する
    UIButton *btn = sender;

    [self.view addSubview:btn];
    
    // アニメーション
    [UIView animateWithDuration:0.13f // アニメーション速度2.5秒
                          delay:0.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         // 画像を2倍に拡大
                         btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
                         btn.alpha = 0.1;
                         
                     } completion:^(BOOL finished) {
                         // アニメーション終了時
                         NSLog(@"アニメーション終了");
                         btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         btn.alpha = 1;
                     }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        calculator = [[Calculator alloc] init];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    //userdefaultsに背景色を保存
    self.view.backgroundColor = [self colorForKey:@"color"];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
