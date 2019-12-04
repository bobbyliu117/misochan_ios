#import "MainViewController.h"
#import "InventoryViewController.h"
#import "Treasure.h"
#import <MisoChan-Swift.h>

#define BEGIN_DIFFICULTY @50
#define LEVELS @[@10,@20,@30,@40]
#define FACTOR 10
#define TOAST_LENGTH 1.5

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelToast;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redViewWidth;

@property (strong, nonatomic) NSMutableArray<Treasure*> *data;
@end

@implementation MainViewController {
    NSNumber *score;
    NSNumber *threshold;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    score = 0;
    threshold = BEGIN_DIFFICULTY;
    self.data = [NSMutableArray array];
    [self initUI];
}

-(void)initUI {
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationItem.title = self.tag == nil ? @"MisoChan" : self.tag;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"title_ins_1", nil) style:UIBarButtonItemStyleDone target:self action:@selector(instructUser)];
    UIImage *rightImage = [[UIImage imageNamed:@"backpack"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(toInventory)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Inven" style:UIBarButtonItemStylePlain target:self action:@selector(toInventory)];
    
    self.labelScore.text = [NSString stringWithFormat:NSLocalizedString(@"score", nil), score];
    self.labelToast.layer.cornerRadius = 20;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)];
    [self.redView addGestureRecognizer:pan];
}

-(void)instructUser{
    Utils.showAlert(self, NSLocalizedString(@"title_ins_1", nil), NSLocalizedString(@"instruction_1", nil), ^{
        
    });
}

-(void)gesture:(UIPanGestureRecognizer*)g{
    if (arc4random_uniform([threshold intValue]) == 2) {
        [self handleTreasureFound];
    }
    CGPoint offset = [g translationInView:g.view];
    g.view.transform = CGAffineTransformTranslate(g.view.transform, offset.x, offset.y);
    [g setTranslation:CGPointZero inView:g.view];
}

-(void)handleTreasureFound {
    [self.data addObject:[Treasure treasure]];
    score = [NSNumber numberWithInt:([score intValue]+1)];
    self.labelScore.text = [NSString stringWithFormat:NSLocalizedString(@"score", nil), [score intValue]];
    BOOL shouldIncreaseDifficulty = [LEVELS containsObject:score];
    if (shouldIncreaseDifficulty) {
        [self changeRedViewSize];
    }
    void (^completionHandler)(void) = shouldIncreaseDifficulty ? ^void(){
        self->threshold = [NSNumber numberWithInt:[self->score intValue]*FACTOR];
        [self showToast:NSLocalizedString(@"difficulty_increased", nil) onComplete:nil];
    } : nil;
    [self showToast:NSLocalizedString(@"treasure_found", nil) onComplete:completionHandler];
}

-(BOOL)shouldIncreadDiff{
    for (NSNumber *num in LEVELS) {
        if ([num isEqualToNumber:score]) {
            return YES;
        }
    }
    return NO;
}

-(void)showToast:(NSString*)message onComplete:(void(^)(void))handler{
    self.labelToast.text = message;
    self.labelToast.alpha = 0.8;
    
    [UIView animateWithDuration:TOAST_LENGTH animations:^{
        self.labelToast.alpha = 0;
    } completion:^(BOOL finished) {
        if (handler) handler();
    }];
}

-(void)changeRedViewSize{
    int newWidth = 65 - [score intValue];
    int width = newWidth >= 10 ? newWidth : 10;
    self.redViewWidth.constant = width;
}

-(void)toInventory{
    InventoryViewController *c = InventoryViewController.new;
    c.data = self.data;
    [self.navigationController pushViewController:c animated:YES];
}
@end
