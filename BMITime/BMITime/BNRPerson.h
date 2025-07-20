//
//  BNRPerson.h
//  
//
//  Created by Pei-Han Chao on 9/15/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPerson : NSObject
{
    
    float _heightInMeters;
    int _weightInKilos;
}

// BNRPerson has methods to read and set its instance variables
- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;
// BNRPerson has a method that calculates the Body Mass Index
- (float)bodyMassIndex;


@end

NS_ASSUME_NONNULL_END
