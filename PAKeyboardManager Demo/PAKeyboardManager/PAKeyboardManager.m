//
//  PAKeyboardManager.m
//  Pixie Arena
//
//  Created by Paki Ambrosini on 21/01/15.
//  Copyright (c) 2015 Pasquale Ambrosini. All rights reserved.
//
#import <AppKit/AppKit.h>
#import "PAKeyboardManager.h"
#import "MathUtils.h"

typedef enum {
    PAKeyboardManagerXAxisStateNil = 0,
    PAKeyboardManagerXAxisStateRight,
    PAKeyboardManagerXAxisStateLeft
}PAKeyboardManagerXAxisState;

typedef enum {
    PAKeyboardManagerYAxisStateNil = 0,
    PAKeyboardManagerYAxisStateUp,
    PAKeyboardManagerYAxisStateDown
}PAKeyboardManagerYAxisState;

@interface PAKeyboardManager ()

@property (nonatomic) BOOL upPressed;
@property (nonatomic) BOOL downPressed;
@property (nonatomic) BOOL rightPressed;
@property (nonatomic) BOOL leftPressed;

@property (nonatomic) PAKeyboardManagerXAxisState xState;
@property (nonatomic) PAKeyboardManagerYAxisState yState;

@end

@implementation PAKeyboardManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pressure = 0.05f;
    }
    return self;
}

- (void)updateWithTimeInterval:(CFTimeInterval)timeInterval
{
    switch (_yState) {
        case PAKeyboardManagerYAxisStateNil:
            _yAxis = [MathUtils lerpFrom:_yAxis to:0.0f time:_pressure];
            break;
        case PAKeyboardManagerYAxisStateUp:
            _yAxis = [MathUtils lerpFrom:_yAxis to:1.0f time:_pressure];
            break;
        case PAKeyboardManagerYAxisStateDown:
            _yAxis = [MathUtils lerpFrom:_yAxis to:-1.0f time:_pressure];
            break;
        default:
            break;
    }
    
    switch (_xState) {
        case PAKeyboardManagerXAxisStateNil:
            _xAxis = [MathUtils lerpFrom:_xAxis to:0.0f time:_pressure];
            break;
        case PAKeyboardManagerXAxisStateRight:
            _xAxis = [MathUtils lerpFrom:_xAxis to:1.0f time:_pressure];
            break;
        case PAKeyboardManagerXAxisStateLeft:
            _xAxis = [MathUtils lerpFrom:_xAxis to:-1.0f time:_pressure];
            break;
        default:
            break;
    }
}

- (void)handleKeyDown:(NSEvent *)theEvent
{
    [self handleKeyEvent:theEvent keyDown:YES];
}

- (void)handleKeyUp:(NSEvent *)theEvent
{
    [self handleKeyEvent:theEvent keyDown:NO];
}

- (void)handleKeyEvent:(NSEvent *)event keyDown:(BOOL)downOrUp {
    
    if ([event modifierFlags] & NSNumericPadKeyMask) {
        NSString *theArrow = [event charactersIgnoringModifiers];
        unichar keyChar = 0;
        if ([theArrow length] == 1) {
            keyChar = [theArrow characterAtIndex:0];
            switch (keyChar) {
                case NSUpArrowFunctionKey:
                    if (downOrUp) {
                        _upPressed = YES;
                        if (_yState == PAKeyboardManagerYAxisStateNil) {
                            _yState = PAKeyboardManagerYAxisStateUp;
                        }
                    }else{
                        _upPressed = NO;
                        if (_yState == PAKeyboardManagerYAxisStateUp) {
                            if (_downPressed) {
                                _yState = PAKeyboardManagerYAxisStateDown;
                            }else{
                                _yState = PAKeyboardManagerYAxisStateNil;
                            }
                        }
                    }
                    break;
                case NSDownArrowFunctionKey:
                    if (downOrUp) {
                        _downPressed = YES;
                        if (_yState == PAKeyboardManagerYAxisStateNil) {
                            _yState = PAKeyboardManagerYAxisStateDown;
                        }
                    }else{
                        _downPressed = NO;
                        if (_yState == PAKeyboardManagerYAxisStateDown) {
                            if (_upPressed) {
                                _yState = PAKeyboardManagerYAxisStateUp;
                            }else{
                                _yState = PAKeyboardManagerYAxisStateNil;
                            }
                        }
                    }
                    break;
                case NSLeftArrowFunctionKey:
                    if (downOrUp) {
                        _leftPressed = YES;
                        if (_xState == PAKeyboardManagerXAxisStateNil) {
                            _xState = PAKeyboardManagerXAxisStateLeft;
                        }
                    }else{
                        _leftPressed = NO;
                        if (_xState == PAKeyboardManagerXAxisStateLeft) {
                            if (_rightPressed) {
                                _xState = PAKeyboardManagerXAxisStateRight;
                            }else{
                                _xState = PAKeyboardManagerXAxisStateNil;
                            }
                        }
                    }
                    break;
                case NSRightArrowFunctionKey:
                    if (downOrUp) {
                        _rightPressed = YES;
                        if (_xState == PAKeyboardManagerXAxisStateNil) {
                            _xState = PAKeyboardManagerXAxisStateRight;
                        }
                    }else{
                        _rightPressed = NO;
                        if (_xState == PAKeyboardManagerXAxisStateRight) {
                            if (_leftPressed) {
                                _xState = PAKeyboardManagerXAxisStateLeft;
                            }else{
                                _xState = PAKeyboardManagerXAxisStateNil;
                            }
                        }
                    }
                    break;
            }
        }
    }
}


@end