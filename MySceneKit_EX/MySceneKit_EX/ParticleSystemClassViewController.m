//
//  ParticleSystemClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/22.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "ParticleSystemClassViewController.h"
#import <SceneKit/SceneKit.h>

@interface ParticleSystemClassViewController ()
{
    SCNView *_view;
}

@end

@implementation ParticleSystemClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    view.allowsCameraControl = YES;
    [self.view addSubview:view];
    */
    
    //选择渲染模式(OpenGL+Metal)
    //你应该这样初始化
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds options:@{SCNPreferLowPowerDeviceKey:@(true)}];
    view.backgroundColor = [UIColor lightGrayColor];
    view.allowsCameraControl = YES;
    [self.view addSubview:view];
    
    SCNScene *secne = [SCNScene scene];
    view.scene = secne;
    
    //创建一个相机
    
    SCNCamera *camera = [SCNCamera camera];
    camera.automaticallyAdjustsZRange = YES;
    
    SCNNode *nodeCamera = [SCNNode node];
    nodeCamera.camera = camera;
    nodeCamera.position = SCNVector3Make(0, 10, 10);
    [secne.rootNode addChildNode:nodeCamera];
    
    //添加一个四方体
    SCNBox *box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    box.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_basecolor.png"];
    SCNNode *nodeBox = [SCNNode nodeWithGeometry:box];
    nodeBox.position = SCNVector3Make(0, 10, 0);
    [secne.rootNode addChildNode:nodeBox];
    
    //现在需要把刚才创建的粒子添加到这个四方体上
    //1 创建一个粒子系统对象
    SCNParticleSystem *particle = [SCNParticleSystem particleSystemNamed:@"fire.scnp" inDirectory:nil];
    //创建一个节点添加粒子系统
    SCNNode *nodeParticle = [SCNNode node];
    [nodeParticle addParticleSystem:particle];
    nodeParticle.position = SCNVector3Make(0, -1, 0);
    //将粒子系统的节点添加到刚才创建的四方体上
    [nodeBox addChildNode:nodeParticle];
    
    view.showsStatistics = YES;
    
    view.preferredFramesPerSecond = 30;
    
    _view = view;
    
    if (view.eaglContext) {
        
        NSLog(@"OpenGL");
    }
    else
        NSLog(@"metal");
    
    view.antialiasingMode = SCNAntialiasingModeMultisampling4X;
    
    
    
    
    
}

-(void)snapShot
{
    [_view snapshot];
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
