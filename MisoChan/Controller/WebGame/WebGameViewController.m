#import "WebGameViewController.h"
@import WebKit;

@interface WebGameViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation WebGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupWebView];
}

-(void)setupWebView{
    
//    NSURL *url = [NSBundle.mainBundle URLForResource:@"index" withExtension:@"html" subdirectory:@"WebGames"];
//    [self.webView loadFileURL:url allowingReadAccessToURL:url];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.youtube.com"]]];
}

@end
