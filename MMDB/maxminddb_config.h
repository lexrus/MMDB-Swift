#ifndef MAXMINDDB_CONFIG_H
#define MAXMINDDB_CONFIG_H

#ifndef MMDB_UINT128_USING_MODE
/* Define as 1 if we we use unsigned int __atribute__ ((__mode__(TI))) for uint128 values */
#define MMDB_UINT128_USING_MODE 0
#endif

/* Define as 1 if we don't have an unsigned __int128 type */
#ifndef MMDB_UINT128_IS_BYTE_ARRAY
#import "TargetConditionals.h"
#if TARGET_OS_IPHONE
#define MMDB_UINT128_IS_BYTE_ARRAY 1
#endif
#endif

#endif                          /* MAXMINDDB_CONFIG_H */
