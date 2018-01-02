//
//  PictureInPictureOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "PictureInPictureOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface PictureInPictureOfClassViewController ()

@end

@implementation PictureInPictureOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scnView];
    scnView.allowsCameraControl = YES;

    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:[SCNFloor floor]];
    nodeFloor.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor.jpg"];
    [scene.rootNode addChildNode:nodeFloor];
    
    
    SCNNode *nodePlane = [SCNNode nodeWithGeometry:[SCNPlane planeWithWidth:20 height:10]];
    nodePlane.geometry.firstMaterial.diffuse.contents = [UIColor blueColor];
    nodePlane.position = SCNVector3Make(0, 5, -10);
    [scene.rootNode addChildNode:nodePlane];
    

    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.light.type = SCNLightTypeAmbient;
    nodeLight.position = SCNVector3Make(0, 2, 2);
    nodeLight.light.color = [UIColor blueColor];
    nodeLight.light.zFar = 20;
    [scene.rootNode addChildNode:nodeLight];

    
    SCNView *scnView2 = [[SCNView alloc]initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    scnView2.backgroundColor = [UIColor grayColor];
    scnView2.allowsCameraControl = YES;
    SCNScene *scene2 = [SCNScene scene];
    scnView2.scene = scene2;
    SCNNode *nodeOfBox = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0]];
    nodeOfBox.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_height.png"];
    nodeOfBox.scale = SCNVector3Make(0.1, 0.1, 0.1);
    nodeOfBox.position = SCNVector3Make(0, 0.5, -10);
    [scene2.rootNode addChildNode:nodeOfBox];
    nodePlane.geometry.firstMaterial.diffuse.contents = scnView2;
    
    SCNAction *action = [SCNAction rotateToAxisAngle:SCNVector4Make(1, 0, 0, M_PI_4) duration:2];
    [nodeOfBox runAction:[SCNAction repeatActionForever:action]];
    
//    SCNNode *nodeCamera2 = [SCNNode node];
//    nodeCamera2.position = SCNVector3Make(0, 10, 0);
//    nodeCamera2.camera = [SCNCamera camera];
//    nodeCamera2.camera.automaticallyAdjustsZRange = YES;
//    [scene2.rootNode addChildNode:nodeCamera2];
//    scnView.pointOfView = nodeCamera2;
    
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
