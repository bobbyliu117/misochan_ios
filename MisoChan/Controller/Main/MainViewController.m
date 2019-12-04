#import "MainViewController.h"
#import <MisoChan-Swift.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    Utils.showAlert(self);
}


@end
