//
//  TheRootTableViewController.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/22.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "TheRootTableViewController.h"
#import "FirstClassOfSCNNodeViewController.h"
#import "SecondOfClassSCNLightUIViewController.h"
#import "ThirdOfClassSCNCameraViewController.h"
#import "FourOfClassACNActionViewController.h"
#import "FiveOfClassSCNGeometryViewController.h"
#import "MaterialClassViewController.h"
#import "SCNPhysicsWorldOfClassViewController.h"
#import "ParticleSystemClassViewController.h"
#import "PhysicsActionOfClassViewController.h"
#import "SCKKinnerOfClassViewController.h"
#import "AnimationTransitionEffectViewController.h"
#import "ChangeCameraViewController.h"
#import "SCNConstraintViewController.h"
#import "SCNPhysicsFieldViewController.h"
#import "SceneChangeOfClassViewController.h"
#import "ShadowUserOfClassViewController.h"
#import "SCNAnimationEventOfClassViewController.h"
#import "SkyBoxViewController.h"
#import "SceneKitPlayVideoViewController.h"
#import "SCNUtoVRPlayerViewController.h"
#import "CollisionDetectionOfClassViewController.h"
#import "DebugOfSceneKitViewController.h"
#import "SCNNodeCloneOfClassViewController.h"
#import "PictureInPictureOfClassViewController.h"
#import "SCNLevelOfClassViewController.h"
#import "TheShapesOfPhysicsViewController.h"
#import "GLSLUseingOfClassViewController.h"
#import "AManViewController.h"

@interface TheRootTableViewController ()

{
    NSMutableArray *_array;
}

@end

@implementation TheRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
    [array addObject:@{@"title":@"SCNNode的用法",@"C":@"FirstClassOfSCNNodeViewController"}];
    [array addObject:@{@"title":@"SCNLight的使用",@"C":[SecondOfClassSCNLightUIViewController new]}];
    [array addObject:@{@"title":@"SCNCamera的使用",@"C":[ThirdOfClassSCNCameraViewController new]}];
    [array addObject:@{@"title":@"SCNAction的使用",@"C":[FourOfClassACNActionViewController new]}];
    [array addObject:@{@"title":@"SCNGeometry的使用",@"C":[FiveOfClassSCNGeometryViewController new]}];
    [array addObject:@{@"title":@"材质的介绍",@"C":[MaterialClassViewController new]}];
    [array addObject:@{@"title":@"物理世界的介绍",@"C":[SCNPhysicsWorldOfClassViewController new]}];
    [array addObject:@{@"title":@"粒子系统的介绍",@"C":[ParticleSystemClassViewController new]}];
    [array addObject:@{@"title":@"认识物理行为",@"C":[PhysicsActionOfClassViewController new]}];
    [array addObject:@{@"title":@"骨骼动画（SCNKinner）",@"C":[SCKKinnerOfClassViewController new]}];
    [array addObject:@{@"title":@"动画的过渡效果",@"C":[AnimationTransitionEffectViewController new]}];
    [array addObject:@{@"title":@"视角切换",@"C":[ChangeCameraViewController new]}];
    [array addObject:@{@"title":@"约束",@"C":[SCNConstraintViewController new]}];
    [array addObject:@{@"title":@"力场",@"C":[SCNPhysicsFieldViewController new]}];
    [array addObject:@{@"title":@"场景的切换",@"C":[SceneChangeOfClassViewController new]}];
    [array addObject:@{@"title":@"阴影的用法",@"C":[ShadowUserOfClassViewController new]}];
    [array addObject:@{@"title":@"SCNAnimationEventOfClassViewController的用法",@"C":[SCNAnimationEventOfClassViewController new]}];
    [array addObject:@{@"title":@"天空盒子",@"C":[SkyBoxViewController new]}];
    [array addObject:@{@"title":@"渲染视频",@"C":[SceneKitPlayVideoViewController new]}];
    [array addObject:@{@"title":@"全景视频",@"C":[SCNUtoVRPlayerViewController new]}];
    [array addObject:@{@"title":@"碰撞和接触",@"C":[CollisionDetectionOfClassViewController new]}];
    [array addObject:@{@"title":@"调试模式",@"C":[DebugOfSceneKitViewController new]}];
    [array addObject:@{@"title":@"SCNNode的克隆",@"C":[SCNNodeCloneOfClassViewController new]}];
    [array addObject:@{@"title":@"画中画效果",@"C":[PictureInPictureOfClassViewController new]}];
    [array addObject:@{@"title":@"SCNLevelOfDetail的性能优化",@"C":[SCNLevelOfClassViewController new]}];
    [array addObject:@{@"title":@"物理身体是什么样子？",@"C":[TheShapesOfPhysicsViewController new]}];
    [array addObject:@{@"title":@"GLSL的使用",@"C":[GLSLUseingOfClassViewController new]}];
    [array addObject:@{@"title":@"一个人",@"C":[AManViewController new]}];

    _array = array;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];

    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
        
    }
    
    cell.textLabel.text = _array[indexPath.row][@"title"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id string = _array[indexPath.row][@"C"];
    
    [self.navigationController pushViewController:string animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
