#import "NSMutableArray+Q.h"
#import "QBaseTestCase.h"

@interface NSMutableArrayCategoryTest : QBaseTestCase {
    NSMutableArray *stack;
    NSMutableArray *queue;
}
@end


@implementation NSMutableArrayCategoryTest

- (void)setUp {
    stack = [[NSMutableArray alloc] init];
    queue = [[NSMutableArray alloc] init];
}

- (void)testPush {
    
    NSString *obj1 = @"1";
    NSString *obj2 = @"2";
    NSString *obj3 = @"3";
    NSString *obj4 = @"4";
    
    [stack push:obj1];
    [stack push:obj2];
    [stack push:obj3];
    [stack push:obj4];
    
    assertThat([stack pop], equalTo(obj4));
    assertThat([stack pop], equalTo(obj3));
    assertThat([stack top], equalTo(obj2));
    assertThat([stack pop], equalTo(obj2));
    assertThat([stack pop], equalTo(obj1));
    
    assertThat([stack pop], nilValue());

    [stack push:obj1 times:2];
    assertThat([stack pop], equalTo(obj1));
    assertThat([stack pop], equalTo(obj1));
}

- (void)testPushArray {

    NSString *obj1 = @"1";
    NSString *obj2 = @"2";
    NSString *obj3 = @"3";
    NSString *obj4 = @"4";

    [stack pushArray:[NSArray arrayWithObjects:obj1, obj2, obj3, obj4, nil]];

    assertThat([stack pop], equalTo(obj4));
    assertThat([stack pop], equalTo(obj3));
    assertThat([stack pop], equalTo(obj2));
    assertThat([stack pop], equalTo(obj1));

    assertThat([stack pop], nilValue());
}

- (void)testQueue {

    NSString *obj1 = @"1";
    NSString *obj2 = @"2";
    NSString *obj3 = @"3";
    NSString *obj4 = @"4";

    [queue enqueue:obj1];
    [queue enqueue:obj2];
    [queue enqueue:obj3];
    [queue enqueue:obj4];

    assertThat([queue dequeue], equalTo(obj4));
    assertThat([queue dequeue], equalTo(obj3));
    assertThat([queue peek], equalTo(obj2));
    assertThat([queue dequeue], equalTo(obj2));
    assertThat([queue dequeue], equalTo(obj1));

    assertThat([queue dequeue], nilValue());

    [queue enqueue:obj1 times:2];
    assertThat([queue dequeue], equalTo(obj1));
    assertThat([queue dequeue], equalTo(obj1));
}

- (void)testQueueArray {
    NSString *obj1 = @"1";
    NSString *obj2 = @"2";
    NSString *obj3 = @"3";
    NSString *obj4 = @"4";

    [queue enqueueArray:[NSArray arrayWithObjects:obj1, obj2, obj3, obj4, nil]];

    assertThat([queue dequeue], equalTo(obj1));
    assertThat([queue dequeue], equalTo(obj2));
    assertThat([queue dequeue], equalTo(obj3));
    assertThat([queue dequeue], equalTo(obj4));

    assertThat([queue dequeue], nilValue());
}

@end
