//
//  BNREmployee.h
//  BMITime
//
//  Created by Pei-Han Chao on 9/16/21.
//

#import "BNRPerson.h"

NS_ASSUME_NONNULL_BEGIN
@class BNRAsset;

@interface BNREmployee : BNRPerson

{
    // pointer arrry instance variable
    // commnt out when switch to set
    // NSMutableArray *_assets;
    
}
@property (nonatomic) unsigned int employeeID;
// @property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
// @property (nonatomic, copy) NSArray *assets;
@property (nonatomic, copy) NSSet *assets;

- (double)yearsOfEmployment;
- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end

NS_ASSUME_NONNULL_END
