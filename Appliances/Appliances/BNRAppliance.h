//
//  BNRAppliance.h
//  Appliances
//
//  Created by Pei-Han Chao on 9/21/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

- (instancetype)initWithProductName:(NSString *)pn;

@end

NS_ASSUME_NONNULL_END
