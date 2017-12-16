//
//  NSString+iconv.h
//  NSStringUsingIconv
//
//  Created by sonson on 11/07/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ICONV_CODE_TYPE_FOR_LOADING_DAT			@"CP932"

#define ICONV_CODE_TYPE_FOR_LOADING_BBSMENU		@"SHIFT-JIS"

#define ICONV_CODE_TYPE_FOR_REPLAYING_2CH		@"CP932"

#define ICONV_CODE_TYPE_FOR_LOADING_SUBJECT_TXT	@"SHIFT-JIS"

#define ICONV_CODE_TYPE_FOR_LOADING_FIND2CH		@"EUC-JP"

#define ICONV_CODE_TYPE_FOR_LOADING_ZENBUN		@"UTF8"

#define ICONV_CODE_UTF8		@"UTF8"

@interface NSString(iconv)

+ (NSString*)stringByDefaultEncodingWithData:(NSData *)data;
+ (NSString *)stringWithData:(NSData *)data iconvEncoding:(NSString *)encodingString;

@end
