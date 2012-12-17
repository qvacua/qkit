#import <OCHamcrest/HCBaseMatcher.h>
#import <objc/objc-api.h>

#define isTrue equalToBool(YES)
#define isFalse equalToBool(NO)

#define isYes is(@(YES))
#define isNo is(@(NO))

typedef enum {
    LESS = -1,
    GREATER = 1
} NumberMatchMode;

@interface FloatMatcher : HCBaseMatcher

+ (id)isEqualToFloat:(CGFloat)number mode:(NumberMatchMode)mode;

- (id)initWithFloat:(CGFloat)number mode:(NumberMatchMode)aMode;

@end

OBJC_EXPORT id<HCMatcher> lessThanFloat(CGFloat targetNumber);
OBJC_EXPORT id<HCMatcher> greaterThanFloat(CGFloat targetNumber);
