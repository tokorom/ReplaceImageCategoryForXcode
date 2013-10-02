//
//  ReplaceImageCategoryForXcodeTests.m
//  ReplaceImageCategoryForXcodeTests
//
//  Created by yuta-tokoro on 9/30/13.
//  Copyright (c) 2013 soil. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ReplaceImageCategoryForXcodeTests : XCTestCase

@end

@implementation ReplaceImageCategoryForXcodeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUITextFieldBackgroundWithStretch
{
    UITextField* textField = [UITextField new];
    textField.background = [UIImage imageNamed:@"UISearchBarBorder"];
    UIImage* before = textField.background;
    XCTAssertNotNil(before, @"before is nil");

    [textField setReplaceByStretchImage:@"background"];
    UIImage* after = textField.background;
    XCTAssertNotEqualObjects(before, after, @"before and after is same");
}

- (void)testUITextFieldBackgroundWithTile
{
    UITextField* textField = [UITextField new];
    textField.background = [UIImage imageNamed:@"UISearchBarBorder"];
    UIImage* before = textField.background;
    XCTAssertNotNil(before, @"before is nil");

    [textField setReplaceByTileImage:@"background"];
    UIImage* after = textField.background;
    XCTAssertNotEqualObjects(before, after, @"before and after is same");
}

- (void)testUIButtonImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateDisabled];
    [button setImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateSelected];
    UIImage* beforeNormal = [button imageForState:UIControlStateNormal];
    UIImage* beforeHighlighted = [button imageForState:UIControlStateHighlighted];
    UIImage* beforeDisabled = [button imageForState:UIControlStateDisabled];
    UIImage* beforeSelected = [button imageForState:UIControlStateSelected];
    XCTAssertNotNil(beforeNormal, @"beforeNormal is nil");
    XCTAssertNotNil(beforeHighlighted, @"beforeHighlighted is nil");
    XCTAssertNotNil(beforeDisabled, @"beforeDisabled is nil");
    XCTAssertNotNil(beforeSelected, @"beforeSelected is nil");

    [button setReplaceByStretchImage:@"image"];
    UIImage* afterNormal = [button imageForState:UIControlStateNormal];
    UIImage* afterHighlighted = [button imageForState:UIControlStateHighlighted];
    UIImage* afterDisabled = [button imageForState:UIControlStateDisabled];
    UIImage* afterSelected = [button imageForState:UIControlStateSelected];
    XCTAssertNotEqualObjects(beforeNormal, afterNormal, @"beforeNormal and afterNormal is same");
    XCTAssertNotEqualObjects(beforeHighlighted, afterHighlighted, @"beforeHighlighted and afterHighlighted is same");
    XCTAssertNotEqualObjects(beforeDisabled, afterDisabled, @"beforeDisabled and afterDisabled is same");
    XCTAssertNotEqualObjects(beforeSelected, afterSelected, @"beforeSelected and afterSelected is same");
}

- (void)testUIButtonBackgroundImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateDisabled];
    [button setBackgroundImage:[UIImage imageNamed:@"UINavigationBarDefaultBack"] forState:UIControlStateSelected];
    UIImage* beforeNormal = [button backgroundImageForState:UIControlStateNormal];
    UIImage* beforeHighlighted = [button backgroundImageForState:UIControlStateHighlighted];
    UIImage* beforeDisabled = [button backgroundImageForState:UIControlStateDisabled];
    UIImage* beforeSelected = [button backgroundImageForState:UIControlStateSelected];
    XCTAssertNotNil(beforeNormal, @"beforeNormal is nil");
    XCTAssertNotNil(beforeHighlighted, @"beforeHighlighted is nil");
    XCTAssertNotNil(beforeDisabled, @"beforeDisabled is nil");
    XCTAssertNotNil(beforeSelected, @"beforeSelected is nil");

    [button setReplaceByStretchImage:@"backgroundImage"];
    UIImage* afterNormal = [button backgroundImageForState:UIControlStateNormal];
    UIImage* afterHighlighted = [button backgroundImageForState:UIControlStateHighlighted];
    UIImage* afterDisabled = [button backgroundImageForState:UIControlStateDisabled];
    UIImage* afterSelected = [button backgroundImageForState:UIControlStateSelected];
    XCTAssertNotEqualObjects(beforeNormal, afterNormal, @"beforeNormal and afterNormal is same");
    XCTAssertNotEqualObjects(beforeHighlighted, afterHighlighted, @"beforeHighlighted and afterHighlighted is same");
    XCTAssertNotEqualObjects(beforeDisabled, afterDisabled, @"beforeDisabled and afterDisabled is same");
    XCTAssertNotEqualObjects(beforeSelected, afterSelected, @"beforeSelected and afterSelected is same");
}

@end
