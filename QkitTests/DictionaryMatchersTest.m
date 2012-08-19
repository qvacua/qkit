#import "QBaseTestCase.h"

@interface DictionaryMatchersTest : QBaseTestCase
@end

@implementation DictionaryMatchersTest

- (void)testAtKey {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    [dict setObject:@"first" forKey:@"1"];

    assertThat(dict, atKey(@"1", equalTo(@"first")));
    assertThat(dict, atKey(@"1", isNot(nilValue())));
}

@end
