#import <Foundation/Foundation.h>

@interface NSArray (Q)

#if __MAC_OS_X_VERSION_MAX_ALLOWED < 1080
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
#endif

@end
