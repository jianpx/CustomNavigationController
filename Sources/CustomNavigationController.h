//
//  CustomNavigationController.h
//  CustomNavigationControllerExample
//
//  Created by jianpx on 12/31/13.
//  Copyright (c) 2013 PS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ExtendUINavigationBarDelegate)
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item;
@end

@interface CustomNavigationController : UINavigationController

+(UIBarButtonItem *)createNavBarButton:(NSString *)title target:(id)target action:(SEL)action;
@end
