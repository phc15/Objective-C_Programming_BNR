//
//  BNRAsset.m
//  BMITime
//
//  Created by Pei-Han Chao on 9/16/21.
//

#import "BNRAsset.h"
//step3 for holder
#import "BNREmployee.h"

@implementation BNRAsset

- (NSString *)description
{
    //return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
    if (self.holder) {
        // step4
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>",
                self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>",
         self.label, self.resaleValue];
    }

}
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

/*- (void)setHolder:(BNREmployee *)e
{
    _holder = e;
    // self = current asset object
    [e addAsset:self];
}*/

@end
