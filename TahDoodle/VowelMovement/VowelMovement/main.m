//
//  main.m
//  VowelMovement
//
//  Created by Pei-Han Chao on 9/18/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun",
                                     @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"original strings: %@", originalStrings);
        
        // empty mutable array
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        // create a list of characters to be removed from the string
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        // declare a block
        void (^devowelizer) (id, NSUInteger, BOOL *);
        
        // Compose a block,
        // This block will make a copy of a given string, remove
        // the vowels from the copied string, and then add this
        // string to the devowelizedStrings array.
        
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            
            NSRange yRange = [string rangeOfString:@"y"
                                           options:NSCaseInsensitiveSearch];
            
            // Did I find a y?
                if (yRange.location != NSNotFound) {
                    *stop = YES; // Prevent further iterations
                    return;      // End this iteration
                }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for(NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            
            [devowelizedStrings addObject:newString];
            
        };
        // Iterate over the array with your block
                [originalStrings enumerateObjectsUsingBlock:devowelizer];
                NSLog(@"devowelized strings: %@", devowelizedStrings);
        
    }
    return 0;
}
