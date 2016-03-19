//
//  ViewController.m
//  LazyloadImage
//
//  Created by CaptainTong on 16/3/20.
//  Copyright © 2016年 tongson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取到需要加载的HTML
    NSString *HtmlString = [self getHTMLString];
    
    //获取temp文件的路径
    NSString *tempPath = [[NSBundle mainBundle]pathForResource:@"temp" ofType:@"html"];
    
    //加载temp内容为字符串
    NSString *tempHtml = [NSString stringWithContentsOfFile:tempPath encoding:NSUTF8StringEncoding error:nil];
    
    //替换temp内的占位符{{Content_holder}}为需要加载的HTML代码
    tempHtml = [tempHtml stringByReplacingOccurrencesOfString:@"{{Content_holder}}" withString:HtmlString];
    
    //Temp目录下的js文件在根路径，因此需要在加载HTMLString时指定根路径
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
    //加载HTMLString
    [webView loadHTMLString:tempHtml baseURL:baseURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)getHTMLString{
    NSString *tempPath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *HtmlString = [NSString stringWithContentsOfFile:tempPath encoding:NSUTF8StringEncoding error:nil];
    return HtmlString;
}

@end
