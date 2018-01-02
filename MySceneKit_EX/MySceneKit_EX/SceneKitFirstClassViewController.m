//
//  SceneKitFirstClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/17.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SceneKitFirstClassViewController.h"
#import <SceneKit/SceneKit.h>
#import <SpriteKit/SpriteKit.h>

@interface SceneKitFirstClassViewController ()

@end

@implementation SceneKitFirstClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     
     SceneKit将高性能渲染引擎和导入，操作和渲染3D资源的API相结合。只需要描述场景的内容以及您希望执行的动画和动作。
     
     */
    
    //第一步 SCNScene 场景图，将几何图形，灯光，相机和其他属性连接起来组成一个层次结构的节点用来显示3D场景。
    //SCNView 用来显示3D内容的视图
    
    /*
     1⃣️获取或者创建场景
     */
    
    SCNScene *scene = [SCNScene scene];
    
    SCNScene *scene1 = [SCNScene sceneNamed:@""];
    //返回一个新的场景对象或者nil 该方法相当于提供一种方便的的方法 相当于使用NSBundle类来定位场景文件缰生成的URL传递给方法，不指定任何选项也不指定error。
    //更详细的选项或者加在文件场景图的一部分 使用SCNSceneSource
    //资源文件扩展名  .dae .abc .scn
    
    //SCNSceneSource *source = [SCNSceneSource sceneSourceWithURL:<#(nonnull NSURL *)#> options:<#(nullable NSDictionary<NSString *,id> *)#>]
    
    
    SCNScene *scene2 = [SCNScene sceneNamed:@"" inDirectory:@"" options:@{}];
    
//    options
//    影响场景加载的选项字典或nil默认选项。有关可用的键，请参阅场景加载选项。
    
    
    //SCNScene *scene3 = [SCNScene sceneWithMDLAsset:<#(nonnull MDLAsset *)#>]
    /*
     mdlAsset 模型I／O资产对象
     */
    
    //SCNScene *scene4 = [SCNScene sceneWithURL:@"" options:<#(nullable NSDictionary<NSString *,id> *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>]
    
//上方就是一个方法来创建Scene对象的方法
//===============================================++++++====================
    
    //SCNView对象的创建 用于显示3D内容的视图
    //在IOS和TVOS中，SCNView是一个UIView的之类，作为操作系统层级结构的一部分，提供了一个
    //显示3D内容的一个空间
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds options:nil];
    
    scnView.scene = scene; //指定场景
    
    scnView.backgroundColor = [UIColor whiteColor];//指定视图的北京颜色
    
    scnView.allowsCameraControl = YES; //确定用户是否可以操作用于渲染场景的当前视图
    
    scnView.antialiasingMode = SCNAntialiasingModeMultisampling2X;//用于渲染视图场景的抗锯齿模式
    scnView.preferredFramesPerSecond = 60; //视图用于渲染场景的动画真熟虑 默认是60
    
    [scnView pause:nil]; //sender请求操作的对象（在Interface Builder中连接控件时使用）。SceneKit忽略此参数。 暂停播放视图的场景
    
    [scnView play:nil];//恢复视图场景的播放。
    
    [scnView stop:nil]; //停止视图场景的播放，并将场景时间重置为开始时间。
    
    [scnView snapshot]; //场景截图
    
    //还可以获取上下文 使用的时候在研究
    //上面是SCNView的一些使用方法
//========================================================================
    
    //下面是SCNNode
    
    //一个场景由一个根节点组成，该节点定义了场景世界的坐标空间，以及其他可以使用的节点
    //在SceneKit的三维世界中，使用的是右手坐标系，在默认情况下视图的方向沿Z轴负方向
    
    //SCNNode 场景图像的结构元素，表示3D坐标空间中的位置和变换，可以在其上附加几何体，灯管，相机或其他可显示的内容。
    //节点确定场景的结构
    /*
     场景中的节点层次或场景图定义了其内容的组织和使用SceneKit的呈现和操作这些内容的能力。可以使用SceneKit编程的方式创建节点的层次结构，或者使用3D创建工具传家的文件中加载节点层次结构，或者同时用这两种方法。SceneKit提供科许多用于组织和搜索场景图的接口。
     */
    
    //创建节点
    
    SCNNode *node = [SCNNode node];
    
    SCNNode *node1 = [SCNNode nodeWithGeometry:nil];
    
    //SCNNode *node2 = [SCNNode nodeWithMDLObject:<#(nonnull MDLObject *)#>]
    
    //===================管理节点的位置==============================
    
    node.position = SCNVector3Make(0, 0, 10);
    
    //node.transform //转换应用于节点相对于其父节点
    
    //node.rotation //节点的方向，表示为绕轴的旋转角度
    
    //node.eulerAngles //节点的方向，以俯仰，偏航和滚动角度表示，每个以弧度表示。动画。
    
