//
//  ChangeCameraViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/23.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "ChangeCameraViewController.h"
#import <SceneKit/SceneKit.h>

@interface ChangeCameraViewController ()

@property (nonatomic,strong) SCNNode *thirdCamera,*firstCamera;
@property (nonatomic,strong) SCNView *scnView;

@end

@implementation ChangeCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建游戏场景
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor blackColor];
//    scnView.allowsCameraControl = YES;
    [self.view addSubview:scnView];
    
    //创建3个切换按钮
    
    NSArray *array = @[@"进入太阳系",@"进入地球系",@"离开太阳系进入宇宙"];
    
    for (int i=0; i<3; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10*(i+1)+30*i+64, 100, 30)];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:8];
        [button setBackgroundColor:[UIColor grayColor]];
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [scnView addSubview:button];
    }
    
    //创建游戏场景
    SCNScene *scene = [SCNScene scene];
    scnView.scene = scene;
    
    //创建一个太阳
    SCNNode *nodeSun = [SCNNode node];
    SCNSphere *sun = [SCNSphere sphereWithRadius:3];
    sun.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/ChangeCamera/sun.jpg"];
    nodeSun.geometry = sun;
    [scene.rootNode addChildNode:nodeSun];
    
    
    //下面创建地月系
    
    // 1 首先需要创建一个地月节点，将这个节点添加到太阳节点中去
    
    SCNNode *nodeEarthAndMoon = [SCNNode node];
    nodeEarthAndMoon.position = SCNVector3Make(10, 0, 0);
    [nodeSun addChildNode:nodeEarthAndMoon];
    
    //2 创建一个地球节点，将它添加到地月节点上去
    
    SCNSphere *earth = [SCNSphere sphereWithRadius:1];
    earth.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/ChangeCamera/earth.jpg"];
    SCNNode *nodeEarth = [SCNNode node];
    nodeEarth.geometry = earth;
    nodeEarth.position = SCNVector3Make(0, 0, 0);
    [nodeEarthAndMoon addChildNode:nodeEarth];
    
    //创建一个月球节点,将它添加到地球节点上去
    SCNSphere *moon = [SCNSphere sphereWithRadius:0.5];
    moon.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/ChangeCamera/moon.jpg"];
    SCNNode *nodeMoon = [SCNNode nodeWithGeometry:moon];
    nodeMoon.position = SCNVector3Make(2, 0, 0);
    [nodeEarth addChildNode:nodeMoon];
    
    //执行运动
    //太阳绕Y轴自转
    SCNAction *action = [SCNAction repeatActionForever:[SCNAction rotateByAngle:0.1 aroundAxis:SCNVector3Make(0, 1, 0) duration:0.3]];
    [nodeSun runAction:action];
    
    //地球绕Y轴自转
    SCNAction *action1 = [SCNAction repeatActionForever:[SCNAction rotateByAngle:0.1 aroundAxis:SCNVector3Make(0, 1, 0) duration:0.05]];
    [nodeEarth runAction:action1];

    //加入第三视角
    [scene.rootNode addChildNode:self.thirdCamera];
    
    //加入第一视角
    [nodeEarthAndMoon addChildNode:self.firstCamera];
    
    //绑定视角
    
    scnView.pointOfView = self.thirdCamera;
    
    self.scnView = scnView;
    
    // Do any additional setup after loading the view.
    
}

//创建场景范围内的第三视角

-(SCNNode *)thirdCamera
{
    
    if (!_thirdCamera) {
        
        _thirdCamera = [SCNNode node];
        _thirdCamera.camera = [SCNCamera camera];
        _thirdCamera.camera.automaticallyAdjustsZRange = YES;
        _thirdCamera.position = SCNVector3Make(0, 0, 30);
        
    }
    
    return _thirdCamera;
    
}

//创建地月系的第一视角
-(SCNNode *)firstCamera
{
    
    if (!_firstCamera) {
        
        _firstCamera = [SCNNode node];
        _firstCamera.camera = [SCNCamera camera];
        _firstCamera.position = SCNVector3Make(0, 0, 10);
        
    }
    
    return _firstCamera;
    
}

//给三个按钮相应的事件
-(void)btnAction:(UIButton *)sender
{
    NSString *string = sender.titleLabel.text;
    
    if ([string isEqualToString:@"进入太阳系"]) {
        
        self.scnView.pointOfView = self.thirdCamera;
        SCNAction *action = [SCNAction moveTo:SCNVector3Make(0, 0, 30) duration:1];
        [self.thirdCamera runAction:action];
        
    }
    else if ([string isEqualToString:@"进入地球系"])
    {
        self.scnView.pointOfView = self.firstCamera;
    }
    else
    {
        self.scnView.pointOfView = self.thirdCamera;
        SCNAction *action = [SCNAction moveTo:SCNVector3Make(0, 0, 400) duration:1];
        [self.thirdCamera runAction:action];
    }
    
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
