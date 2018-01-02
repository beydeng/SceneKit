//
//  TheShapesOfPhysicsViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/28.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "TheShapesOfPhysicsViewController.h"
#import <SceneKit/SceneKit.h>

@interface TheShapesOfPhysicsViewController ()

@end

@implementation TheShapesOfPhysicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    scnView.allowsCameraControl = YES;
    
    //打开显示物理身体的debug调试模式
    scnView.debugOptions = SCNDebugOptionShowPhysicsShapes;
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:[SCNFloor floor]];
    nodeFloor.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor.jpg"];
    nodeFloor.physicsBody = [SCNPhysicsBody staticBody];
    [scene.rootNode addChildNode:nodeFloor];
    
    //创建球体，改变物理身体
    SCNSphere *sphere = [SCNSphere sphereWithRadius:2];
    sphere.firstMaterial.diffuse.contents = [UIColor blueColor];
    SCNNode *nodeSphere = [SCNNode nodeWithGeometry:sphere];
    
    //改变物理身体形状
    SCNPhysicsShape *shape = [SCNPhysicsShape shapeWithGeometry:nodeSphere.geometry options:@{SCNPhysicsShapeTypeKey:SCNPhysicsShapeTypeConvexHull}];
    
    nodeSphere.physicsBody = [SCNPhysicsBody bodyWithType:SCNPhysicsBodyTypeDynamic shape:shape];
    nodeSphere.position = SCNVector3Make(0, 10, 0);
    [scene.rootNode addChildNode:nodeSphere];
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.position = SCNVector3Make(0, 0, 30);
    [scene.rootNode addChildNode:nodeCamera];
    
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
