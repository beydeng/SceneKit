//
//  TheGameScene.m
//  MySceneKit_EX
//
//  Created by DengPan on 2017/8/17.
//  Copyright © 2017年 www.TheSuperApplication.com. All rights reserved.
//

#import "TheGameScene.h"

@interface TheGameScene ()

{
    SCNNode *_node;
}

@end


@implementation TheGameScene


- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        SCNBox *box =[SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:0.0f];
//        
//        SCNMaterial *mater = [SCNMaterial material];
//        mater.lightingModelName = SCNLightingModelBlinn;
//        mater.diffuse.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_basecolor.png"];
//        mater.ambient.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_height.png"];
//        mater.specular.contents = [UIImage imageNamed:@"art.scnassets/Material/blocksrough_ambientocclusion.png"];
//        box.firstMaterial = mater;
        
//        _node = [SCNNode nodeWithGeometry:box];
        
        _node = [SCNNode node];
        SCNScene *characterScene = [SCNScene sceneNamed:@"art.scnassets/Fox/panda.scn"];
        SCNNode *characterTopLevelNode = characterScene.rootNode.childNodes[0];
        [_node addChildNode:characterTopLevelNode];
        
        [characterTopLevelNode enumerateChildNodesUsingBlock:^(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
           
            NSLog(@"child==--==%@",child);
            
        }];
        
        SCNNode *node = [characterTopLevelNode childNodeWithName:@"Bip001_R_UpperArm" recursively:YES];
        
//        SCNVector4 vector4 = SCNVector4Make(0, 0, 0, M_PI_2);
        
        [node runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:2 y:0 z:0 duration:1]]];
        
    }
    
    return self;
    
}


//+(instancetype)scene
//{
//    
//    if (self == [super scene]) {
//        
//        SCNNode *node = [SCNNode nodeWithGeometry:[SCNBox boxWithWidth:1 height:1 length:1 chamferRadius:1.0f]];
//
//        
//        
//        
//        
//        
//    }
//    
//    return [self scene];
//    
//}





@end
