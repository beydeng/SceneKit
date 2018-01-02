//
//  SkyBoxViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SkyBoxViewController.h"
#import <SceneKit/SceneKit.h>

@interface SkyBoxViewController ()

@end

@implementation SkyBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    view.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    scene.background.contents = [UIImage imageNamed:@"skybox01_cube.png"]; //注意天空盒子的图片选择问题
    view.scene = scene;
    
    SCNNode *nodeBox = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0]];
    nodeBox.geometry.firstMaterial.diffuse.contents = [UIColor redColor];
    nodeBox.position = SCNVector3Make(0, 0, 0);
    [scene.rootNode addChildNode:nodeBox];
    
    SCNCamera *camer = [SCNCamera camera];
    camer.automaticallyAdjustsZRange = YES;
    SCNNode *nodeCamer = [SCNNode node];
    nodeCamer.camera = camer;
    nodeCamer.position = SCNVector3Make(0, 10, 10);
    [scene.rootNode addChildNode:nodeCamer];
        
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
