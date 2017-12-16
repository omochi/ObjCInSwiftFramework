//
//  NSString+iconv.m
//  NSStringUsingIconv
//
//  Created by sonson on 11/07/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+iconv.h"

#include <iconv.h>
#include <errno.h>

#define __iconvBufferLength 1024

@implementation NSString(iconv)

+ (NSString*)stringByDefaultEncodingWithData:(NSData *)data {
	return [self stringWithData:data iconvEncoding:@"CP932"];
}

+ (NSString *)stringWithData:(NSData *)data iconvEncoding:(NSString *)encodingString {
	iconv_t descriptor = iconv_open("UTF-16//IGNORE", [encodingString UTF8String]);
	size_t inbytesleft = [data length];
	char* inbuf = (char*)[data bytes];
	
	size_t outbytesleft;
	char* outbuf = malloc(__iconvBufferLength);
	char* outbyteslength = NULL;
	NSMutableString *resultString = [NSMutableString string];
	errno = E2BIG;
	
	while (errno == E2BIG) {
		outbytesleft = __iconvBufferLength;
		outbyteslength = outbuf;
		errno = 0;
		iconv(descriptor, &inbuf, &inbytesleft, &outbyteslength, &outbytesleft);
		if (errno == EILSEQ || errno == EINVAL) break;
		NSString *part = [[NSString alloc] initWithBytes:outbuf
												   length:__iconvBufferLength-outbytesleft
												 encoding:NSUTF16StringEncoding];
		[resultString appendString:part];
	}
	iconv_close(descriptor);
	free(outbuf);
	
	return [NSString stringWithString:resultString];
}
@end
