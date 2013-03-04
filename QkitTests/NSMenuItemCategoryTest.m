#import "NSMenuItem+Q.h"
#import "QBaseTestCase.h"

@interface NSMenuItemCategoryTest : QBaseTestCase
@end


@implementation NSMenuItemCategoryTest {
    NSMenuItem *menuItem;
}

- (void)setUp {
    menuItem = [[NSMenuItem alloc] init];
    menuItem.title = @"Test Menu Item";
}

- (void)testBlockAction {
    __block int dummy = 0;

    void (^block)(id) = ^(id sender) {
        dummy = 1;
    };

    [menuItem setBlockAction:block];
    assertThat([menuItem blockAction], is(block));
    assertThat([menuItem target], is(menuItem));

    [menuItem performSelector:[menuItem action] withObject:self];
    assertThat(@(dummy), is(@1));
}

@end
