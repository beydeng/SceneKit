//
//  MainViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/16.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()<SCNPhysicsContactDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTheMainView];
    
    // Do any additional setup after loading the view.
}

-(void)setTheMainView
{
    
    SCNScene *scene = [SCNScene scene];
    
    //添加几何体
    SCNNode *node = [SCNNode node];
    SCNBox *box = [SCNBox boxWithWidth:2.0f height:2.0f length:2.0f chamferRadius:0.0f];
    node.geometry = box;
//    node.position = SCNVector3Make(<#float x#>, <#float y#>, <#float z#>)
    [scene.rootNode addChildNode:node];
    
    //添加材质
    /*
     diffuse（材料的基本颜色，纹理等）
     specular（材料的亮度以及该如何反射光）
     emissive（材料发光时的样子）
     normal（又称为法向，设置材料表面更多的细节）
     */
    
    SCNMaterial *mater = [SCNMaterial material];
    mater.name = @"墙";
    mater = box.firstMaterial;
    mater.lightingModelName = SCNLightingModelBlinn;
    mater.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_basecolor.png"];
    
    //添加重力
    
    //添加摄像机
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.position = SCNVector3Make(0, 0, 15);
    [scene.rootNode addChildNode:nodeCamera];
    
    //添加光照
    SCNNode *nodeLight = [SCNNode node];
    nodeLight.light = [SCNLight light];
    nodeLight.position = SCNVector3Make(0, 15, 15);
    nodeLight.light.type = SCNLightTypeAmbient;
    [scene.rootNode addChildNode:nodeLight];
    
    SCNView *mainView = [[SCNView alloc]initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor grayColor];
    mainView.scene = scene;
    mainView.allowsCameraControl = YES;
//    mainView.autoenablesDefaultLighting = YES;
    [self.view addSubview:mainView];
    
    SCNNode *nodeText = [SCNNode node];
    SCNText *text = [SCNText textWithString:@"SceneKit" extrusionDepth:0.2f]; //depth可以理解为字体的厚度
    text.font = [UIFont boldSystemFontOfSize:2];
    nodeText.geometry = text;
    nodeText.position = SCNVector3Make(3, 3, 0);
    text.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_ambientocclusion.png"];
    [scene.rootNode addChildNode:nodeText];
    
     //添加重力场
    
}

#pragma -mark SCNPhysicsContactDelegate

-(void)physicsWorld:(SCNPhysicsWorld *)world didBeginContact:(SCNPhysicsContact *)contact
{
    NSLog(@"123");
}

-(void)physicsWorld:(SCNPhysicsWorld *)world didUpdateContact:(SCNPhysicsContact *)contact
{
    NSLog(@"231");
}

-(void)physicsWorld:(SCNPhysicsWorld *)world didEndContact:(SCNPhysicsContact *)contact
{
    NSLog(@"132");
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
