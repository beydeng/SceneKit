//
//  ShadowUserOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/24.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "ShadowUserOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface ShadowUserOfClassViewController ()
{
    SCNView *_view;
}
@end

@implementation ShadowUserOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    view.allowsCameraControl = YES;
    [self.view addSubview:view];
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    _view = view;
    
    //创建一个地板
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:[SCNFloor floor]];
    nodeFloor.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor.jpg"];
    [scene.rootNode addChildNode:nodeFloor];
    
    //创建一个相机
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
//    nodeCamera.camera.automaticallyAdjustsZRange = YES;
    nodeCamera.position = SCNVector3Make(0, 20, 10);
    nodeCamera.rotation = SCNVector4Make(0, -1, 0, -M_PI/2);
    [scene.rootNode addChildNode:nodeCamera];
    
    [self createALight];
    
    // Do any additional setup after loading the view.
}


-(void)createALight
{
    
    //创建一个灯罩
    SCNCone *cone = [SCNCone coneWithTopRadius:1 bottomRadius:25 height:50];
    cone.radialSegmentCount = 10;
    cone.heightSegmentCount = 5;
    cone.firstMaterial.diffuse.contents = [UIColor yellowColor];
    //创建一个灯节点
    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.light.type = SCNLightTypeSpot;
    nodeLight.geometry = cone;
    nodeLight.light.castsShadow = YES;
    nodeLight.light.shadowMode = SCNShadowModeForward;
    nodeLight.light.spotOuterAngle = 60;
    nodeLight.light.zFar = 2000;
    nodeLight.position = SCNVector3Make(0, 10, 0);
    
    //创建一个放灯源的支架
    
    SCNNode *nodeZj = [SCNNode node];
    nodeZj.position = SCNVector3Make(0, 100, 40);
    [nodeZj addChildNode:nodeLight];
    
    [_view.scene.rootNode addChildNode:nodeZj];
    
    //给灯光添加一个移动行为
    
    SCNAction *actionRight = [SCNAction moveTo:SCNVector3Make(100, 1000, 40) duration:2];
    SCNAction *actionLeft = [SCNAction moveTo:SCNVector3Make(-100, 1000, 40) duration:2];
    SCNAction *action = [SCNAction sequence:@[actionRight,actionLeft]];
    
    [nodeZj runAction:[SCNAction repeatActionForever:action]];
    
    //添加一个模型到场景中
    
    SCNNode *nodeShip = [[SCNScene sceneNamed:@"art.scnassets/ship.scn"].rootNode childNodeWithName:@"shipMesh" recursively:YES];
    nodeShip.position = SCNVector3Make(0, 0, 0);
    NSLog(@"nodeShip==--==%@",nodeShip);
    [_view.scene.rootNode addChildNode:nodeShip];
    
    //我们想让灯光在移动的过程中始终对着我们的模型
    //添加一个约束
    SCNLookAtConstraint *constraint = [SCNLookAtConstraint lookAtConstraintWithTarget:nodeShip];
    
    nodeLight.constraints = @[constraint];
    
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
