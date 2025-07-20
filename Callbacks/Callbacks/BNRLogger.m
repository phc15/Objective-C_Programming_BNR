//
//  BNRLogger.m
//  Callbacks
//
//  Created by Pei-Han Chao on 9/17/21.
//

#import "BNRLogger.h"

@interface BNRLogger ()
- (void)zoneChange:(NSNotification *)note;
@end

@implementation BNRLogger
// 4
- (void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime: now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

- (NSString *)lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
}
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    // Create a mutable data if it does not already exist
        if (!_incomingData) {
            _incomingData = [[NSMutableData alloc] init];
        }
    
        [_incomingData appendData:data];
}

// Called when the last chunk has been processed
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:_incomingData
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"string has %lu characters", [string length]);
    // Uncomment the next line to see the entire fetched file
    // NSLog(@"The whole string is %@", string);
}

// Called if the fetch fails
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed!");
}

@end
