#import <Foundation/Foundation.h>

/**
* Adds some convenience methods to the NSString+Q
*/
@interface NSString (Q)

/**
* Crops the string to 100 chars and adds "..." at the end.
*/
- (NSString *)stringByCropping;

/**
* Crops the string to the given length and adds "..." at the end.
*/
- (NSString *)stringByCroppingToLength:(NSUInteger)length;

/**
* Trims the string from whitespaces and new lines.
*/
- (NSString *)stringByTrimmingWsAndNl;

+ (NSString *)uuid;

@end
