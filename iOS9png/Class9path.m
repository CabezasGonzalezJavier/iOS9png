//
//  Class9path.m
//  iOS9png
//
//  Created by Javier Gonzalez Cabezas on 04/12/13.
//  Copyright (c) 2013 Javier. All rights reserved.
//

#import "Class9path.h"

@implementation Class9path
+(UIImage*) createImageFromNinepatch :(UIImage*) myImage mWitdh:(int) width mHeight:(int) height{
    
    int firstBlack=0;
    int secondBlack=0;
    int firstBlack2=0;
    int secondBlack2=0;
    int i;
    
    [self fillContext:myImage];
    
    /// to find firstBlackX
    for(i=0; i < myImage.size.width; i++){
        if(![self isTransparent:i andY:0]){
            firstBlack = i;
            break;
        }
    }
    
    
    //// to find firstTransX
    for(i=firstBlack; i<myImage.size.width; i++){
        if([self isTransparent:i andY:0]){
            secondBlack = i;
            break;
        }
    }
    
    //// to find firstBlackY
    for(i=0; i < myImage.size.height; i++){
        if(![self isTransparent:0 andY:i]){
            firstBlack2 = i;
            break;
        }
    }
    
    
    //// to find firstTransY
    for(i=firstBlack2; i<myImage.size.height; i++){
        if([self isTransparent:0 andY:i]){
            secondBlack2 = i;
            break;
        }
        
    }
    
    UIGraphicsEndImageContext();
    
    
    ///Corner1
    CGRect newSize = CGRectMake(1.0, 1.0, firstBlack, firstBlack2);
    
    CGImageRef tmp = CGImageCreateWithImageInRect([myImage CGImage], newSize);
    
    UIImage *corner1 = [UIImage imageWithCGImage:tmp];
    
    CGImageRelease(tmp);
    
    ///Up-Stretch side
    CGRect newSize2 = CGRectMake(firstBlack, 1.0, secondBlack-firstBlack, firstBlack2);
    
    CGImageRef tmp2 = CGImageCreateWithImageInRect([myImage CGImage], newSize2);
    
    UIImage *upStretch = [UIImage imageWithCGImage:tmp2];
    
    CGImageRelease(tmp2);
    
    
    ///corner2
    CGRect newSize3 = CGRectMake(secondBlack, 1.0, myImage.size.width-secondBlack, firstBlack2);
    
    CGImageRef tmp3 = CGImageCreateWithImageInRect([myImage CGImage], newSize3);
    
    UIImage *corner2 = [UIImage imageWithCGImage:tmp3];
    
    CGImageRelease(tmp3);
    
    ///westStretch side
    CGRect newSize4 = CGRectMake(1.0, firstBlack2, firstBlack, secondBlack2-firstBlack2);
    
    CGImageRef tmp4 = CGImageCreateWithImageInRect([myImage CGImage], newSize4);
    
    UIImage *westStretch = [UIImage imageWithCGImage:tmp4];
    
    CGImageRelease(tmp4);
    
    
    ///Middle Stretch Side
    CGRect newSize5 = CGRectMake(firstBlack, firstBlack2, secondBlack-firstBlack, secondBlack2-firstBlack2);
    
    CGImageRef tmp5 = CGImageCreateWithImageInRect([myImage CGImage], newSize5);
    
    UIImage *middleStretch = [UIImage imageWithCGImage:tmp5];
    
    CGImageRelease(tmp5);
    
    
    ///East Stretch Side
    CGRect newSize6 = CGRectMake(secondBlack, firstBlack2, myImage.size.width-secondBlack, secondBlack2-firstBlack2);
    
    CGImageRef tmp6 = CGImageCreateWithImageInRect([myImage CGImage], newSize6);
    
    UIImage *eastStretch = [UIImage imageWithCGImage:tmp6];
    
    CGImageRelease(tmp6);
    
    ///corner3
    CGRect newSize7 = CGRectMake(1.0, secondBlack2, firstBlack, myImage.size.height-secondBlack2);
    
    CGImageRef tmp7 = CGImageCreateWithImageInRect([myImage CGImage], newSize7);
    
    UIImage *corner3 = [UIImage imageWithCGImage:tmp7];
    
    CGImageRelease(tmp7);
    
    
    ///Down Stretch Side
    CGRect newSize8 = CGRectMake(firstBlack, secondBlack2, secondBlack-firstBlack, myImage.size.height-secondBlack2);
    
    CGImageRef tmp8 = CGImageCreateWithImageInRect([myImage CGImage], newSize8);
    
    UIImage *downStretch = [UIImage imageWithCGImage:tmp8];
    
    CGImageRelease(tmp8);
    
    
    ///corner4
    CGRect newSize9 = CGRectMake(secondBlack, secondBlack2, myImage.size.width-secondBlack, myImage.size.height-secondBlack2);
    
    CGImageRef tmp9 = CGImageCreateWithImageInRect([myImage CGImage], newSize9);
    
    UIImage *corner4 = [UIImage imageWithCGImage:tmp9];
    
    CGImageRelease(tmp9);
    ///////////////////////
    
    
    CGSize size = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(size);
    
    CGPoint thumbPoint = CGPointMake(0, 0);
    [corner1 drawAtPoint:thumbPoint];
    
    [upStretch drawInRect:CGRectMake(firstBlack, 0, width-(myImage.size.width-secondBlack)-firstBlack, firstBlack2)];
    
    
    CGPoint thirdPoint = CGPointMake(width-(myImage.size.width-secondBlack),0);
    [corner2 drawAtPoint:thirdPoint];
    
    
    [westStretch drawInRect:CGRectMake(0, firstBlack2, firstBlack, height-(myImage.size.height-secondBlack2)-firstBlack2)];
    
    
    [middleStretch drawInRect:CGRectMake(firstBlack, firstBlack2, width-(myImage.size.width-secondBlack)-firstBlack, height-(myImage.size.height-secondBlack2)-firstBlack2)];
    
    
    [eastStretch drawInRect:CGRectMake(width-(myImage.size.width-secondBlack), firstBlack2, myImage.size.width-secondBlack, height-(myImage.size.height-secondBlack2)-firstBlack2)];
    
    
    CGPoint seventhPoint = CGPointMake(0,height-(myImage.size.height-secondBlack2));
    [corner3 drawAtPoint:seventhPoint];
    
    [downStretch drawInRect:CGRectMake(firstBlack, height-(myImage.size.height-secondBlack2), width-(myImage.size.width-secondBlack)-firstBlack, myImage.size.height-secondBlack2)];
    
    CGPoint ninthPoint = CGPointMake(width-(myImage.size.width-secondBlack),height-(myImage.size.height-secondBlack2));
    [corner4 drawAtPoint:ninthPoint];
    
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    free(rawData);
    
    return result;
}


+(bool)isTransparent:(int)xx andY:(int)yy
{
    
    
    // Now your rawData contains the image data in the RGBA8888 pixel format.
    int byteIndex = (bytesPerRow * yy) + xx * 4;
    int alpha = rawData[byteIndex + 3];
    
    if(alpha == 0)
        return YES;
    else
        return NO;
    
}


+(void) fillContext:(UIImage*)image
{
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    // First get the image into your data buffer
    
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
}
@end
