#import "NSString+Q.h"

static const NSUInteger StringDefaultCroppingLength = 50;

@implementation NSString (Q)

- (NSString *)stringByCropping {
    return [self stringByCroppingToLength:StringDefaultCroppingLength];
}

- (NSString *)stringByCroppingToLength:(NSUInteger)length {
    if (length >= [self length]) {
        return self;
    }
    
    return [[self substringToIndex:length] stringByAppendingString:@"..."];
}

- (NSString *)stringByTrimmingWsAndNl {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)uuid {
    CFUUIDRef theUuid = CFUUIDCreate(NULL);
    CFStringRef cfString = CFUUIDCreateString(NULL, theUuid);
    CFRelease(theUuid);
    
    NSString *result = [NSString stringWithString:(__bridge NSString *) cfString];
    CFRelease(cfString);

    return result;
}

@end
