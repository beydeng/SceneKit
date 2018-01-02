//
//  SceneKitPlayVideoViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SceneKitPlayVideoViewController.h"
#import <SceneKit/SceneKit.h>
#import <SpriteKit/SpriteKit.h>

@interface SceneKitPlayVideoViewController ()

@end

@implementation SceneKitPlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *viewScn = [[SCNView alloc]initWithFrame:self.view.bounds];
    viewScn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:viewScn];
    
    SCNScene *scene = [SCNScene scene];
    viewScn.scene = scene;
    
    //创建一个相机
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.camera.automaticallyAdjustsZRange = YES;
    nodeCamera.position = SCNVector3Make(0, 10, 10);
    [scene.rootNode addChildNode:nodeCamera];
    
    //创建一个节点并绑定一个平面几何对象
    SCNNode *nodePlane = [SCNNode nodeWithGeometry:[SCNPlane planeWithWidth:16 height:9]];
    nodePlane.geometry.firstMaterial.doubleSided = YES;
    //决定平面是不是双面接收
    nodePlane.position = SCNVector3Make(0, 0, -30);
    [scene.rootNode addChildNode:nodePlane];
    
    //创建一个2D游戏场景和一个播放视频的对象
    SKVideoNode *videoNode = [SKVideoNode videoNodeWithFileNamed:@"123.mp4"];
    videoNode.size = CGSizeMake(1600, 900);
    videoNode.position = CGPointMake(videoNode.size.width/2, videoNode.size.height/2);
    videoNode.zRotation = M_PI ; //一定要将渲染的视频节点旋转180度，否则出来的画面会颠倒
    SKScene *sceneSk = [SKScene sceneWithSize:videoNode.size];
    [sceneSk addChild:videoNode];
    
    //给平面体设置渲染的内容
    nodePlane.geometry.firstMaterial.diffuse.contents = sceneSk;
    
    [videoNode play];
    
    viewScn.allowsCameraControl = YES;
    
    
    
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
