//
//  TheGameView.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/17.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "TheGameView.h"
@import SpriteKit;

@interface TheGameView ()
{
    UITouch *_padTouch;
}

@end


@implementation TheGameView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.allowsCameraControl = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.autoenablesDefaultLighting = YES;
        
        [self set2D];
    }
    
    return self;
    
}

-(void)set2D
{
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    SKScene *skScene = [SKScene sceneWithSize:CGSizeMake(w, h)];
    skScene.scaleMode = SKSceneScaleModeResizeFill;
    
    CGRect virtualDPadBounds = self.virtualDPadBoundsInScene;
    SKSpriteNode *dpadSprite = [SKSpriteNode spriteNodeWithImageNamed:@"art.scnassets/dpad.png"];
    dpadSprite.anchorPoint = CGPointMake(0.0, 0.0);
    dpadSprite.position = virtualDPadBounds.origin;
    dpadSprite.size = virtualDPadBounds.size;
    [skScene addChild:dpadSprite];
    
    skScene.userInteractionEnabled = YES;
    
    self.overlaySKScene = skScene;
    
}

- (CGRect)virtualDPadBoundsInScene {
    return CGRectMake(10.0, 10.0, 150.0, 150.0);
}

- (CGRect)virtualDPadBounds {
    CGRect virtualDPadBounds = [self virtualDPadBoundsInScene];
    virtualDPadBounds.origin.y = self.bounds.size.height - virtualDPadBounds.size.height + virtualDPadBounds.origin.y;
    return virtualDPadBounds;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch *touch in touches) {
        
        if (CGRectContainsPoint([self virtualDPadBounds], [touch locationInView:self])) {
            
            NSLog(@"131231");
            if (_padTouch==nil) {
                
                _padTouch = touch;
                
            }
            if (_padTouch) {
                
                break;
            }
            
        }
        
    }
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CGPoint p0 = [_padTouch previousLocationInView:self];
    CGPoint p1 = [_padTouch locationInView:self];
//    vector_float2 displacement = {p1.x - p0.x, p1.y - p0.y};
//    
//    NSLog(@"%@",displacement);
    
    NSLog(@"displacement==-==%lf %lf",p1.x - p0.x,p1.y - p0.y);
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self commonTouchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self commonTouchesEnded:touches withEvent:event];
}

- (void)commonTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_padTouch) {
        if ([touches containsObject:_padTouch] || [[event touchesForView:self] containsObject:_padTouch] == NO) {
            _padTouch = nil;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
