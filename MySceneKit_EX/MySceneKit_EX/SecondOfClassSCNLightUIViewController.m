//
//  SecondOfClassSCNLightUIViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/18.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SecondOfClassSCNLightUIViewController.h"
#import <SceneKit/SceneKit.h>
@interface SecondOfClassSCNLightUIViewController ()

@end

@implementation SecondOfClassSCNLightUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个放置场景的视图
    SCNView *gameView = [[SCNView alloc]initWithFrame:self.view.bounds];
    gameView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gameView];
    
    //方便观察 打开相机控制
    gameView.allowsCameraControl = YES;
    
    //创建一个场景
    gameView.scene = [SCNScene scene];
    
    //创建两个几何体节点
    
    SCNBox *box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    SCNPyramid *pyramid = [SCNPyramid pyramidWithWidth:0.5 height:0.5 length:0.5];
    
    SCNNode *nodeBox = [SCNNode node];
    nodeBox.geometry = box;
    nodeBox.position = SCNVector3Make(0, 0, 1);
    
    SCNNode *nodePyramid = [SCNNode node];
    nodePyramid.geometry = pyramid;
    nodePyramid.position = SCNVector3Make(0, 0, 3);
    
    [gameView.scene.rootNode addChildNode:nodePyramid];
    [gameView.scene.rootNode addChildNode:nodeBox];
    
//    现在添加一个自然光进去 有没有试过不添加灯光运行的结果呢？
//    SCNLight *light = [SCNLight light];
//    light.type = SCNLightTypeAmbient;
//    light.color = [UIColor redColor];
//    
//    //将光绑定到节点上
//    SCNNode *nodeLight = [SCNNode node];
//    nodeLight.light = light;
//    [gameView.scene.rootNode addChildNode:nodeLight];
    
    
    //现在添加一个点光源
//    SCNLight *lightOmni = [SCNLight light];
//    light.type = SCNLightTypeOmni;
//    light.color = [UIColor yellowColor];
//    
//    SCNNode *nodeOmni = [SCNNode node];
//    nodeOmni.light = lightOmni;
//    nodeOmni.position = SCNVector3Make(0, 0, 100);
//    [gameView.scene.rootNode addChildNode:nodeOmni];
    
    //然后我们来测试下平行光只有方向没有位置
//    SCNLight *lightDirect = [SCNLight light];
//    lightDirect.type = SCNLightTypeDirectional;
//    lightDirect.color = [UIColor redColor];
//    
//    SCNNode *nodeDirect = [SCNNode node];
//    nodeDirect.light = lightDirect;
//    nodeDirect.position = SCNVector3Make(0, 0, 100);
//    
//    [gameView.scene.rootNode addChildNode:nodeDirect];
//    
//    //然后我们更改下照射方向
//    //平行光的方向默认为z轴负方向
//    //将它设置为Y轴负方向
//    nodeDirect.rotation = SCNVector4Make(1, 0, 0, -M_PI/2.0);

    //聚焦光源
    
    SCNLight *lightSpot = [SCNLight light];
    lightSpot.type = SCNLightTypeSpot;
    lightSpot.color = [UIColor greenColor];
    lightSpot.castsShadow = YES; //捕捉阴影
    
    //设置它最远能照射的单位
    lightSpot.zFar = 7;
    
    SCNNode *nodeSpot = [SCNNode node];
    nodeSpot.light = lightSpot;
    nodeSpot.position = SCNVector3Make(0, 0, 10);
    
    [gameView.scene.rootNode addChildNode:nodeSpot];
    
    //调整光的发射角度
    lightSpot.spotOuterAngle = 5;
    
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
