//
//  CollisionDetectionOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "CollisionDetectionOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface CollisionDetectionOfClassViewController ()<SCNPhysicsContactDelegate>

@end

@implementation CollisionDetectionOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SCNView *scnView =[[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    [self pengzhuang:scene];
    
    scene.physicsWorld.contactDelegate = self;
    
    // Do any additional setup after loading the view.
}

//碰撞
-(void)pengzhuang:(SCNScene *)scene
{
    
    //创建一个地板
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:[SCNFloor floor]];
    nodeFloor.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor.jpg"];
    [scene.rootNode addChildNode:nodeFloor];
    
    //创建一个正方形B
    SCNNode *nodeBox = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:2 height:4 length:2 chamferRadius:0]];
    nodeBox.geometry.firstMaterial.diffuse.contents = [UIColor redColor];
    nodeBox.physicsBody = [SCNPhysicsBody staticBody];
    nodeBox.physicsBody.categoryBitMask = 1;
    nodeBox.position = SCNVector3Make(0, 2, 0);
    [scene.rootNode addChildNode:nodeBox];
    
    //设置碰撞掩码和接触掩码
    nodeBox.physicsBody.contactTestBitMask = 0b011;
    nodeBox.physicsBody.collisionBitMask = 0b010;
    
    //创建一个球体
    SCNNode *nodeQiu = [SCNNode nodeWithGeometry:[SCNSphere sphereWithRadius:1]];
    nodeQiu.geometry.firstMaterial.diffuse.contents = [UIColor yellowColor];
    nodeQiu.position = SCNVector3Make(0, 10, 0);
    nodeQiu.physicsBody = [SCNPhysicsBody dynamicBody];
    nodeQiu.physicsBody.categoryBitMask = 1;
    [scene.rootNode addChildNode:nodeQiu];
    
}

- (void)physicsWorld:(SCNPhysicsWorld *)world didBeginContact:(SCNPhysicsContact *)contact
{
    NSLog(@"Begin%@",contact);
}
- (void)physicsWorld:(SCNPhysicsWorld *)world didUpdateContact:(SCNPhysicsContact *)contact
{
    NSLog(@"Update%@",contact);
}
- (void)physicsWorld:(SCNPhysicsWorld *)world didEndContact:(SCNPhysicsContact *)contact
{
    NSLog(@"EndContact%@",contact);
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
