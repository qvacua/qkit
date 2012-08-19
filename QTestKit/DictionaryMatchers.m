#import <OCHamcrest/OCHamcrest.h>
#import <OCHamcrest/HCDescription.h>
#import "DictionaryMatchers.h"


@implementation DictionaryMatchers {
    id key;
    id<HCMatcher> matcher;
}

+ (id)atKey:(id)key matches:(id<HCMatcher>)matcher {
    return [[self alloc] initWithKey:(id)key matcher:matcher];
}

- (id)initWithKey:(id)aKey matcher:(id <HCMatcher>)aMatcher {
    if ((self = [super init])) {
        key = aKey;
        matcher = aMatcher;
    }

    return self;
}

- (BOOL)matches:(id)item {
    id value = [item objectForKey:key];

    return [matcher matches:value];
}

- (void)describeTo:(id <HCDescription>)description {
    NSString *str = [NSString stringWithFormat:@"the value of the key '%@' to match: ", key];
    [description appendText:str];
    [description appendDescriptionOf:matcher];
}

@end

id<HCMatcher> atKey(id key, id<HCMatcher> matcher) {
    return [DictionaryMatchers atKey:key matches:matcher];
}


