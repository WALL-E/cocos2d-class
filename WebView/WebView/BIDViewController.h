//
//  BIDViewController.h
//  WebView
//
//  Created by zz zhangz on 12-9-6.
//  Copyright (c) 2012年 YinSui.ZZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UIWebViewDelegate>
{
    UIActivityIndicatorView *activityIndicatorView;
}

@property (retain, nonatomic) IBOutlet UIWebView *webView;

@property (retain, nonatomic) IBOutlet UITextField *textField;
@end
