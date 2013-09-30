//
//  UIButton+ReplaceImage.m
//
//  Created by ToKoRo on 2013-09-30.
//

#import "UIButton+ReplaceImage.h"

@implementation UIButton (ReplaceImage)

- (id)image
{
    NSMutableArray* images = [NSMutableArray array];

    UIImage* image = nil;
    image = [self imageForState:UIControlStateNormal];
    if (image) {
        [images addObject:image];
    }
    image = [self imageForState:UIControlStateHighlighted];
    if (image) {
        [images addObject:image];
    }
    image = [self imageForState:UIControlStateDisabled];
    if (image) {
        [images addObject:image];
    }
    image = [self imageForState:UIControlStateSelected];
    if (image) {
        [images addObject:image];
    }

    return images;
}

- (void)setImage:(id)image
{
    if ([image isKindOfClass:[UIImage class]]) {
        [self setImage:image forState:UIControlStateNormal];
    } else if ([image isKindOfClass:[NSArray class]]) {
        NSArray* images = (NSArray*)image;
        if (0 < images.count) {
            [self setImage:images[0] forState:UIControlStateNormal];
        }
        if (1 < images.count) {
            [self setImage:images[1] forState:UIControlStateHighlighted];
        }
        if (2 < images.count) {
            [self setImage:images[2] forState:UIControlStateDisabled];
        }
        if (3 < images.count) {
            [self setImage:images[3] forState:UIControlStateSelected];
        }
    }
}


- (id)backgroundImage
{
    NSMutableArray* images = [NSMutableArray array];

    UIImage* image = nil;
    image = [self backgroundImageForState:UIControlStateNormal];
    if (image) {
        [images addObject:image];
    }
    image = [self backgroundImageForState:UIControlStateHighlighted];
    if (image) {
        [images addObject:image];
    }
    image = [self backgroundImageForState:UIControlStateDisabled];
    if (image) {
        [images addObject:image];
    }
    image = [self backgroundImageForState:UIControlStateSelected];
    if (image) {
        [images addObject:image];
    }

    return images;
}

- (void)setBackgroundImage:(id)image
{
    if ([image isKindOfClass:[UIImage class]]) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    } else if ([image isKindOfClass:[NSArray class]]) {
        NSArray* images = (NSArray*)image;
        if (0 < images.count) {
            [self setBackgroundImage:images[0] forState:UIControlStateNormal];
        }
        if (1 < images.count) {
            [self setBackgroundImage:images[1] forState:UIControlStateHighlighted];
        }
        if (2 < images.count) {
            [self setBackgroundImage:images[2] forState:UIControlStateDisabled];
        }
        if (3 < images.count) {
            [self setBackgroundImage:images[3] forState:UIControlStateSelected];
        }
    }
}

@end
