//
//  SCNPhysicsFieldViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/23.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNPhysicsFieldViewController.h"
#import <SceneKit/SceneKit.h>

@interface SCNPhysicsFieldViewController ()

{
    SCNNode *node;
    SCNView *_viewScene;
    int i;
}

@end

@implementation SCNPhysicsFieldViewController

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    i=0;
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    _viewScene = view;
    
    view.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.position = SCNVector3Make(0, 30, 30);
    cameraNode.rotation = SCNVector4Make(1, 0, 0, -M_PI/4);
    cameraNode.camera.automaticallyAdjustsZRange = true;
    [scene.rootNode addChildNode:cameraNode];
    
    // 创建一个地板
    SCNNode *floorNode = [SCNNode node];
    floorNode.name = @"floor";
    floorNode.geometry = [SCNFloor floor];
    floorNode.geometry.firstMaterial.diffuse.contents = @"floor.jpg";
    floorNode.physicsBody = [SCNPhysicsBody staticBody];
//    floorNode.position = SCNVector3Make(0, 0, 0);
    [scene.rootNode addChildNode:floorNode];
    
//    [self addDragFie:scene];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10+64, 100, 30)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:8];
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
//    [self addbox:scene];
    
//    [self createSomeSpere:scene];
    
//    scene.physicsWorld.gravity = SCNVector3Make(0, 0, 0);
    
    [self createAScene];
    
    // Do any additional setup after loading the view.
}

-(void)addbox:(SCNScene *)scene
{
    
    SCNNode *nodeBox = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:4 height:4 length:4 chamferRadius:0]];
    nodeBox.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_basecolor.png"];
    nodeBox.position = SCNVector3Make(0, 12, 0);
    nodeBox.physicsBody = [SCNPhysicsBody dynamicBody];
    nodeBox.physicsBody.mass = 10;
    [scene.rootNode addChildNode:nodeBox];
    node = nodeBox;
    
}

-(void)btnAction:(UIButton *)sender
{
    
    //添加拖拽力
//    node.physicsBody.velocity = SCNVector3Make(0, 0, 14);
//    //要先给物体添加一个初始化速度
//    node.physicsField = [SCNPhysicsField dragField];
//    node.physicsField.strength = 30;
//    node.physicsField.direction = SCNVector3Make(0, 0, -4);
    
    
    //创建一个围绕轴旋转的力
    
//    SCNNode *nodeVortexField = [SCNNode node];
//    nodeVortexField.physicsField = [SCNPhysicsField vortexField];
//    nodeVortexField.physicsField.strength = 1;
//    nodeVortexField.physicsField.direction = SCNVector3Make(0,0, 1);
//    [_viewScene.scene.rootNode addChildNode:nodeVortexField];
    
    // 创建朝向一个点的力
    //还是使用上面创建的60个球体
    
//    SCNNode *nodeRadialGravityField = [SCNNode node];
//    nodeRadialGravityField.physicsField = [SCNPhysicsField radialGravityField];
//    nodeRadialGravityField.physicsField.strength = 1000;
//    nodeRadialGravityField.position = SCNVector3Make(0, 0, 0);
//    [_viewScene.scene.rootNode addChildNode:nodeRadialGravityField];
    
    
    //创建一个线性力
//    SCNNode *lineGravityNode = [SCNNode node];
//    lineGravityNode.physicsField = [SCNPhysicsField linearGravityField];
//    lineGravityNode.physicsField.strength = 1;
//    lineGravityNode.physicsField.direction = SCNVector3Make(-1, 0, 0);
//    [_viewScene.scene.rootNode addChildNode:lineGravityNode];
    
    //创建随机力
//    SCNNode *nodeNoiseField = [SCNNode node];
//    nodeNoiseField.physicsField = [SCNPhysicsField noiseFieldWithSmoothness:0 animationSpeed:4];
//    //noiseFieldWithSmoothness 噪点的平滑度 animationSpeed运动的速度
//    nodeNoiseField.physicsField.strength = 15;
//    [_viewScene.scene.rootNode addChildNode:nodeNoiseField];
    
    //一种和速度成正比的随机力
    
//    SCNNode *nodeTurbulenceField = [SCNNode node];
//    nodeTurbulenceField.physicsField = [SCNPhysicsField turbulenceFieldWithSmoothness:1 animationSpeed:1];
//    nodeTurbulenceField.physicsField.strength = 5;
//    [_viewScene.scene.rootNode addChildNode:nodeTurbulenceField];
    
    //弹力
//    SCNNode *nodeSpringField = [SCNNode node];
//    nodeSpringField.physicsField = [SCNPhysicsField springField];
//    nodeSpringField.physicsField.strength = 0.05;
//    nodeSpringField.position = SCNVector3Make(0, 30, 0);
//    [_viewScene.scene.rootNode addChildNode:nodeSpringField];
    
    //创建电场力
//    SCNNode *nodeElectricField = [SCNNode node];
//    nodeElectricField.physicsField = [SCNPhysicsField electricField];
//    nodeElectricField.physicsField.strength = 10;
//    [_viewScene.scene.rootNode addChildNode:nodeElectricField];
    
    //需要创建一个带电荷的节点对象
    //这个节点使用我们开始创建的立方体
//    node.physicsBody.velocity = SCNVector3Make(0, 0, 10);
//    node.physicsBody.charge = -10; //创建电荷的正负和大小
    
    //创建磁场
    SCNNode *nodeMagneticField = [SCNNode node];
    nodeMagneticField.physicsField = [SCNPhysicsField magneticField];
    nodeMagneticField.physicsField.strength = -0.5;
    [_viewScene.scene.rootNode addChildNode:nodeMagneticField];

    
}

