//
//  NSURL+ResponseBlock.m
//  testTaskGitHub
//
//  Created by Jesus on 31.01.2019.
//  Copyright © 2019 Jesus. All rights reserved.
//

#import "NSURL+ResponseBlock.h"

static NSMutableDictionary *md;

@implementation NSURL(ResponseBlock)
-(void)asyncLoadWithResponseBlock: (void (^)(id data))block
{
	__block NSData *data = [md valueForKey: self.absoluteString];
	if(data)
		return block(data);

	dispatch_async(dispatch_get_global_queue(0, 0), ^
	{
		data = [NSData dataWithContentsOfURL: self];
		if(!md)
			md = [NSMutableDictionary new];
		if(!data)
			return;
		[md setObject: data forKey: self.absoluteString];
		dispatch_async(dispatch_get_main_queue(), ^
		{
			block(data);
		});
	});
}
@end
