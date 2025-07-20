//
//  BNRLogger.h
//  Callbacks
//
//  Created by Pei-Han Chao on 9/17/21.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN


@interface BNRLogger : NSObject
<NSURLConnectionDelegate, NSURLConnectionDataDelegate>

{
NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
