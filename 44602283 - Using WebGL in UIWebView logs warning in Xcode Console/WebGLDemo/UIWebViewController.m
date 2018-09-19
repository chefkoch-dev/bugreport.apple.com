#import "UIWebViewController.h"

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:webView];

    [NSLayoutConstraint activateConstraints:@[
                                              [webView.safeAreaLayoutGuide.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor],
                                              [webView.safeAreaLayoutGuide.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [webView.safeAreaLayoutGuide.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor],
                                              [webView.safeAreaLayoutGuide.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
                                              ]];

    NSURL *webGLSample = [NSURL URLWithString:@"https://webglsamples.org/blob/blob.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:webGLSample];
    [webView loadRequest:request];
}

@end
