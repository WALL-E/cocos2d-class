//
//  BIDViewController.m
//  WebView
//
//  Created by zz zhangz on 12-9-6.
//  Copyright (c) 2012年 YinSui.ZZ. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize webView;
@synthesize textField;

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating];
    NSLog(@"start load");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
    NSLog(@"stop load");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityIndicatorView stopAnimating];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}
-(void) loadWebPageWithString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",urlString]];
    NSLog(@"%@", urlString);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (IBAction)buttonPress:(UIButton *)sender {
    [textField resignFirstResponder];
    [self loadWebPageWithString:textField.text];
    [activityIndicatorView startAnimating];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView.scalesPageToFit = YES;
    webView.delegate = self;
    
    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicatorView setCenter:self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicatorView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)dealloc {
    [webView release];
    [textField release];
    [super dealloc];
}
@end
