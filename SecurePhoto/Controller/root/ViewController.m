//
//  ViewController.m
//  SecurePhoto
//
//  Created by Bill on 2018/2/11.
//  Copyright © 2018年 Bill. All rights reserved.
//

#import "ViewController.h"
#import "ExplortViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self dismissKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(id)sender {
    [self dismissKeyboard];
    NSString *password = @"hello world!";
//    NSString *password = @"";
    NSString *input = [_secureField text];
    
    if ([input isEqualToString:password]) {
        [_secureField setText:@""];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ExplortViewController *exploreVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ExplortViewController"];
        NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        exploreVC.entry = dbPath;
//        [self presentViewController:exploreVC animated:YES completion:^{}];
        [self.navigationController pushViewController:exploreVC animated:YES];
        
    } else if (input.length == 0) {

        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"请输入暗号" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    } else {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"暗号通过" message:@"您的手机5秒钟后将会变身" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}


#pragma mark 键盘相关
//隐藏键盘
- (void)dismissKeyboard
{
    [self.secureField resignFirstResponder];
}

@end
