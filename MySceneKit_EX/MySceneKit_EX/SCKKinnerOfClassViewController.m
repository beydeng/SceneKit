//
//  SCKKinnerOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/22.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SCKKinnerOfClassViewController.h"
#import <SceneKit/SceneKit.h>


@interface SCKKinnerOfClassViewController ()
{
    CAAnimation *animation1;
}
@end

@implementation SCKKinnerOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *view = [[SCNView alloc]initWithFrame:self.view.bounds];
    view.allowsCameraControl = YES;
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
//    SCNScene *scene = [SCNScene sceneNamed:@"skinning.dae" inDirectory:@"art.scnassets/skinning" options:nil];
//    view.scene = scene;
    
    //虽然使用SCNScene能够加载场景，但是在这里我们需要一个用于管理文件的读取任务，就需要使用一个类SCNSceneSource
    
    NSString *strPath = [NSString stringWithFormat:@"file://%@/art.scnassets/skinning/skinning.dae",[[NSBundle mainBundle]resourcePath]];
    
    SCNSceneSource *source = [SCNSceneSource sceneSourceWithURL:[NSURL URLWithString:strPath]  options:nil];
    //可以看见有个nsdata，也就是说我们可以从网络上获取对象
    
    SCNScene * scene = [source sceneWithOptions:nil error:nil];
    view.scene = scene;
    
    //获取场景中某种对象的标示数组
    NSArray *arrAnimationIDs = [source identifiersOfEntriesWithClass:[CAAnimation class]];
    //这个方法是获取场景中包含的某一类对象的标示数组。可以获取的类型有SCNMaterial,SCNScene,SCNGeometry,SCNNode,CAAnimation,SCNlight,SCNCamera,SCNSkinner,SCNMorpher,NSImage
    
    //然后把每个动画帧放到一个大数组中
    
    NSMutableArray *longAnimations = [NSMutableArray arrayWithCapacity:[arrAnimationIDs count]];
    CFTimeInterval maxDuration = 0;
    
    for (NSInteger index=0; index<[arrAnimationIDs count]; index++) {
        
        CAAnimation *animation = [source entryWithIdentifier:arrAnimationIDs[index] withClass:[CAAnimation class]];
        //根据对象的ID和对象的类型，获取对象本身

        if (animation) {

            maxDuration = MAX(maxDuration, animation.duration);
            
            [longAnimations addObject:animation];
            
        }
        
    }
    
//     创建一个动画组
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup new];
    animationGroup.animations = longAnimations;
    animationGroup.duration = maxDuration;
    
    //下面我们截取我们要的动画阶段
    
    CAAnimationGroup *animations = [animationGroup copy];
    //截取20-24秒
    animations.timeOffset = 20;
    //创建一个重复执行这个动画的动画组
    CAAnimationGroup *lastAnimation = [CAAnimationGroup animation];
    lastAnimation.animations = @[animations];
    lastAnimation.duration = 24.71-20;
    lastAnimation.repeatCount = MAXFLOAT;
    lastAnimation.autoreverses = YES;
    
    //或者取出某一个动画
//    CAAnimation *lastAnimation = longAnimations[0];
//    lastAnimation.repeatCount = MAXFLOAT;
//    lastAnimation.autoreverses = YES;

    //然后将这个动作加入到一个节点中
    
    SCNNode *node = [scene.rootNode childNodeWithName:@"avatar_attach" recursively:YES];
    
    [node addAnimation:lastAnimation forKey:@"lastAnimation"];
    
    
    
    
    
    
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
