//
//  AnimationTransitionEffectViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/23.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "AnimationTransitionEffectViewController.h"
#import <SceneKit/SceneKit.h>

@interface AnimationTransitionEffectViewController ()

@end

@implementation AnimationTransitionEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    view.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    SCNCamera *camera = [SCNCamera camera];
    camera.automaticallyAdjustsZRange = YES;
    SCNNode *node = [SCNNode node];
    node.camera = camera;
    node.position = SCNVector3Make(0, 0, 10);
    [scene.rootNode addChildNode:node];
    
    //索引到模型中的几何体
    
    SCNScene *scene1 = [SCNScene sceneNamed:@"aaa.DAE" inDirectory:@"art.scnassets/AnimationTran" options:nil];
    SCNScene *scene2 = [SCNScene sceneNamed:@"aaa3.DAE" inDirectory:@"art.scnassets/AnimationTran" options:nil];
    
    SCNGeometry *geometry1 = [scene1.rootNode childNodeWithName:@"plane" recursively:YES].geometry;
    SCNGeometry *geometry2 = [scene2.rootNode childNodeWithName:@"pPlane1" recursively:YES].geometry;

//    geometry1.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/AnimationTran/mapImage.png"];
//    geometry2.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/AnimationTran/mapImage.png"];
    
    //把第一个几何体绑定到节点并显示到场景中
    
    SCNNode *node1 = [SCNNode nodeWithGeometry:geometry1];
    [scene.rootNode addChildNode:node1];
    
    //创建一个过渡期,添加我们要过渡的模型
    node1.morpher = [SCNMorpher new];
    node1.morpher.targets = @[geometry2];
    
    //设置一个过渡动画
    CABasicAnimation *baseAnimation = [CABasicAnimation animation];
    baseAnimation.keyPath = @"morpher.weight[0]";//代表过渡动画的第一个模型
    baseAnimation.fromValue = @0.0;
    baseAnimation.toValue = @1.0;
    baseAnimation.autoreverses = YES;
    baseAnimation.repeatCount = MAXFLOAT;
    baseAnimation.duration = 2.5;
    [node1 addAnimation:baseAnimation forKey:nil];
        
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
