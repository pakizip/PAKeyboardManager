//
//  PAKeyboardManager.h
//  Pixie Arena
//
//  Created by Paki Ambrosini on 21/01/15.
//  Copyright (c) 2015 Pasquale Ambrosini. All rights reserved.
//
#if TARGET_OS_IPHONE
#else
#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

@interface PAKeyboardManager : NSObject

@property (nonatomic, readonly) float xAxis;
@property (nonatomic, readonly) float yAxis;
@property (nonatomic) float pressure;

- (void)updateWithTimeInterval:(CFTimeInterval)timeInterval;
- (void)handleKeyDown:(NSEvent *)theEvent;
- (void)handleKeyUp:(NSEvent *)theEvent;

@end

#endif
