//
//  ViewController.m
//  Cube
//
//  Created by lzw on 15/9/25.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *faces;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform {
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2, containerSize.height / 2);
    face.layer.transform = transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    
    perspective = CATransform3DRotate(perspective, - M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, - M_PI_4, 0, 1, 0);
    
//    perspective = CATransform3DRotate(perspective, M_PI_4 * 5, 1, 0, 0);
//    perspective = CATransform3DRotate(perspective, M_PI_4 * 5, 0, 1, 0);
    
    self.containerView.layer.sublayerTransform = perspective;
    
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, - M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, - M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
