//
//  TheGameViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/17.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "TheGameViewController.h"
#import "TheGameView.h"
#import "TheGameScene.h"

@interface TheGameViewController ()

@end

@implementation TheGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TheGameView *gameView = [[TheGameView alloc]initWithFrame:self.view.bounds];
    
    SCNScene *scene = [SCNScene scene];
    
    TheGameScene *sence = [[TheGameScene alloc]init];
    
    [scene.rootNode addChildNode:sence.node];
    
    gameView.scene = scene;
    
    [self.view addSubview:gameView];
    
    
    
    
    
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
