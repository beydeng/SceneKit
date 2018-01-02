//
//  ThirdOfClassSCNCameraViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/18.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "ThirdOfClassSCNCameraViewController.h"
#import <SceneKit/SceneKit.h>

@interface ThirdOfClassSCNCameraViewController ()

@end

@implementation ThirdOfClassSCNCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个视图来放置3D场景
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scnView];
    
    //创建一个空白的场景
    SCNScene *scene = [SCNScene scene];
    
    //添加相机
    SCNCamera *camera = [SCNCamera camera];
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = camera;
    nodeCamera.position = SCNVector3Make(0, 0, 50);
    
    //把这个照相机添加到场景的根节点中
    [scene.rootNode addChildNode:nodeCamera];
    
    //接下来添加两个几何体
    
    SCNBox *box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    box.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_height.png"];
    SCNNode *nodBox1 = [SCNNode node];
    nodBox1.geometry = box;
    nodBox1.position = SCNVector3Make(0, 0, 3);
    [scene.rootNode addChildNode:nodBox1];
    
    SCNCone *cone = [SCNCone coneWithTopRadius:1.0f bottomRadius:2.0f height:1];
    cone.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_normal.png"];
    SCNNode *nodeCone = [SCNNode node];
    nodeCone.geometry = cone;
    nodeCone.position = SCNVector3Make(0, 0, 1);
    [scene.rootNode addChildNode:nodeCone];
    
    scnView.scene = scene;
    scnView.allowsCameraControl = YES;
    scnView.autoenablesDefaultLighting = YES;
    
    //下面让我们看看修改X和Y轴的视角
    //调节视角
    camera.xFov = 20;
    
    camera.yFov = 20;
    
    //设置焦距
    
    camera.focalDistance = 45;
    camera.focalBlurRadius = 1 ; //默认为0，你要有模糊度才能出现这种效果
    
    //设置最远能看见的距离
    
//    camera.zFar = 48;
    
    //设置正投影
    camera.usesOrthographicProjection = YES;
    
    //设置正投影比例
    camera.orthographicScale = 10;
    
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
