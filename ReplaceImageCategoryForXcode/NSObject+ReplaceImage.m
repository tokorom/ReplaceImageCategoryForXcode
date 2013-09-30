//
//  NSObject+ReplaceImage.m
//
//  Created by ToKoRo on 2013-09-15.
//

#import "NSObject+ReplaceImage.h"

@implementation NSObject (ReplaceImage)

//----------------------------------------------------------------------------//
#pragma mark - Public Interface
//----------------------------------------------------------------------------//
    
- (void)setReplaceByStretchImage:(NSString*)condition
{
    [self setReplaceImage:(NSString*)condition withResizingMode:UIImageResizingModeStretch];
}

- (void)setReplaceByTileImage:(NSString*)condition
{
    [self setReplaceImage:(NSString*)condition withResizingMode:UIImageResizingModeTile];
}

//----------------------------------------------------------------------------//
#pragma mark - Private Methods
//----------------------------------------------------------------------------//

- (void)setReplaceImage:(NSString*)condition withResizingMode:(UIImageResizingMode)resizingMode
{
    NSString* keyPath = [self.class keyPathFromCondition:condition];
    id originalImage = [self valueForKeyPath:keyPath];

    id result = nil;
    if ([originalImage isKindOfClass:[NSArray class]]) {
        NSMutableArray* replacedImages = [NSMutableArray array];
        for (UIImage* image in originalImage) {
            UIImage* replacedImage = [self replacedImageWithCondition:condition 
                                                    withOriginalImage:image
                                                     withResizingMode:resizingMode];
            [replacedImages addObject:replacedImage];
        }
        result = replacedImages;
    } else if ([originalImage isKindOfClass:[UIImage class]]) {
        result = [self replacedImageWithCondition:condition 
                                withOriginalImage:originalImage
                                 withResizingMode:resizingMode];
    }

    if (result) {
        [self setValue:result forKeyPath:keyPath];
    }
}

- (UIImage*)replacedImageWithCondition:(NSString*)condition 
                     withOriginalImage:(UIImage*)originalImage
                      withResizingMode:(UIImageResizingMode)resizingMode
{
    UIEdgeInsets edgeInsets = [self.class edgeInsetsFromCondition:condition withImage:originalImage];

    UIImage* stretchImage = nil;
    if ([originalImage respondsToSelector:@selector(resizableImageWithCapInsets:resizingMode:)]) {
        stretchImage = [originalImage resizableImageWithCapInsets:edgeInsets
                                                     resizingMode:resizingMode];
    }
    return stretchImage;
}

+ (NSString*)keyPathFromCondition:(NSString*)condition
{
    NSArray* components = [condition componentsSeparatedByString:@","];
    return 0 < components.count ? components[0] : nil;
}

+ (UIEdgeInsets)edgeInsetsFromCondition:(NSString*)condition withImage:(UIImage*)image
{
    NSArray* components = [condition componentsSeparatedByString:@","];
    CGFloat top, left, bottom, right;
    if (4 < components.count) {
        top = [components[1] doubleValue];
        left = [components[2] doubleValue];
        bottom = [components[3] doubleValue];
        right = [components[4] doubleValue];
    } else if (2 < components.count) {
        top = [components[1] doubleValue];
        left = [components[2] doubleValue];
        bottom = top;
        right = left;
    } else {
        top = image.size.height / 2;
        left = image.size.width / 2;;
        bottom = top;
        right = left;
    }
    return UIEdgeInsetsMake(top, left, bottom, right);
}

@end
