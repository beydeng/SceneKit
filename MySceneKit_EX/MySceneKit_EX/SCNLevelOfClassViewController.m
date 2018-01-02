//
//  SCNLevelOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/28.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNLevelOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface SCNLevelOfClassViewController ()

@end

@implementation SCNLevelOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scnView];
    scnView.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = [SCNCamera camera];
    nodeCamera.camera.automaticallyAdjustsZRange = YES;
    nodeCamera.position = SCNVector3Make(0, 0, 0);
    [scene.rootNode addChildNode:nodeCamera];
    
    
    
    //创建3个有不同棱角的几何
    
    SCNBox *box1 = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0];
    box1.firstMaterial.diffuse.contents = [UIColor redColor];
    
    SCNBox *box2 = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0];
    box2.firstMaterial.diffuse.contents = [UIColor greenColor];
    
    SCNBox *box3 = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0];
    box3.firstMaterial.diffuse.contents = [UIColor blueColor];
    
    
    SCNLevelOfDetail *levelD1 = [SCNLevelOfDetail levelOfDetailWithGeometry:box2 screenSpaceRadius:100];
    SCNLevelOfDetail *levelD2 = [SCNLevelOfDetail levelOfDetailWithGeometry:box3 screenSpaceRadius:50];
    
    
    SCNNode *nodeBox = [SCNNode nodeWithGeometry:box1];
    nodeBox.geometry.levelsOfDetail = @[levelD1,levelD2];
    nodeBox.position = SCNVector3Make(0, 0, -200);
    
    [scene.rootNode addChildNode:nodeBox];
    
    
    
    
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
