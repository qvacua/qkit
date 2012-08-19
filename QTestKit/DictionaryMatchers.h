#import <OCHamcrest/HCBaseMatcher.h>
#import <objc/objc-api.h>

@interface DictionaryMatchers : HCBaseMatcher
- (id)initWithKey:(id)key matcher:(id <HCMatcher>)matcher;
@end

@interface ArrayMatchers : HCBaseMatcher
- (id)initWithIndex:(NSUInteger)index matcher:(id <HCMatcher>)matcher;
@end

OBJC_EXPORT id<HCMatcher> atKey(id key, id<HCMatcher> matcher);
OBJC_EXPORT id<HCMatcher> atIndex(id key, id<HCMatcher> matcher);

