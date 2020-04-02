//
//  ViewController.m
//  FQGPUImageDemo
//
//  Created by nebula on 2020/1/9.
//  Copyright © 2020 nebula. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *inputImage = [UIImage imageNamed:@"ball.jpeg"];
    UIImage *newImage = inputImage;
    
    {
        //创建一个亮度的滤镜
        GPUImageBrightnessFilter *passthroughFilter = [[GPUImageBrightnessFilter alloc] init];
        passthroughFilter.brightness = -0.5f;
        //设置要渲染的区域
        [passthroughFilter forceProcessingAtSize:inputImage.size];
        [passthroughFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
        //添加上滤镜
        [stillImageSource addTarget:passthroughFilter];
        //开始渲染
        [stillImageSource processImage];
        //获取渲染后的图片
        newImage = [passthroughFilter imageFromCurrentFramebuffer];
    }
    
    
    //GPUImageStretchDistortionFilter *disFilter =[[GPUImageStretchDistortionFilter alloc] init];
    //GPUImageBulgeDistortionFilter *disFilter = [[GPUImageBulgeDistortionFilter alloc] init];
    //GPUImagePinchDistortionFilter *disFilter = [[GPUImagePinchDistortionFilter alloc] init];
    //GPUImageGlassSphereFilter *disFilter = [[GPUImageGlassSphereFilter alloc] init];
    //GPUImageSphereRefractionFilter *disFilter = [[GPUImageSphereRefractionFilter alloc] init];
    //GPUImageToonFilter *disFilter = [[GPUImageToonFilter alloc] init];
    {
//        GPUImageVignetteFilter *disFilter = [[GPUImageVignetteFilter alloc] init];
//        //设置要渲染的区域
//        [disFilter forceProcessingAtSize:inputImage.size];
//        [disFilter useNextFrameForImageCapture];
//        //获取数据源
//        GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
//        //添加上滤镜
//        [stillImageSource addTarget:disFilter];
//        //开始渲染
//        [stillImageSource processImage];
//        //获取渲染后的图片
//        newImage = [disFilter imageFromCurrentFramebuffer];
    }
    
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
}


@end
