#import <Foundation/Foundation.h>

@interface NSDictionary (Q)

#if __MAC_OS_X_VERSION_MAX_ALLOWED < 1080
- (id)objectForKeyedSubscript:(id)key;
#endif

@end

@interface NSMutableDictionary (Q)

#if __MAC_OS_X_VERSION_MAX_ALLOWED < 1080
- (void)setObject:(id)newValue forKeyedSubscript:(id)key;
#endif

@end
