//
//  BIDViewController.h
//  drawHtml5
//
//  Created by zz zhangz on 12-9-8.
//  Copyright (c) 2012年 YinSui.ZZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UIWebViewDelegate>
{
    UIActivityIndicatorView *activityindicatorView;
}

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@end
