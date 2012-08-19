#import <OCHamcrest/OCHamcrest.h>
#import <OCHamcrest/HCDescription.h>
#import "NumberMatchers.h"


@implementation FloatMatcher {
    CGFloat targetNumber;
    NumberMatchMode mode;
}

+ (id)isEqualToFloat:(CGFloat)number mode:(NumberMatchMode)mode {
    return [[FloatMatcher alloc] initWithFloat:number mode:mode];
}

- (id)initWithFloat:(CGFloat)number mode:(NumberMatchMode)aMode {
    if ((self = [super init])) {
        targetNumber = number;
        mode = aMode;
    }

    return self;
}

- (BOOL)matches:(id)item {
    switch (mode) {
        case LESS:
            return [item floatValue] < targetNumber;

        case GREATER:
            return [item floatValue] > targetNumber;
    }
    
    return NO;
}

- (void)describeTo:(id <HCDescription>)description {
    NSString *desc;
    
    switch (mode) {
        case LESS:
            desc = [NSString stringWithFormat:@"is less than float %.2f", targetNumber];
            break;

        case GREATER:
            desc = [NSString stringWithFormat:@"is greater than float %.2f", targetNumber];
            break;
    }

    [description appendText:desc];
}

@end

id<HCMatcher> lessThanFloat(CGFloat targetNumber) {
    return [FloatMatcher isEqualToFloat:targetNumber mode:LESS];
}
id<HCMatcher> greaterThanFloat(CGFloat targetNumber) {
    return [FloatMatcher isEqualToFloat:targetNumber mode:GREATER];
}
