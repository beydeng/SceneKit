//
//  GLSLUseingOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/28.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "GLSLUseingOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface GLSLUseingOfClassViewController ()

@end

@implementation GLSLUseingOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    scnView.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    //添加灯光
    
    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.light.color = [UIColor redColor];
    nodeLight.position = SCNVector3Make(0, 0, 2000);
    nodeLight.light.type = SCNLightTypeSpot;
    [scene.rootNode addChildNode:nodeLight];
    
    //加载模型
    SCNNode *nodeMap = [[SCNScene sceneNamed:@"foldingMap.dae" inDirectory:@"art.scnassets/map" options:nil].rootNode childNodeWithName:@"Map" recursively:YES];
    nodeMap.position = SCNVector3Make(0, 0, 0);
//    nodeMap.rotation = SCNVector4Make(1, 0, 0, -M_PI);
    [scene.rootNode addChildNode:nodeMap];
    
    //先写一个顶点着色器
    NSString* shaderPath = [NSString stringWithFormat:@"%@/art.scnassets/map/mapGeometry.shader",[[NSBundle mainBundle]resourcePath]];
    NSError* error;
    NSString* shaderString = [NSString stringWithContentsOfFile:shaderPath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        
        NSLog(@"error%@",error);
        
    }
    
    NSString* shaderLight = [NSString stringWithFormat:@"%@/art.scnassets/map/mapLighting.shader",[[NSBundle mainBundle]resourcePath]];
    NSString* shaderStringLight = [NSString stringWithContentsOfFile:shaderLight encoding:NSUTF8StringEncoding error:&error];
    
    nodeMap.geometry.shaderModifiers = @{SCNShaderModifierEntryPointGeometry:shaderString,SCNShaderModifierEntryPointLightingModel:shaderStringLight};
    
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
