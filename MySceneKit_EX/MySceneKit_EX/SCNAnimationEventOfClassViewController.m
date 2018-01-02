//
//  SCNAnimationEventOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/24.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNAnimationEventOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface SCNAnimationEventOfClassViewController ()

@end

@implementation SCNAnimationEventOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    [scene.rootNode addChildNode:nodeCamera];
    
    //创建一个环境光
    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.light.type = SCNLightTypeAmbient;
    [scene.rootNode addChildNode:nodeLight];
    
    
    SCNText *text = [SCNText textWithString:@"SCNAnimationEvent" extrusionDepth:1];
    text.font = [UIFont systemFontOfSize:12];
    SCNNode *nodeText = [SCNNode nodeWithGeometry:text];
    nodeText.position = SCNVector3Make(-2, -0.5, -2);
    [scene.rootNode addChildNode:nodeText];
    
    //创建3个事件
    SCNAnimationEvent *event1 = [SCNAnimationEvent animationEventWithKeyTime:0 block:^(CAAnimation * _Nonnull animation, id  _Nonnull animatedObject, BOOL playingBackward) {
       
        SCNNode *node = (SCNNode *)animatedObject;
        node.geometry.firstMaterial.diffuse.contents = [UIColor redColor];
        
    }];
    
    SCNAnimationEvent *event2 = [SCNAnimationEvent animationEventWithKeyTime:0 block:^(CAAnimation * _Nonnull animation, id  _Nonnull animatedObject, BOOL playingBackward) {
        
        SCNNode *node = (SCNNode *)animatedObject;
        node.geometry.firstMaterial.diffuse.contents = [UIColor purpleColor];
        
    }];
    
    SCNAnimationEvent *event3 = [SCNAnimationEvent animationEventWithKeyTime:0 block:^(CAAnimation * _Nonnull animation, id  _Nonnull animatedObject, BOOL playingBackward) {
        
        SCNNode *node = (SCNNode *)animatedObject;
        node.geometry.firstMaterial.diffuse.contents = [UIColor greenColor];
        
    }];
    
    //创建一个动画，吧三个事件添加进去
    
    CABasicAnimation *base = [CABasicAnimation animationWithKeyPath:@"position.z"];
    base.duration = 5;
    base.fromValue = 0;
    base.toValue = @-20;
    base.additive = YES;
    base.autoreverses = YES;
    base.animationEvents = @[event1,event2,event3];
    base.repeatCount = MAXFLOAT;
    [nodeText addAnimation:base forKey:nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
