//
//  main.m
//  Callbacks
//
//  Created by Pei-Han Chao on 9/17/21.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 1
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        //observer
        [[NSNotificationCenter defaultCenter]
         addObserver:logger
         selector:@selector(zoneChange:)
         name:NSSystemTimeZoneDidChangeNotification
         object:nil];
        
        NSURL *url = [NSURL URLWithString:
                                   @"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        
        __unused NSURLConnection *fetchConn =
                                     [[NSURLConnection alloc] initWithRequest:request
                                                                     delegate:logger
                                                             startImmediately:YES];
        
        // A timer that fires after a certain time interval has elapsed, sending a specified message to a target object.
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                          // 2
                                            target:logger
                          // 3
                                            selector:@selector(updateLastTime:)
                                            userInfo:nil
                                            repeats:YES];
        // run: Puts the receiver into a permanent loop, during which time it processes data from all attached input sources.
        // 5
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
