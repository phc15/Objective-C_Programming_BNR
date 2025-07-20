//
//  BNREmployee.m
//  BMITime
//
//  Created by Pei-Han Chao on 9/16/21.
//

#import "BNREmployee.h"
// use this header
#import "BNRAsset.h"

// A class extension
@interface BNREmployee ()
{
    
    NSMutableSet *_assets;
    
}
@property (nonatomic) unsigned int officeAlarmCode;
@end

@implementation BNREmployee

- (void) setAssets:(NSArray *)a
{
    
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a
{
    // Is assets nil?
    if (!_assets) {
        // Create the array
        // _assets = [[NSMutableArray alloc] init];
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
    
    a.holder = self;
}

- (unsigned int)valueOfAssets
{
    // Sum up the resale value of the assets
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
return sum; }

- (NSString *)description
{
    // default is object address
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>",
                                             self.employeeID, self.valueOfAssets];
}
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}



@end
