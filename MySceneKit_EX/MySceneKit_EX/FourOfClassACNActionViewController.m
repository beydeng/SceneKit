//
//  FourOfClassACNActionViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/21.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "FourOfClassACNActionViewController.h"
#import <SceneKit/SceneKit.h>

@interface FourOfClassACNActionViewController ()

@end

@implementation FourOfClassACNActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个视图来存放3D场景
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    
    //创建一个空场景
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    //创建一个几何体
    SCNBox *box = [SCNBox boxWithWidth:2 height:2 length:2 chamferRadius:0];
    SCNNode *node = [SCNNode node];
    node.geometry = box;
    node.position = SCNVector3Make(0, 0, 0);
    box.firstMaterial.diffuse.contents = [UIColor redColor];
    [scene.rootNode addChildNode:node];
    
    SCNAction *rotation = [SCNAction rotateByAngle:10 aroundAxis:SCNVector3Make(0, 1, 0) duration:3];
    SCNAction *moveUp = [SCNAction moveTo:SCNVector3Make(0, 15, 0) duration:1.5];
    SCNAction *moveDown = [SCNAction moveTo:SCNVector3Make(0, -15, 0) duration:1.5];
    
    SCNAction *seuuence = [SCNAction sequence:@[moveUp,moveDown]];
    SCNAction *group = [SCNAction group:@[rotation,seuuence]];
    [node runAction:[SCNAction repeatActionForever:group]];
    
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
