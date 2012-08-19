#import "QBaseTestCase.h"
#import <Qkit/QObservedObject.h>
#import "DummyObserver.h"

static NSString *const DUMMY_STR_KEY_PATH = @"str";
static NSString *const DUMMY_OTHER_STR_KEY_PATH = @"otherStr";

@interface DummyObservedObject : QObservedObject
@property (readwrite, strong) NSString *str;
@property (readwrite, strong) NSString *otherStr;
@end
@implementation DummyObservedObject {
    NSString *str;
    NSString *otherStr;
}
@synthesize str;
@synthesize otherStr;
@end

@interface ObservedObjectTest : QBaseTestCase
@end

@implementation ObservedObjectTest {
    DummyObservedObject *dummyObj;
    DummyObserver *observer;
}

- (void)setUp {
    dummyObj = [[DummyObservedObject alloc] init];
    observer = [[DummyObserver alloc] init];
}

- (void)testAddObserver {
    [dummyObj addObserver:observer forKeyPath:DUMMY_STR_KEY_PATH];
    [dummyObj addObserver:observer
               forKeyPath:DUMMY_OTHER_STR_KEY_PATH
                  options:NSKeyValueObservingOptionNew
                  context:NULL];

    assertThat(dummyObj.observerInfos, hasSize(2));

    dummyObj.str = @"change it!";
    assertThat(observer.lastObservedObj, equalTo(dummyObj));
    assertThat(observer.lastKeyPath, equalTo(DUMMY_STR_KEY_PATH));

    dummyObj.otherStr = @"change this too!";
    assertThat(observer.lastObservedObj, equalTo(dummyObj));
    assertThat(observer.lastKeyPath, equalTo(DUMMY_OTHER_STR_KEY_PATH));
}

- (void)testSameObserverTwice {
    [dummyObj addObserver:observer forKeyPath:DUMMY_STR_KEY_PATH];
    assertThat(dummyObj.observerInfos, hasSize(1));

    [dummyObj addObserver:observer forKeyPath:DUMMY_STR_KEY_PATH];
    assertThat(dummyObj.observerInfos, hasSize(1));

    [dummyObj removeObserver:observer];

    dummyObj.str = @"change it!";
    assertThat(observer.lastObservedObj, nilValue());
    assertThat(observer.lastKeyPath, nilValue());
}

- (void)testRemoveObserver {
    [dummyObj addObserver:observer forKeyPath:DUMMY_STR_KEY_PATH];
    [dummyObj addObserver:observer forKeyPath:DUMMY_OTHER_STR_KEY_PATH];

    [dummyObj removeObserver:observer];
    assertThat(dummyObj.observerInfos, empty());

    dummyObj.str = @"change it!";
    assertThat(observer.lastObservedObj, nilValue());
    assertThat(observer.lastKeyPath, nilValue());
}

@end
