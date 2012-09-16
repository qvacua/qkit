#import "NSDictionary+Q.h"


@implementation NSDictionary (Q)

#if __MAC_OS_X_VERSION_MAX_ALLOWED < 1080
#pragma mark Subscript support for OS X < 10.8
- (id)objectForKeyedSubscript:(id)key {
    return [self objectForKey:key];
}
#endif

@end
