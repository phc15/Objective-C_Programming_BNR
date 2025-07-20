//
//  BNRAppliance.m
//  Appliances
//
//  Created by Pei-Han Chao on 9/21/21.
//

#import "BNRAppliance.h"

@implementation BNRAppliance
- (instancetype)initWithProductName:(NSString *)pn
{
    // Call NSObject's init method
    self = [super init];
    // Did it return something non-nil?
    if (self) {
        // Set the product name
        _productName = [pn copy];
        // Give voltage a starting value
        _voltage = 120;
}
    return self;
}


@end
