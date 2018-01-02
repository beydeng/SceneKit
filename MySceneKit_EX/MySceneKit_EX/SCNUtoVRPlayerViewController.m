//
//  SCNUtoVRPlayerViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNUtoVRPlayerViewController.h"
#import <SceneKit/SceneKit.h>
#import <SpriteKit/SpriteKit.h>

@interface SCNUtoVRPlayerViewController ()

@end

@implementation SCNUtoVRPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    SCNView *scnView = [[SCNView alloc]initWithFrame:self.viewIfLoaded.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.camera.automaticallyAdjustsZRange = YES;
    nodeCamera.position = SCNVector3Make(0, 0, 0);
    [scene.rootNode addChildNode:nodeCamera];
    
    //创建一个球体
    SCNNode *nodeQiu = [SCNNode nodeWithGeometry:[SCNSphere sphereWithRadius:100]];
    nodeQiu.geometry.firstMaterial.doubleSided = NO;
    //关闭双面渲染，提高性能
    nodeQiu.position = SCNVector3Make(0, 0, 0);
    [scene.rootNode addChildNode:nodeQiu];
    
    //全景照相机应该放在球体中间，并且应该渲染内表面，但是默认渲染的是外表面，所以我们设置一下
    nodeQiu.geometry.firstMaterial.cullMode = SCNCullFront;
//    nodeQiu.geometry.firstMaterial.diffuse.contents = [UIColor yellowColor];
    
    //创建2D场景
    SKVideoNode *videoNode = [SKVideoNode videoNodeWithFileNamed:@"fly.mp4"];
    videoNode.size = CGSizeMake(1600, 900);
    videoNode.position = CGPointMake(videoNode.size.width/2, videoNode.size.height/2);
    videoNode.zRotation = M_PI;
    
    SKScene *scene2D= [SKScene sceneWithSize:videoNode.size];
    [scene2D addChild:videoNode];
    
    nodeQiu.geometry.firstMaterial.diffuse.contents = scene2D;
    
    [videoNode play];
    
    scnView.allowsCameraControl = YES;
    
    
    
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
