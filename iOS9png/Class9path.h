//
//  Class9path.h
//  iOS9png
//
//  Created by Javier Gonzalez Cabezas on 04/12/13.
//  Copyright (c) 2013 Javier. All rights reserved.
//

#import <Foundation/Foundation.h>
unsigned char *rawData;
NSUInteger bytesPerRow;

@interface Class9path : NSObject


+(UIImage*) createImageFromNinepatch :(UIImage*)myImage mWitdh:(int) width mHeight:(int) height;

+(bool)isTransparent:(int)xx andY:(int)yy;

+(void) fillContext:(UIImage*)image;
@end
