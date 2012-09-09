//
//  BIDViewController.m
//  chainRXN
//
//  Created by zz zhangz on 12-9-9.
//  Copyright (c) 2012年 YinSui.ZZ. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView.scalesPageToFit = YES;
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resPath = [bundle resourcePath];
    
    NSString *filePath = [resPath stringByAppendingFormat:@"/index.html"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];  
  
    webView.delegate = self;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end
