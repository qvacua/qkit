#import "QBaseTestCase.h"

@interface NumberMatchersTest : QBaseTestCase
@end

@implementation NumberMatchersTest

- (void)testFloat {
    assertThatFloat(1.0, lessThanFloat(1.01));
    assertThatFloat(1.0, greaterThanFloat(0.99));
}

@end
