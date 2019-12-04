#import "AppDelegate.h"
#import "LaunchViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = UIWindow.new;
    [window makeKeyAndVisible];
    window.rootViewController = [[UINavigationController alloc]initWithRootViewController:LaunchViewController.new];
    self.window = window;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    NSString * deeplinkingString = userActivity.webpageURL.lastPathComponent;
    if ([deeplinkingString isEqualToString:@"ios"]) {
        NSMutableString *params = NSMutableString.string;
        NSURLComponents * components = [NSURLComponents componentsWithURL:userActivity.webpageURL resolvingAgainstBaseURL:NO];
        for (NSURLQueryItem* queryItem in components.queryItems) {
            NSString * token = queryItem.value;
            [params appendFormat:@"%@ ",token];
        }
        UINavigationController *nav = (UINavigationController*)self.window.rootViewController;
        MainViewController *controller = MainViewController.new;
        controller.tag = params;
        [nav setViewControllers:@[controller] animated:NO];
        return YES;
    }
    return NO;
}

@end
