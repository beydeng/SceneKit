//
//  FirstClassOfSCNNodeViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/18.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "FirstClassOfSCNNodeViewController.h"
#import <SceneKit/SceneKit.h>

@interface FirstClassOfSCNNodeViewController ()

@end

@implementation FirstClassOfSCNNodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //先创建一个容纳游戏场景的视图
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    //创建一个场景
    SCNScene *scene = [SCNScene scene]; //这里创建了一个空的场景
    
    //把这个空的场景放到游戏视图中去
    
    view.scene = scene;
    
    //在这个游戏场景中添加一个节点
    
    SCNNode *node = [SCNNode node];
    
    //因为场景作为一个游戏元素，也有一个节点，叫做根节点，我们把创建的节点放到这个根节点中去
    
    [scene.rootNode addChildNode:node];
    
    //但是这个时候，如果运行程序，没有任何东西，因为节点上没有绑定任何东西
    //那么我们给这个节点绑定一个几何体吧
    
    SCNSphere *sphere = [SCNSphere sphereWithRadius:1];
    node.geometry = sphere;
    
    //下面 我们在这个节点上添加一个节点
    
    SCNNode *childNode = [SCNNode node];
    childNode.position = SCNVector3Make(-0.5, 0, 1);
    SCNText *text = [SCNText textWithString:@"我是节点上的节点" extrusionDepth:1.0];
    //这里的extrusionDepth 字体深度，可以理解为这个字体的厚度
    text.firstMaterial.diffuse.contents = [UIColor redColor];
    //firstMaterial 第一个材质 diffuse自身的
    //这里可以理解为自身的第一个材质的内容是什么？
    text.font = [UIFont systemFontOfSize:9];
    childNode.geometry = text;
    [node addChildNode:childNode];
    view.allowsCameraControl = YES;
    //这里设置了用户可以自己控制相机
    view.autoenablesDefaultLighting = YES;
    //给环境添加了一个默认的关照
    
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
