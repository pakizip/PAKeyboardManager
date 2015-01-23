//
//  MathUtils.m
//  PAKeyboardManager Demo
//
//  Created by Paki Ambrosini on 23/01/15.
//  Copyright (c) 2015 Pasquale Ambrosini. All rights reserved.
//

#import "MathUtils.h"

@implementation MathUtils

+ (float)lerpFrom:(float)value to:(float)valueTo time:(float)time
{
    return value + (valueTo - value) * time;
}

+ (CGPoint) pointLerpFrom:(CGPoint)position force:(CGVector) force time:(float) time
{
    return CGPointMake([MathUtils lerpFrom:position.x to:position.x + force.dx time:time], [self lerpFrom:position.y to:position.y + force.dy time:time]);
}

@end