//创建一个围绕轴旋转的力

-(void)createSomeSpere:(SCNScene *)scene
{
    
    NSInteger intCount = 60;
    while (intCount>0) {
        
        SCNNode *nodeSpere = [SCNNode nodeWithGeometry:[SCNSphere sphereWithRadius:1]];
        nodeSpere.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_normal.png"];
        nodeSpere.position = SCNVector3Make(0, arc4random_uniform(2), arc4random_uniform(2)-1);
        nodeSpere.physicsBody = [SCNPhysicsBody dynamicBody];
        [scene.rootNode addChildNode:nodeSpere];
        intCount--;
    }
}

//学习如何创建一个有电磁场

-(void)createAScene
{
    //创建一个圆筒，并给这个圆筒绑定粒子
    SCNTube *tube = [SCNTube tubeWithInnerRadius:1 outerRadius:1.2 height:4];
    tube.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_ambientocclusion.png"];
    SCNNode *nodeTube = [SCNNode nodeWithGeometry:tube];
    nodeTube.physicsBody = [SCNPhysicsBody kinematicBody];
    nodeTube.position = SCNVector3Make(-5, 2, 0);
    [_viewScene.scene.rootNode addChildNode:nodeTube];
    
    //装上粒子
    SCNParticleSystem *particle = [SCNParticleSystem particleSystemNamed:@"fire.scnp" inDirectory:nil];
    //设置和粒子碰撞的节点
    
    SCNNode *nodeFloor = [_viewScene.scene.rootNode childNodeWithName:@"floor" recursively:YES];
    particle.colliderNodes = @[nodeTube,nodeFloor];
    
    //让粒子可以受到力的作用
    particle.affectedByPhysicsFields = YES;
    //设置粒子的电荷
    particle.particleCharge = 10;
    particle.emitterShape = tube; //设置粒子的形状
    
    [nodeTube addParticleSystem:particle];
    
    //在创建一个圆筒，给圆筒加一个电场
    SCNTube *tube2 = [SCNTube tubeWithInnerRadius:4.5 outerRadius:5 height:2];
    tube2.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_normal.png"];
    SCNNode *nodeTube2  = [SCNNode nodeWithGeometry:tube2];
    nodeTube2.position = SCNVector3Make(6, 1, 0);
    [_viewScene.scene.rootNode addChildNode:nodeTube2];
    
    SCNNode *nodeDC = [SCNNode node];
    nodeDC.physicsField = [SCNPhysicsField electricField];
    nodeDC.physicsField.strength = -10;
    [nodeTube2 addChildNode:nodeDC];
    
    [self whichNodeITouch];
    
}

//如何看我们都点击了哪些节点
-(void)whichNodeITouch
{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    [_viewScene addGestureRecognizer:tap];
    
}

-(void)tap:(UITapGestureRecognizer *)tap
{
    
    NSArray<SCNHitTestResult *> *result = [_viewScene hitTest:[tap locationOfTouch:0 inView:_viewScene] options:nil];
    
    for (SCNHitTestResult *result1 in result) {
        
        NSLog(@"我摸了哪一个node==%@",result1.node);
        
    }
    
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
