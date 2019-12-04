#import "Treasure.h"

#define DATA @[@{@"bone_gray":@"Bone Gray"},@{@"cameo_blue":@"Cameo Blue"},@{@"cameo_orange":@"Cameo Orange"}]

@implementation Treasure
+ (instancetype)treasure {
    Treasure *instance = self.new;
    NSDictionary *dict = DATA[arc4random_uniform(3)];
    instance.imageName = dict.allKeys.firstObject;
    instance.title = dict.allValues.firstObject;
    return instance;
}
@end
