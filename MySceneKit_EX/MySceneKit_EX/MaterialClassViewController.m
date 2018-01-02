//
//  MaterialClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/21.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "MaterialClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface MaterialClassViewController ()

@end

@implementation MaterialClassViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor lightGrayColor];
    SCNScene *sene = [SCNScene scene];
    scnView.scene = sene;
    [self.view addSubview:scnView];
    scnView.allowsCameraControl = YES;
    
    SCNSphere *earth = [SCNSphere sphereWithRadius:2];
    SCNNode *node = [SCNNode nodeWithGeometry:earth];
    [sene.rootNode addChildNode:node];
    
    //添加环境光
    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.light.type = SCNLightTypeAmbient;
    [sene.rootNode addChildNode:nodeLight];
    
    //给这个球体来一个材质图片
    //设置漫发射属性
    earth.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_basecolor.png"];
    
//    earth.firstMaterial.locksAmbientWithDiffuse = YES; //锁定材质
//    earth.firstMaterial.ambient.contents = [UIColor redColor];
    
    earth.firstMaterial.specular.contents =[UIImage imageNamed:@"art.scnassets/Material/blocksrough_height.png"];
    
    
    node.physicsBody = [SCNPhysicsBody staticBody];//静态身体
    node.physicsBody = [SCNPhysicsBody dynamicBody];//动态身体
    node.physicsBody = [SCNPhysicsBody kinematicBody];//运动身体
    
    //物理身体是有形状的，如果不指定，那么就是几何模型自身的形状，那我们怎么自定义了？
//    SCNPhysicsBody *body = [SCNPhysicsBody bodyWithType:<#(SCNPhysicsBodyType)#> shape:<#(nullable SCNPhysicsShape *)#>]
    
    
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
