//
//  BNRAsset.h
//  BMITime
//
//  Created by Pei-Han Chao on 9/16/21.
//

#import <Foundation/Foundation.h>
// step1
@class BNREmployee;

NS_ASSUME_NONNULL_BEGIN

@interface BNRAsset : NSObject
@property (nonatomic, copy) NSString *label;
@property (nonatomic) unsigned int resaleValue;
// step2
@property (nonatomic, weak) BNREmployee *holder;
@end

NS_ASSUME_NONNULL_END
