//
//  MathUtils.h
//  PAKeyboardManager Demo
//
//  Created by Paki Ambrosini on 23/01/15.
//  Copyright (c) 2015 Pasquale Ambrosini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtils : NSObject

+ (float)lerpFrom:(float)value to:(float)valueTo time:(float)time;
+ (CGPoint)pointLerpFrom:(CGPoint)position force:(CGVector) force time:(float) time;
@end
