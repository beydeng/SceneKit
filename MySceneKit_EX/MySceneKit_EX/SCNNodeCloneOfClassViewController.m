//
//  SCNNodeCloneOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/25.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCNNodeCloneOfClassViewController.h"
#import <SceneKit/SceneKit.h>


@interface SCNNodeCloneOfClassViewController ()

@end

@implementation SCNNodeCloneOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scnView];
    scnView.allowsCameraControl = YES;
    
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    SCNNode *nodeBoss = [[SCNScene sceneNamed:@"boss.dae" inDirectory:@"art.scnassets/boss" options:nil].rootNode childNodeWithName:@"bossGroup" recursively:YES];
    nodeBoss.position = SCNVector3Make(0, 0, 0);
    nodeBoss.scale =SCNVector3Make(0.1, 0.1, 0.1);
    [scene.rootNode addChildNode:nodeBoss];
    
    //然后进行节点的克隆
    for (int i=0; i<20; i++) {
        SCNNode *node = [nodeBoss clone];
        node.position = SCNVector3Make(i*200, 0, 0);
        [scene.rootNode addChildNode:node];
    }
    
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
