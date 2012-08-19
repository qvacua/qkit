#import <Qkit/Qkit.h>
#import "QBaseTestCase.h"
#import "NSObject+Reflection.h"

@interface DummyObject : NSObject @end
@implementation DummyObject @end

@interface DummySecondObject : NSObject @end
@implementation DummySecondObject @end

@protocol DummyProtocol
@required
- (void)dummy;
@end

@interface DummyObjectWithProtocol : NSObject <DummyProtocol> @end
@implementation DummyObjectWithProtocol
- (void)dummy {
    log4Debug(@"dummy");
}
@end

@interface DummyReflectionObject : NSObject
@property(strong, readonly) DummyObject *dummyObj;
@property (strong, readwrite) id <DummyProtocol> protocolObj;
@end

@implementation DummyReflectionObject {
    DummyObject *dummyObj;
    DummySecondObject *stringVar;
    id<DummyProtocol> protocolObj;
}

@synthesize dummyObj;
@synthesize protocolObj;

@end

@interface ReflectionTest : QBaseTestCase @end

@implementation ReflectionTest

- (void)testReflectionWithRealObject {
    DummyReflectionObject *ref = [[DummyReflectionObject alloc] init];
    DummyObject *node = [[DummyObject alloc] init];

    [ref setInstanceVarTo:node];

    assertThat(ref.dummyObj, is(node));
}

- (void)testReflectionWithMock {
    DummyReflectionObject *ref = [[DummyReflectionObject alloc] init];
    DummyObject *node = mock([DummyObject class]);

    [ref setInstanceVarTo:node];

    assertThat(ref.dummyObj, is(node));
}

- (void)testReflectionWithProtocol {
    DummyReflectionObject *ref = [[DummyReflectionObject alloc] init];
    DummyObjectWithProtocol *dataSource = [[DummyObjectWithProtocol alloc] init];

    [ref setInstanceVarTo:dataSource implementingProtocol:@protocol(DummyProtocol)];

    assertThat(ref.protocolObj, is(dataSource));
}

- (void)testReflectionRead {
    DummyReflectionObject *ref = [[DummyReflectionObject alloc] init];
    DummySecondObject *cell = [[DummySecondObject alloc] init];

    [ref setInstanceVarTo:cell];

    assertThat([ref instanceVarOfClass:[DummySecondObject class]], is(cell));
}

@end
