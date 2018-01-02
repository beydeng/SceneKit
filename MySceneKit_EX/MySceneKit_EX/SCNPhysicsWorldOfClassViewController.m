
//
//  SCNPhysicsWorldOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/21.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNPhysicsWorldOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface SCNPhysicsWorldOfClassViewController ()

@end

@implementation SCNPhysicsWorldOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个视图用来存放游戏场景
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:view];
    
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    //这里我们创建了一个空白的场景
    
    //我们打印一个东西，叫做gravity,也就是重力
    //它是SCNPhysicsWorld的一个属性
    
    NSLog(@"x==%lf y==%lf z==%lf",scene.physicsWorld.gravity.x,scene.physicsWorld.gravity.y,scene.physicsWorld.gravity.z);
    
    scene.physicsWorld.gravity = SCNVector3Make(0, 0, 0);
    
    NSLog(@"x==%lf y==%lf z==%lf",scene.physicsWorld.gravity.x,scene.physicsWorld.gravity.y,scene.physicsWorld.gravity.z);
    
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
