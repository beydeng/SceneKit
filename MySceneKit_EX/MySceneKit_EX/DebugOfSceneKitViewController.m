//
//  DebugOfSceneKitViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "DebugOfSceneKitViewController.h"
#import <SceneKit/SceneKit.h>

@interface DebugOfSceneKitViewController ()

@end

@implementation DebugOfSceneKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    scnView.allowsCameraControl = YES;
    [self.view addSubview:scnView];
    scnView.showsStatistics = YES;
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    SCNNode *nodeShip = [[SCNScene sceneNamed:@"art.scnassets/ship.scn"].rootNode childNodeWithName:@"shipMesh" recursively:YES];
    nodeShip.position = SCNVector3Make(0, 0, 0);
    nodeShip.physicsBody = [SCNPhysicsBody dynamicBody];
    [scene.rootNode addChildNode:nodeShip];
    
    
    scene.physicsWorld.gravity = SCNVector3Make(0, 0, 0);
    
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
//    nodeCamera.camera.automaticallyAdjustsZRange = YES;
    nodeCamera.position = SCNVector3Make(0, 0, 10);
    [scene.rootNode addChildNode:nodeCamera];
    
    
    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.light.type = SCNLightTypeSpot;
    nodeLight.light.color = [UIColor greenColor];
    nodeLight.position = SCNVector3Make(0, 0, 10);
//    nodeLight.rotation = SCNVector3Make(<#float x#>, <#float y#>, <#float z#>)
    [scene.rootNode addChildNode:nodeLight];
    
    
    //查看节点的物理身体
    scnView.debugOptions = SCNDebugOptionShowPhysicsShapes;
    
    //显示场景中灯光影响的区域
    scnView.debugOptions = SCNDebugOptionShowLightExtents;
    //注意只有omni和spot类型有区域影响
    
    //查看光源的位置
    scnView.debugOptions = SCNDebugOptionShowLightInfluences;
    
    //查看网格
    scnView.debugOptions = SCNDebugOptionShowWireframe;
    
    //查看模型外围盒子外框
    scnView.debugOptions = SCNDebugOptionShowBoundingBoxes;

    //查看哪些区域受物理力的影响
    scnView.debugOptions = SCNDebugOptionShowPhysicsFields;
    
    //上面的可以进行组合
    
    scnView.debugOptions = SCNDebugOptionShowPhysicsFields|SCNDebugOptionShowBoundingBoxes|SCNDebugOptionShowLightInfluences|SCNDebugOptionShowWireframe|SCNDebugOptionShowLightExtents|SCNDebugOptionShowPhysicsShapes;
    
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
