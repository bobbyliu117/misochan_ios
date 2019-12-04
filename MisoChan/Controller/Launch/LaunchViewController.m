#import "LaunchViewController.h"
#import "MainViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [self performSelector:@selector(toVC) withObject:nil afterDelay:1];
}

-(void)toVC{
    [self.navigationController setViewControllers:@[MainViewController.new] animated:NO];
}

@end
