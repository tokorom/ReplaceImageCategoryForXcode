//
//  TKRGcovFluserTestObserver.m
//
//  Created by ToKoRo on 2013-12-05.
//

#import "TKRGcovFluserTestObserver.h"

@implementation TKRGcovFluserTestObserver

//----------------------------------------------------------------------------//
#pragma mark - XCTestObserver
//----------------------------------------------------------------------------//
    
- (void)stopObserving
{
    [super stopObserving];
    [self.class gcovFlush];
}

//----------------------------------------------------------------------------//
#pragma mark - Private Methods
//----------------------------------------------------------------------------//

+ (void)gcovFlush
{
#if GCOV_FLUSH
    NSLog(@"###### FLUSH!!!!!!");
    extern void __gcov_flush(void);
    __gcov_flush();
#endif
}

@end
