//
//  GameScene.m
//  PAKeyboardManager Demo
//
//  Created by Paki Ambrosini on 23/01/15.
//  Copyright (c) 2015 Pasquale Ambrosini. All rights reserved.
//
#import "MathUtils.h"
#import "PAKeyboardManager.h"
#import "GameScene.h"

@interface GameScene ()

@property (nonatomic, strong) PAKeyboardManager *keyboardManager;
@property (nonatomic, weak) SKLabelNode *player;
@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    _keyboardManager = [[PAKeyboardManager alloc] init];
    _keyboardManager.pressure = 0.04f;
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
    
    _player = myLabel;
    
}

-(void)update:(CFTimeInterval)currentTime {
    [_keyboardManager updateWithTimeInterval:currentTime];

    float multiplier = 30;
    CGVector force = CGVectorMake(multiplier * _keyboardManager.xAxis, multiplier * _keyboardManager.yAxis);
    
    self.player.position = [MathUtils pointLerpFrom:self.player.position force:force time:0.3f];
}

- (void)keyDown:(NSEvent *)theEvent
{
    [_keyboardManager handleKeyDown:theEvent];
}

- (void)keyUp:(NSEvent *)theEvent
{
    [_keyboardManager handleKeyUp:theEvent];
}

@end
