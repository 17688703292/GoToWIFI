//
//  ViewController.m
//  GoToWIFI
//
//  Created by 赵勇 on 2018/7/11.
//  Copyright © 2018年 赵勇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.




}

- (void)viewWillAppear:(BOOL)animated{
    
    [self GoToWifiSetting];
}



-(void)GoToWifiSetting{
    
    NSData *encryptString = [[NSData alloc] initWithBytes:(unsigned char []){0x70,0x72,0x65,0x66,0x73,0x3a,0x72,0x6f,0x6f,0x74,0x3d,0x57,0x49,0x46,0x49} length:15];
    
    NSString *string = [[NSString alloc] initWithData:encryptString encoding:NSUTF8StringEncoding];
    
    
    NSData *appencryptString = [[NSData alloc] initWithBytes:(unsigned char []){0x41,0x70,0x70,0x2d,0x50,0x72,0x65,0x66,0x73,0x3a,0x72,0x6f,0x6f,0x74,0x3d,0x57,0x49,0x46,0x49} length:19];
    
    NSString *appstring = [[NSString alloc] initWithData:appencryptString encoding:NSUTF8StringEncoding];

    if ([[UIDevice currentDevice].systemVersion doubleValue] > 10.0) {
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:string]]) {
            
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string] options:@{} completionHandler:nil];
            } else {
                // Fallback on earlier versions
            }
        } else {
            
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appstring] options:@{} completionHandler:nil];
            } else {
                // Fallback on earlier versions
            }
        }
        
    }else{
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:string]]) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
        } else {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appstring]];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
