//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by Pei-Han Chao on 9/21/21.
//

#import "BNROwnedAppliance.h"

@interface BNROwnedAppliance ()
{
    NSMutableSet *_ownerNames;
}
@end


@implementation BNROwnedAppliance

- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n
{
    // Call the superclass's initializer
    if (self = [super initWithProductName:pn])
        // Create a set to hold owners names
        _ownerNames = [[NSMutableSet alloc] init];
        // Is the first owner name non-nil?
        if (n) {
            [_ownerNames addObject:n];
        }
    // Return a pointer to the new object
    return self;
}

- (void)addOwnerName:(NSString *)n
{
    [_ownerNames addObject:n];
}
- (void)removeOwnerName:(NSString *)n
{
    [_ownerNames removeObject:n];
}
- (NSSet *)ownerNames
{
    return [_ownerNames copy];
}

@end