//    node.orientation //节点的方向，表示为四元数
    
//    node.scale //节点的缩放
    
    //node.pivot //节点的位置，旋转和缩放的枢轴点
    
//    node.worldTransform //世界变换
    
    //SCNBoundingVolume 测量位置和大小的方法SCNNode和SCNGeometry类别。
    
    //node getBoundingBoxMin:<#(nullable SCNVector3 *)#> max:<#(nullable SCNVector3 *)#>
    //获取对象边界框的最小和最大角点。

    //node getBoundingSphereCenter:<#(nullable SCNVector3 *)#> radius:<#(nullable CGFloat *)#>
    //获取对象边界球体的中心点和半径。

    //node setBoundingBoxMin:<#(nullable SCNVector3 *)#> max:<#(nullable SCNVector3 *)#>
    //设置对象的自定义边界框。
    
    
    //==========================管理节点的属性============================
    
    node.name = @"node"; //为节点提供一个描述性名称，以便轻松管理场景图。
    
    //这样当需要使用这个node的时候 只需要
    
    SCNNode *nodeCopy = [scene.rootNode childNodeWithName:@"node" recursively:YES];
    
    //就可以获取到那个叫node的节点 recursively yes搜索整个子节点子树，或者No仅搜索节点的直接子节点
    
//    NSArray *array = [scene.rootNode childNodesPassingTest:^BOOL(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
//        
//    }];
    
    [scene.rootNode enumerateChildNodesUsingBlock:^(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
        
        
    }];
    
    //有个导出场景的方法
    //writeToURL:options:delegate:progressHandler: 文档中写了 但是没有找到这个方法
    
    scnView.showsStatistics = YES; //显示统计视图
    
    SCNLight *light = [SCNLight light];
    node1.light = light;
    
//======================================================================
    
    //基本3D数据类型
    
    //1⃣️三分量矢量的表示
    
    SCNVector3 vertor3 = SCNVector3Make(1, 1, 3); //x,y,z
    
    //2⃣️四分量矢量的表示
    
    //轴角旋转或者转矩
    SCNVector4 vertor4 = SCNVector4Make(1, 2, 3, M_PI_2);
    //w旋转角度，护肤货扭矩幅度
    
    //颜色值的话 x=R y=G z=B w=Alpha
    
    //==============================场景切换=====================
    
    //[scnView presentScene:scene1 withTransition:<#(nonnull SKTransition *)#> incomingPointOfView:<#(nullable SCNNode *)#> completionHandler:<#^(void)completionHandler#>]
    //scene 要显示的新场景
    //transition 指定动画转换的持续时间和样式的对象。
    //pointOfView 在显示新场景时用作属性的节点
    //completionHandler SceneKit在转换动画完成后调用的块。
    
    //=======================SKTransition=============================
    //SKTransition对象呗用于执行一个SKScene已经呈现出来的SKView对象和一个新传入场景之间的动画转换
    
    //注意 使用SKTransition时，因为它是属于sprintKit的类，所以需要导入sprintKit
    SKTransition *reveal = [SKTransition doorwayWithDuration:1];
    /*
    + crossFadeWithDuration:
    创建交叉淡入淡出的过渡。
    + doorsCloseHorizontalWithDuration:
    创建一个转换，新场景出现为一对关闭的水平门。
    + doorsCloseVerticalWithDuration:
    创建一个过渡，新场景显示为一对关闭的垂直门。
    + doorsOpenHorizontalWithDuration:
    创建一个过渡，新场景出现为一对开放的水平门。
    + doorsOpenVerticalWithDuration:
    创建一个过渡，新场景作为一对开放的垂直门出现。
    + doorwayWithDuration:
    创建一个过渡，前一场景消失为一对开门。
    + fadeWithColor:duration:
    创建一个首先淡化为恒定颜色的渐变，然后渐变到新场景。
    + fadeWithDuration:
    创建一个首先淡化为黑色，然后渐变到新场景的过渡。
    + flipHorizontalWithDuration:
    创建一个转换，其中两个场景通过横过视图中心的水平线翻转。
    + flipVerticalWithDuration:
    创建一个转换，其中两个场景通过穿过视图中心的垂直线翻转。
    + moveInWithDirection:duration:
    创建新场景在旧场景之上移动的过渡。
    + pushWithDirection:duration:
    创建新场景移动的过渡，将旧场景推出视图。
    + revealWithDirection:duration:
    创建一个过渡，旧场景从视图中移出，揭示其下的新场景。
    + transitionWithCIFilter:duration:
    创建一个使用Core Image过滤器执行转换的转换。
    配置过渡期间场景是否被暂停
    
    pausesIncomingScene
    一个布尔值，用于确定转换过程中传入的场景是否已暂停。
    pausesOutgoingScene
    一个布尔值，用于确定在转换期间是否暂停传出的场景。
    */
    
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
