//
//  CustomNavigationController.m
//  CustomNavigationControllerExample
//
//  Created by jianpx on 12/31/13.
//  Copyright (c) 2013 PS. All rights reserved.
//


#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    return [super initWithRootViewController:rootViewController];
}

+(UIBarButtonItem *)createNavBarButton:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    return back;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([self.viewControllers count] > 0){
        UIViewController *top = (UIViewController *)(self.viewControllers.lastObject);
        if(top.navigationItem.backBarButtonItem == nil)
            top.navigationItem.backBarButtonItem = [[self class] createNavBarButton:@"返回" target:nil action:nil];
    }
    [super pushViewController:viewController animated:animated];
}

-(BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    if([self.viewControllers count]){
        UIViewController *top = self.viewControllers.lastObject;
        /* hidden feature: you can implement willgoBack in your XXViewController to do something when user click the
           "go back" button, and deside whether to go back to previous viewcontroller or not.
        */
        if([top respondsToSelector:@selector(willGoBack)]){
            if([top performSelector:@selector(willGoBack)])
                return [super navigationBar:navigationBar shouldPopItem:item];
            else
                return NO;
        }
    }
    return [super navigationBar:navigationBar shouldPopItem:item];
}

@end
