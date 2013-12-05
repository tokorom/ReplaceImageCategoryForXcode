//
//  TKRGcovFlusher.m
//
//  Created by ToKoRo on 2013-12-05.
//

#import <XCTest/XCTestObserver.h>
#import "TKRGcovFlusher.h"

@implementation TKRGcovFlusher

//----------------------------------------------------------------------------//
#pragma mark - Lifecycle
//----------------------------------------------------------------------------//

+ (void)load
{
    [self.class updateTestObserverClassName:@"TKRGcovFluserTestObserver"];
    //[self.class removeTestObserver];
}

//----------------------------------------------------------------------------//
#pragma mark - Private Methods
//----------------------------------------------------------------------------//

+ (void)updateTestObserverClassName:(NSString*)className
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* observerNames = @[@"XCTestLog", className];
    [defaults setObject:[observerNames componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    [defaults synchronize];
}

+ (void)removeTestObserver
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:XCTestObserverClassKey];
    [defaults synchronize];
}

@end
