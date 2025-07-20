//
//  main.m
//  BMITime
//
//  Created by Pei-Han Chao on 9/15/21.
//

#import <Foundation/Foundation.h>
// #import "BNRPerson.h"
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:
                                        @"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                      returningResponse:NULL
                                                                  error:&error];
        if (!data) {
                    NSLog(@"fetch failed: %@", [error localizedDescription]);
        return 1; }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        /*BOOL written = [data writeToFile:@"/tmp/google.png"
                                        options:0
                                          error:&error];
         */
        
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic
                                       error:&error];
        
        if (!written) {
                   NSLog(@"write failed: %@", [error localizedDescription]);
       return 1; }
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        // if file exists, check it's size
        NSLog(@"The file read from the disk has %lu bytes",(unsigned long)[readData length]);
        // insert code here...
        // NSLog(@"Hello, World!");
        // Create an instance of BNRPerson
        // BNRPerson *mikey = [[BNRPerson alloc] init];
        
        // Give the instance variables interesting values using setters
        // [mikey setWeightInKilos:96];
        // [mikey setHeightInMeters:1.8];
        
        // Log the instance variables using the getters
        // float height = [mikey heightInMeters];
        // int weight = [mikey weightInKilos];
        // NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", height, weight);
        // Create an array of BNREmployee objects
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
                    // Create an instance of BNREmployee
                    BNREmployee *mikey = [[BNREmployee alloc] init];
                    // Give the instance variables interesting values
                    mikey.weightInKilos = 90 + i;
                    mikey.heightInMeters = 1.8 - i/10.0;
                    mikey.employeeID = i;
                    // Put the employee in the employees array
                    [employees addObject:mikey];
            
            // Is this the first employee?
                       if (i == 0) {
                           // setObject(_:forKey:) understore means instance variable
                           // func setObject(_ anObject: Any,
                           // forKey aKey: NSCopying)
                           [executives setObject:mikey forKey:@"CEO"];
                       }
            
            // Is this the second employee?
                       if (i == 1) {
                           [executives setObject:mikey forKey:@"CTO"];
                       }
                }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        
        
        // Create 10 assets
        for (int i = 0; i < 10; i++) {
                   // Create an asset
                   BNRAsset *asset = [[BNRAsset alloc] init];
                   // Give it an interesting label
                   NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
                   asset.label = currentLabel;
                   asset.resaleValue = 350 + (i * 17);
                   // Get a random number between 0 and 9 inclusive
                   NSUInteger randomIndex = random() % [employees count];
                   // Find that employee
                   BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
                   // Assign the asset to the employee
                   [randomEmployee addAsset:asset];
            
                   // ADD TO ALL ASSETS
                   [allAssets addObject:asset];
                }
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets"ascending:YES];
        NSSortDescriptor *eid =[NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        [employees sortUsingDescriptors: @[voa, eid]];

        // show override description
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        
        // Print out the entire dictionary
                NSLog(@"executives: %@", executives);
                // Print out the CEO's information
                NSLog(@"CEO: %@", executives[@"CEO"]);
                executives = nil;
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of arrays");
        allAssets = nil;
        employees = nil;
    }
    sleep(100);
    return 0;
}
