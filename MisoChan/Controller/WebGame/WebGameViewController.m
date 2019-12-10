#import "WebGameViewController.h"
@import WebKit;

@interface WebGameViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation WebGameViewController {
    BOOL rotated;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self performSelector:@selector(setupWebView) withObject:self afterDelay:8];
    [self setupWebView];
}

-(void)setupWebView{
    [self.webView.configuration.preferences setValue:@"YES" forKey:@"allowFileAccessFromFileURLs"];
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeLeft) forKey:@"orientation"];
    [UINavigationController attemptRotationToDeviceOrientation];
    
    NSURL *url = [NSBundle.mainBundle URLForResource:@"index" withExtension:@"html" subdirectory:@"WebGames"];
    [self.webView loadFileURL:url allowingReadAccessToURL:url];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.youtube.com"]]];
}

// 00 锁定rotate
- (BOOL)shouldAutorotate {
    if (!rotated) {
        rotated = YES;
        return YES;
    }
    
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations { return UIInterfaceOrientationMaskLandscapeLeft;}

@end
