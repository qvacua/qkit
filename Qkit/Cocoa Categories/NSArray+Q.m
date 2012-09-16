#import "NSArray+Q.h"

@implementation NSArray (Q)

#if __MAC_OS_X_VERSION_MAX_ALLOWED < 1080
#pragma mark Subscript support for OS X < 10.8
- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self objectAtIndex:idx];
}
#endif

@end
