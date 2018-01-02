//
//  FiveOfClassSCNGeometryViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/21.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "FiveOfClassSCNGeometryViewController.h"
#import <SceneKit/SceneKit.h>

@interface FiveOfClassSCNGeometryViewController ()

@end

@implementation FiveOfClassSCNGeometryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个视图来显示游戏场景
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:view];
    
    //创建一个空白的场景
    
    SCNScene *scene = [SCNScene scene];
    view.scene = scene;
    
    //创建一个立方体
    
    SCNBox *box = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0];
    //那么这个地方的chamferRadius是什么作用呢？

    box.firstMaterial.diffuse.contents = [UIColor redColor];
    SCNNode *nodeBox = [SCNNode node];
    nodeBox.geometry = box;
    nodeBox.position = SCNVector3Make(1, 1, 1);
    [scene.rootNode addChildNode:nodeBox];
    
    //
    SCNBox *box2 = [SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:1];
    box2.firstMaterial.diffuse.contents = [UIColor greenColor];
    SCNNode *nodeBox2 = [SCNNode node];
    nodeBox2.geometry = box2;
    nodeBox2.position = SCNVector3Make(3, 3, 3);
    [scene.rootNode addChildNode:nodeBox2];
    
    view.allowsCameraControl = YES;
    
    //创建一个平面
    SCNPlane *plane = [SCNPlane planeWithWidth:1 height:1];
    plane.firstMaterial.diffuse.contents = [UIColor yellowColor];
    SCNNode *nodePlane = [SCNNode node];
    nodePlane.geometry = plane;
    nodePlane.position = SCNVector3Make(0, 0, 4);
    [scene.rootNode addChildNode:nodePlane];
    
    //创建一个角锥体
    
    SCNPyramid *pyeamid = [SCNPyramid pyramidWithWidth:1 height:1 length:1];
    pyeamid.firstMaterial.diffuse.contents = [UIColor blueColor];
    SCNNode *nodePyramid = [SCNNode node];
    nodePyramid.geometry = pyeamid;
    nodePyramid.position = SCNVector3Make(2,2, 2);
    [scene.rootNode addChildNode:nodePyramid];
    
    //创建一个球体
    SCNSphere *sphere = [SCNSphere sphereWithRadius:2];
    sphere.firstMaterial.diffuse.contents = [UIColor purpleColor];
    SCNNode *nodeSphere = [SCNNode node];
    nodeSphere.geometry = sphere;
    nodeSphere.position = SCNVector3Make(4,4, 4);
    [scene.rootNode addChildNode:nodeSphere];
    
    //创建一个圆柱体
    SCNCylinder *cylinder = [SCNCylinder cylinderWithRadius:1 height:1];
    cylinder.firstMaterial.diffuse.contents = [UIColor brownColor];
    SCNNode *nodeCylinder = [SCNNode node];
    nodeCylinder.geometry = cylinder;
    nodeCylinder.position = SCNVector3Make(5, 5, 5);
    [scene.rootNode addChildNode:nodeCylinder];
    
    //创建一个圆锥体
    SCNCone *cone = [SCNCone coneWithTopRadius:2 bottomRadius:1 height:1];
    cone.firstMaterial.diffuse.contents = [UIColor whiteColor];
    SCNNode *nodeCone = [SCNNode node];
    nodeCone.geometry = cone;
    nodeCone.position = SCNVector3Make(6, 6, 6);
    [scene.rootNode addChildNode:nodeCone];
    
    //创建一个管道
    SCNTube *tube = [SCNTube tubeWithInnerRadius:1 outerRadius:2 height:1];
    tube.firstMaterial.diffuse.contents = [UIColor cyanColor];
    SCNNode *nodeTube = [SCNNode node];
    nodeTube.geometry = tube;
    nodeTube.position = SCNVector3Make(7, 7, 7);
    [scene.rootNode addChildNode:nodeTube];
    
    //创建一个环面
    SCNTorus *torus = [SCNTorus torusWithRingRadius:2 pipeRadius:1];
    torus.firstMaterial.diffuse.contents = [UIColor magentaColor];
    SCNNode *nodeTorus = [SCNNode node];
    nodeTorus.geometry = torus;
    nodeTorus.position = SCNVector3Make(8, 8, 8);
    [scene.rootNode addChildNode:nodeTorus];
    
    //创建一个地板
    SCNFloor *floor = [SCNFloor floor];
    floor.firstMaterial.diffuse.contents = [UIColor orangeColor];
    SCNNode *nodeFloor = [SCNNode nodeWithGeometry:floor];
    nodeFloor.position = SCNVector3Make(9, 9, 9);
    [scene.rootNode addChildNode:nodeFloor];
    
    //立体文字
    SCNText *text = [SCNText textWithString:@"SCNText" extrusionDepth:1];//可以理解为字体的厚度
    text.firstMaterial.diffuse.contents = [UIColor blackColor];
    SCNNode *nodeText = [SCNNode nodeWithGeometry:text];
    nodeText.position = SCNVector3Make(10, 10, 10);
    [scene.rootNode addChildNode:nodeText];
    
    //自定义形状
    //自定义需要用到SCNShape 既然有shape 就可以联想到在IOS里面怎么作出一个shape
    //1 先胡乱画一个贝塞尔曲线吧 画一个菱形出来
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(11, 11)];
    [path addLineToPoint:CGPointMake(17, 8)];
    [path addLineToPoint:CGPointMake(22, 11)];
    [path addLineToPoint:CGPointMake(17, 14)];
    [path addLineToPoint:CGPointMake(11, 11)];
    [path closePath];
    
    SCNShape *shape = [SCNShape shapeWithPath:path extrusionDepth:1];
    shape.firstMaterial.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_height.png"];
    SCNNode *nodeShape = [SCNNode nodeWithGeometry:shape];
    [scene.rootNode addChildNode:nodeShape];
    
    
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
