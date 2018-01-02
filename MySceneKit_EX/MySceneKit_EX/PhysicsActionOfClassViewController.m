//
//  PhysicsActionOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/22.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "PhysicsActionOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface PhysicsActionOfClassViewController ()

@end

@implementation PhysicsActionOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    view.allowsCameraControl = YES;
    [self.view addSubview:view];
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    SCNCamera *camera = [SCNCamera camera];
    camera.automaticallyAdjustsZRange = YES;
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = camera;
    nodeCamera.position = SCNVector3Make(0, 0, 10);
    [scene.rootNode addChildNode:nodeCamera];
    
    
    //创建一个地板
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:[SCNFloor floor]];
    nodeFloor.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor.jpg"];
    nodeFloor.physicsBody = [SCNPhysicsBody staticBody];
    [scene.rootNode addChildNode:nodeFloor];
    
    
    //创建一个立方体
    
    SCNBox *box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    box.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/material/blocksrough_basecolor.png"];
    SCNNode *nodeBox = [SCNNode node];
    nodeBox.geometry = box;
    nodeBox.position = SCNVector3Make(0, 10, 0);
    nodeBox.physicsBody = [SCNPhysicsBody staticBody];
    [scene.rootNode addChildNode:nodeBox];
    
    //创建一个粒子
    SCNParticleSystem *particle = [SCNParticleSystem particleSystemNamed:@"fire.scnp" inDirectory:nil];
    SCNNode *nodeParticle = [SCNNode node];
    [nodeParticle addParticleSystem:particle];
    nodeParticle.position = SCNVector3Make(0.5, 0, 0);
    [nodeBox addChildNode:nodeParticle];
    
    //添加四个文字几何模型，并且设置他们的身体为动态模型
    
    SCNNode *node1 = [self String:@"我"];
    SCNNode *node2 = [self String:@"爱"];
    SCNNode *node3 = [self String:@"中"];
    SCNNode *node4 = [self String:@"国"];
    
    [scene.rootNode addChildNode:node1];
    [scene.rootNode addChildNode:node2];
    [scene.rootNode addChildNode:node3];
    [scene.rootNode addChildNode:node4];

    //创建物理行为
    //这个方法的意思是 bodyA bodyB 物理身体。axisA axisB沿着哪个轴转动，比如（1，0，0）沿着x轴转动；anchorA anchorB 描点。有些几何题的描点不再中心，比如字体的描点在左下角

    SCNPhysicsHingeJoint *joint0 = [SCNPhysicsHingeJoint jointWithBodyA:nodeBox.physicsBody axisA:SCNVector3Make(1, 0, 0) anchorA:SCNVector3Make(0, -0.5, 0) bodyB:node1.physicsBody axisB:SCNVector3Make(1, 0, 0) anchorB:SCNVector3Make(0.5, 1, 0)];
    SCNPhysicsHingeJoint *joint1 = [SCNPhysicsHingeJoint jointWithBodyA:node1.physicsBody axisA:SCNVector3Make(1, 0, 0) anchorA:SCNVector3Make(0, -0.5, 0) bodyB:node2.physicsBody axisB:SCNVector3Make(1, 0, 0) anchorB:SCNVector3Make(0, 0.5, 0)];
    SCNPhysicsHingeJoint *joint2 = [SCNPhysicsHingeJoint jointWithBodyA:node2.physicsBody axisA:SCNVector3Make(1, 0, 0) anchorA:SCNVector3Make(0, -0.5, 0) bodyB:node3.physicsBody axisB:SCNVector3Make(1, 0, 0) anchorB:SCNVector3Make(0, 0.5, 0)];
    SCNPhysicsHingeJoint *joint3 = [SCNPhysicsHingeJoint jointWithBodyA:node3.physicsBody axisA:SCNVector3Make(1, 0, 0) anchorA:SCNVector3Make(0, -0.5, 0) bodyB:node4.physicsBody axisB:SCNVector3Make(1, 0, 0) anchorB:SCNVector3Make(0, 0.5, 0)];
    //加入到物理世界中去
    
    [scene.physicsWorld addBehavior:joint0];
    [scene.physicsWorld addBehavior:joint1];
    [scene.physicsWorld addBehavior:joint2];
    [scene.physicsWorld addBehavior:joint3];
    
}

-(SCNNode *)String:(NSString *)string
{
    
    SCNText *text = [SCNText textWithString:string extrusionDepth:1];
    text.font = [UIFont systemFontOfSize:1];
    text.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/material/blocksrough_basecolor.png"];
    SCNNode *nodeText = [SCNNode node];
    nodeText.geometry = text;
    nodeText.physicsBody = [SCNPhysicsBody bodyWithType:SCNPhysicsBodyTypeDynamic shape:[SCNPhysicsShape shapeWithGeometry:text options:nil]];
    //添加一个粒子系统
    SCNParticleSystem *particle = [SCNParticleSystem particleSystemNamed:@"fire.scnp" inDirectory:nil];
    SCNNode *node = [SCNNode node];
    [node addParticleSystem:particle];
    node.position = SCNVector3Make(0.5, 0, 0);
    [nodeText addChildNode:node];
    
    return nodeText;
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
