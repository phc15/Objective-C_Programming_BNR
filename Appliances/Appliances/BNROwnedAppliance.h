//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by Pei-Han Chao on 9/21/21.
//

#import "BNRAppliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNROwnedAppliance : BNRAppliance

@property (readonly) NSSet *ownerNames;
- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n;
- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;

@end

NS_ASSUME_NONNULL_END
