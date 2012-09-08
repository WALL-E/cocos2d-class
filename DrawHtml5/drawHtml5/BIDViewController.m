//
//  BIDViewController.m
//  drawHtml5
//
//  Created by zz zhangz on 12-9-8.
//  Copyright (c) 2012年 YinSui.ZZ. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize webView;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView.scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:@"http://www.zhangz.me/html5/draw/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
    
    activityindicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityindicatorView setCenter:self.view.center];
    [activityindicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityindicatorView setColor:[UIColor orangeColor]];
    [self.view addSubview:activityindicatorView];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //NSLog(@"start");
    [activityindicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityindicatorView stopAnimating];
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
    [imageView release];
    [super dealloc];
}
@end
