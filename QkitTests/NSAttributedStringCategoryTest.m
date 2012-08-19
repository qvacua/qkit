#import "QBaseTestCase.h"
#import "NSAttributedString+Q.h"

@interface NSAttributedStringCategoryTest : QBaseTestCase @end

@implementation NSAttributedStringCategoryTest

- (void)testFontOfBeginning {
    NSAttributedString *emptyAttrStr = [[NSAttributedString alloc] init];
    assertThat([emptyAttrStr fontOfTheBeginning], nilValue());
}

- (void)testFontOfBeginningWithNonTrivialFont {
    NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
    [attr setObject:[NSFont fontWithName:@"Menlo" size:50] forKey:NSFontAttributeName];

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"never say no to panda" attributes:attr];

    assertThatFloat([[attrStr fontOfTheBeginning] pointSize], equalToFloat(50));
    assertThat([[attrStr fontOfTheBeginning] familyName], is(@"Menlo"));
}

@end
