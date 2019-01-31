//
//  NSURL+ResponseBlock.h
//  testTaskGitHub
//
//  Created by Jesus on 31.01.2019.
//  Copyright © 2019 Jesus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL(ResponseBlock)
- (void) asyncLoadWithResponseBlock: (void (^)(id data))block;
@end
