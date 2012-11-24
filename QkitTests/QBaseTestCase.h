#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import "NumberMatchers.h"
#import "DictionaryMatchers.h"
#import "HCValueAssert.h"
#import "HCValueMatcher.h"

#import "ArgumentCaptor.h"

#define hasSize(number) hasCount(equalToInt(number))
#define consistsOf(...) contains(__VA_ARGS__, nil)
#define consistsOfInAnyOrder(...) containsInAnyOrder(__VA_ARGS__, nil)

@interface QBaseTestCase : SenTestCase @end

