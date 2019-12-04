#import "MainViewController.h"
#import <MisoChan-Swift.h>

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationItem.title = self.tag == nil ? @"MisoChan" : self.tag;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    Utils.showAlert(self);
}


-(void)gesture:(UIPanGestureRecognizer*)g{
    // 00 获取手指位置
    CGPoint currentPosition = [g locationInView:g.view];
    // 00 获得偏移量
    CGPoint offset = [g translationInView:g.view];
    g.view.transform = CGAffineTransformTranslate(g.view.transform, offset.x, offset.y);
    // 00 translationInView会积累，需清空，下次才会得到偏移量
    [g setTranslation:CGPointZero inView:g.view];
}

@end
