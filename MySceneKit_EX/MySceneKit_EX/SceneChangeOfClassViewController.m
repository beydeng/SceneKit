//
//  SceneChangeOfClassViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/24.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "SceneChangeOfClassViewController.h"
#import <SceneKit/SceneKit.h>

@import SpriteKit;

@interface SceneChangeOfClassViewController ()
{
    SCNView *_scnView;
}
@end

@implementation SceneChangeOfClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *scnView = [[SCNView alloc]initWithFrame:self.view.bounds];
    scnView.backgroundColor = [UIColor grayColor];
    scnView.allowsCameraControl = YES;
    [self.view addSubview:scnView];
    
    _scnView = scnView;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10+64, 100, 30)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:8];
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(btnChange:) forControlEvents:UIControlEventTouchUpInside];
    [scnView addSubview:button];
    
    [self createTheOtherScene];
    
    
//    [_scnView presentScene:<#(nonnull SCNScene *)#> withTransition:<#(nonnull SKTransition *)#> incomingPointOfView:<#(nullable SCNNode *)#> completionHandler:<#^(void)completionHandler#>]
    
    // Do any additional setup after loading the view.
}

-(void)btnChange:(UIButton *)sender
{
    if (sender.selected==NO) {
        
        sender.selected = YES;
        
        [self createOneScene];
        
        
    }
    else
    {
        sender.selected = NO;

        [self createTheOtherScene];
    }
    
}

-(void)createOneScene
{
    
    SCNScene *scene = [SCNScene scene];

//    _scnView.scene = scene;
    
    SCNNode *node = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:1]];
    node.geometry.firstMaterial.diffuse.contents = [UIColor blueColor];
    [scene.rootNode addChildNode:node];
    
    //加入切换场景的动画
    
    SKTransition *transi = [SKTransition doorsOpenHorizontalWithDuration:1];
    
    [_scnView presentScene:scene withTransition:transi incomingPointOfView:nil completionHandler:^{
        
    }];
    
}

-(void)createTheOtherScene
{
    SCNScene *scene = [SCNScene scene];
    
//    _scnView.scene = scene;
    
    SCNNode *node = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:1]];
    node.geometry.firstMaterial.diffuse.contents = [UIColor redColor];
    [scene.rootNode addChildNode:node];
    
    SKTransition *transi = [SKTransition doorsCloseHorizontalWithDuration:1];
    
    [_scnView presentScene:scene withTransition:transi incomingPointOfView:nil completionHandler:^{
            
    }];
    
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
