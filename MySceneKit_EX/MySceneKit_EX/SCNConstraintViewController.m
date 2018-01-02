//
//  SCNConstraintViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/23.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNConstraintViewController.h"
#import <SceneKit/SceneKit.h>

@interface SCNConstraintViewController ()
{
    SCNIKConstraint *ikContrait;
    SCNView *_scnView;
}
@end

@implementation SCNConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    
    scnView.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    scene.physicsWorld.gravity = SCNVector3Make(0, -100, 0);
    //我们修改物理场，让重力的值增加
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.position = SCNVector3Make(0, 0, 1000);
    nodeCamera.camera.automaticallyAdjustsZRange = YES;
    [scene.rootNode addChildNode:nodeCamera];
    
    _scnView = scnView;

    [self addArmToScene:scnView];
    
    // Do any additional setup after loading the view.
}

//添加机器手臂并设置约束
-(void)addArmToScene:(SCNView *)view
{
    //创建手掌
    SCNBox *hand = [SCNBox boxWithWidth:20 height:20 length:20 chamferRadius:0];
    hand.firstMaterial.diffuse.contents = [UIColor purpleColor];
    SCNNode *nodeHand = [SCNNode nodeWithGeometry:hand];
    nodeHand.position = SCNVector3Make(0, -50, 0);
    
    //创建小手臂
    SCNCylinder *lowerArm = [SCNCylinder cylinderWithRadius:1 height:100];
    lowerArm.firstMaterial.diffuse.contents = [UIColor redColor];
    SCNNode *nodeLowerArm = [SCNNode nodeWithGeometry:lowerArm];
    nodeLowerArm.position = SCNVector3Make(0, -50, 0);
    nodeLowerArm.pivot = SCNMatrix4MakeTranslation(0, 50, 0);//连接点
    [nodeLowerArm addChildNode:nodeHand];
    
    //创建上臂
    SCNNode *nodeUpperArm = [SCNNode node];
    nodeUpperArm.geometry = [SCNCylinder cylinderWithRadius:1 height:100];
    nodeUpperArm.geometry.firstMaterial.diffuse.contents = [UIColor greenColor];
    nodeUpperArm.pivot = SCNMatrix4MakeTranslation(0, 50, 0);
    [nodeUpperArm addChildNode:nodeLowerArm];
    
    //创建控制点
    SCNNode *nodeControl = [SCNNode node];
    nodeControl.geometry = [SCNSphere sphereWithRadius:10];
    nodeControl.geometry.firstMaterial.diffuse.contents = [UIColor blueColor];
    nodeControl.position = SCNVector3Make(0, 100, 0);
    [nodeControl addChildNode:nodeUpperArm];
    
    //添加到场景中去
    [view.scene.rootNode addChildNode:nodeControl];
    
    //创建约束
    
    ikContrait = [SCNIKConstraint inverseKinematicsConstraintWithChainRootNode:nodeControl];
    
    //给执行器添加约束
    
    nodeHand.constraints = @[ikContrait];
    
    [self addTap:_scnView];
    
}

//添加手势
-(void)addTap:(SCNView *)view
{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [view addGestureRecognizer:tap];
    
}

-(void)tap{
    
    [self createNodeToScene:_scnView.scene addConstraint:ikContrait];
    
}

-(void)createNodeToScene:(SCNScene *)scene addConstraint:(SCNIKConstraint *)ikConstrait
{
    SCNNode *node = [SCNNode node];
    node.geometry = [SCNSphere sphereWithRadius:10];
    node.geometry.firstMaterial.diffuse.contents = [UIColor colorWithRed:arc4random_uniform(255.0)/255 green:arc4random_uniform(255.0)/255 blue:arc4random_uniform(255.0)/255 alpha:1];
    node.position = SCNVector3Make(arc4random_uniform(100), arc4random_uniform(100), arc4random_uniform(100));
    [scene.rootNode addChildNode:node];
    
    node.physicsBody = [SCNPhysicsBody dynamicBody];
    
    //创建动画
    [SCNTransaction begin];
    [SCNTransaction setAnimationDuration:0.5];
    ikConstrait.targetPosition = node.position;
    [SCNTransaction commit];
    
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
