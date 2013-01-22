#import "QObservedObject.h"

@implementation QObserverInfo

@synthesize observer = _observer;
@synthesize keyPath = _keyPath;

- (id)initWithObserver:(__weak id)anObserver keyPath:(NSString *)aKeyPath {
    self = [super init];
    if (self) {
        _observer = anObserver;
        _keyPath = [aKeyPath copy];
    }

    return self;
}

- (BOOL)isEqual:(QObserverInfo *)info {
    if (info == self) {
        return YES;
    }

    if (!info || ![info isKindOfClass:[self class]]) {
        return NO;
    }

    return info.observer == _observer && [info.keyPath isEqualToString:_keyPath];
}

- (NSUInteger)hash {
    NSUInteger hash = [self.observer hash];
    hash = hash * 31u + [self.keyPath hash];

    return hash;
}

- (BOOL)isEqualTo:(id)object {
    return [self isEqual:object];
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"Observer: '%@' for key path '%@'", _observer, _keyPath];
}

@end

@implementation QObservedObject {
    NSMutableSet *_observerInfos;
}

@synthesize observerInfos = _observerInfos;

- (id)init {
    self = [super init];
    if (self) {
        _observerInfos = [[NSMutableSet alloc] init];
    }

    return self;
}

- (void)addObserver:(id)observer forKeyPath:(NSString *)keyPath {
    [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    QObserverInfo *infoToAdd = [[QObserverInfo alloc] initWithObserver:observer keyPath:keyPath];

    for (QObserverInfo *info in _observerInfos) {
        if ([info isEqual:infoToAdd]) {
            return;
        }
    }

    [_observerInfos addObject:infoToAdd];
    [super addObserver:observer forKeyPath:keyPath options:options context:context];
}

- (void)removeObserver:(id)observer {
    NSMutableSet *auxSet = [[NSMutableSet alloc] initWithSet:_observerInfos];

    for (QObserverInfo *info in auxSet) {
        if (info.observer == observer) {
            [_observerInfos removeObject:info];
            [self removeObserver:info.observer forKeyPath:info.keyPath];
        }
    }
}

- (void)dealloc {
    NSMutableSet *auxSet = [[NSMutableSet alloc] initWithSet:_observerInfos];

    for (QObserverInfo *info in auxSet) {
        [self removeObserver:info.observer];
    }
}

@end
