//
//  AManViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/9/4.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "AManViewController.h"
#import <SceneKit/SceneKit.h>

@interface AManViewController ()

@end

@implementation AManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTheMain];
    
}

-(void)setTheMain
{
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
//    scnView.allowsCameraControl = YES;
    scnView.debugOptions = SCNDebugOptionShowWireframe;
    
    SCNScene *scnen = [SCNScene scene];
    scnen.background.contents = [UIImage imageNamed:@"skybox01_cube.png"];
    scnView.scene = scnen;
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.position= SCNVector3Make(0, 50, 50);
    nodeCamera.rotation = SCNVector4Make(-1, 0, 0, M_PI_4);
    [scnen.rootNode addChildNode:nodeCamera];
    
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:[SCNFloor floor]];
    nodeFloor.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor.jpg"];
    [scnen.rootNode addChildNode:nodeFloor];
    nodeFloor.physicsBody = [SCNPhysicsBody staticBody];
    
    
     //创建身体
    SCNBox *boxBody = [SCNBox boxWithWidth:2 height:3 length:1 chamferRadius:0];
    boxBody.firstMaterial.diffuse.contents = [UIColor greenColor];
    SCNNode *nodeBody = [SCNNode nodeWithGeometry:boxBody];
    nodeBody.position = SCNVector3Make(0, 10, 0);
    nodeBody.pivot = SCNMatrix4MakeTranslation(0, 2, 0);
    [scnen.rootNode addChildNode:nodeBody];
    nodeBody.physicsBody = [SCNPhysicsBody dynamicBody];
    
    //创建一个头
    SCNBox *boxHead = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    boxHead.firstMaterial.diffuse.contents = [UIColor yellowColor];
    SCNNode *nodeHead = [SCNNode nodeWithGeometry:boxHead];
    nodeHead.position = SCNVector3Make(0, 4, 0);
    nodeHead.pivot = SCNMatrix4MakeTranslation(0, 4, 0);
    [nodeBody addChildNode:nodeHead];
    nodeHead.physicsBody = [SCNPhysicsBody dynamicBody];
    
//    [self createTheArm:nodeBody leftOrRight:1];
//    [self createTheArm:nodeBody leftOrRight:0];
//    [self createTheLeg:nodeBody leftOrRight:1];
    
}


-(void)createTheArm:(SCNNode *)nodeRoot leftOrRight:(int)i
{
    
    //创建胳膊
    SCNBox *boxUpperArm = [SCNBox boxWithWidth:0.6 height:1 length:0.6 chamferRadius:0];
    boxUpperArm.firstMaterial.diffuse.contents = [UIColor brownColor];
    SCNNode *nodeUpperArm = [SCNNode nodeWithGeometry:boxUpperArm];
    if (i) {
        nodeUpperArm.position = SCNVector3Make(-1.3, 0.5, 0);
    }
    else
    {
        nodeUpperArm.position = SCNVector3Make(1.3, 0.5, 0);
    }
    
    [nodeRoot addChildNode:nodeUpperArm];
    
    //创建手臂
    SCNBox *boxLowerArm = [SCNBox boxWithWidth:0.4 height:0.6 length:0.4 chamferRadius:0];
    boxLowerArm.firstMaterial.diffuse.contents = [UIColor yellowColor];
    SCNNode *nodeLowerArm = [SCNNode nodeWithGeometry:boxLowerArm];
    if (i) {
        nodeLowerArm.position = SCNVector3Make(-0.04, -0.8, 0);
    }
    else
    {
        nodeLowerArm.position = SCNVector3Make(0.04, -0.8, 0);
    }
    
    [nodeUpperArm addChildNode:nodeLowerArm];
    
    //创建手
    SCNBox *boxHand = [SCNBox boxWithWidth:0.2 height:0.2 length:0.2 chamferRadius:0];
    boxHand.firstMaterial.diffuse.contents = [UIColor blackColor];
    SCNNode *nodeHand = [SCNNode nodeWithGeometry:boxHand];
    nodeHand.position = SCNVector3Make(0, -0.4, 0);
    
    [nodeLowerArm addChildNode:nodeHand];
    
}


-(void)createTheLeg:(SCNNode *)nodeBody leftOrRight:(int)i
{
    
    SCNBox *boxUpperLeg = [SCNBox boxWithWidth:0.6 height:1 length:0.6 chamferRadius:0];
    boxUpperLeg.firstMaterial.diffuse.contents = [UIColor brownColor];
    SCNNode *nodeUpperLeg = [SCNNode nodeWithGeometry:boxUpperLeg];
    if (i) {
        
        nodeUpperLeg.position = SCNVector3Make(-0.6, -2, 0);
    }
    else
    {
        nodeUpperLeg.position = SCNVector3Make(0.6, -2, 0);
    }
    
    [nodeBody addChildNode:nodeUpperLeg];
    
    SCNBox *boxLowerLeg = [SCNBox boxWithWidth:0.4 height:0.6 length:0.4 chamferRadius:0];
    boxLowerLeg.firstMaterial.diffuse.contents = [UIColor yellowColor];
    SCNNode *nodeLowerLeg = [SCNNode nodeWithGeometry:boxLowerLeg];
    if (i) {
        nodeLowerLeg.position = SCNVector3Make(-0.04, -0.8, 0);
    }
    else
    {
        nodeLowerLeg.position = SCNVector3Make(0.04, -0.8, 0);
    }
    [nodeUpperLeg addChildNode:nodeLowerLeg];
    
    SCNBox *boxFoot = [SCNBox boxWithWidth:0.2 height:0.2 length:0.2 chamferRadius:0];
    boxFoot.firstMaterial.diffuse.contents = [UIColor blackColor];
    SCNNode *nodeFoot = [SCNNode nodeWithGeometry:boxFoot];
    nodeFoot.position = SCNVector3Make(0, -0.4, 0);
    
    [nodeLowerLeg addChildNode:nodeFoot];
    
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
