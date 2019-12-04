//
//  Treasure.h
//  MisoChan
//
//  Created by Chang Liu on 12/4/19.
//  Copyright © 2019 Chang Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Treasure : NSObject
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
+(instancetype)treasure;
@end

NS_ASSUME_NONNULL_END
