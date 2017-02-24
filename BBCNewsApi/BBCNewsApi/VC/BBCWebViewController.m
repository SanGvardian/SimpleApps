//
//  BBCWebViewController.m
//  BBCNewsApi
//
//  Created by Alexander Gvardian on 06.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "BBCWebViewController.h"

@interface BBCWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation BBCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}





@end
