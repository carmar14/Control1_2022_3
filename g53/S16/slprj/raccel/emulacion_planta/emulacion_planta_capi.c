#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "emulacion_planta_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "emulacion_planta.h"
#include "emulacion_planta_capi.h"
#include "emulacion_planta_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0
, 0 } , { 1 , 0 , TARGET_STRING ( "emulacion_planta/Transfer Fcn" ) ,
TARGET_STRING ( "out" ) , 0 , 0 , 1 , 0 , 1 } , { 2 , 0 , TARGET_STRING (
"emulacion_planta/Zero-Order Hold" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 ,
2 } , { 3 , 0 , TARGET_STRING ( "emulacion_planta/Unbuffer1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 3 } , { 4 , 0 , TARGET_STRING (
"emulacion_planta/Unbuffer2" ) , TARGET_STRING ( "ref" ) , 0 , 0 , 1 , 0 , 3
} , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 5 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P1" ) , 0 , 1 , 0 }
, { 6 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) , TARGET_STRING
( "P2" ) , 0 , 1 , 0 } , { 7 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P3" ) , 0 , 1 , 0 }
, { 8 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) , TARGET_STRING
( "P4" ) , 0 , 1 , 0 } , { 9 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P5" ) , 0 , 1 , 0 }
, { 10 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P6" ) , 0 , 1 , 0 } , { 11 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P7" ) , 0 , 1 , 0 }
, { 12 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P8" ) , 0 , 1 , 0 } , { 13 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P9" ) , 0 , 1 , 0 }
, { 14 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P10" ) , 0 , 1 , 0 } , { 15 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P11" ) , 0 , 1 , 0 }
, { 16 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P12" ) , 0 , 1 , 0 } , { 17 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P13" ) , 0 , 1 , 0 }
, { 18 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P14" ) , 0 , 1 , 0 } , { 19 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P15" ) , 0 , 1 , 0 }
, { 20 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P16" ) , 0 , 2 , 0 } , { 21 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P17" ) , 0 , 1 , 0 }
, { 22 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P18" ) , 0 , 2 , 0 } , { 23 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P19" ) , 0 , 1 , 0 }
, { 24 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P21" ) , 0 , 1 , 0 } , { 25 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P22" ) , 0 , 3 , 0 }
, { 26 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P23" ) , 0 , 4 , 0 } , { 27 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P25" ) , 0 , 1 , 0 }
, { 28 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P26" ) , 0 , 5 , 0 } , { 29 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P27" ) , 0 , 1 , 0 }
, { 30 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P28" ) , 0 , 1 , 0 } , { 31 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P29" ) , 0 , 1 , 0 }
, { 32 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P30" ) , 0 , 1 , 0 } , { 33 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P31" ) , 0 , 1 , 0 }
, { 34 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P32" ) , 0 , 1 , 0 } , { 35 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P33" ) , 0 , 1 , 0 }
, { 36 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P34" ) , 0 , 1 , 0 } , { 37 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P35" ) , 0 , 2 , 0 }
, { 38 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P36" ) , 0 , 1 , 0 } , { 39 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P37" ) , 0 , 1 , 0 }
, { 40 , TARGET_STRING ( "emulacion_planta/Query Instrument" ) ,
TARGET_STRING ( "P38" ) , 0 , 1 , 0 } , { 41 , TARGET_STRING (
"emulacion_planta/Query Instrument" ) , TARGET_STRING ( "P39" ) , 0 , 1 , 0 }
, { 42 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P1" ) , 0 , 1 , 0 } , { 43 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P2" ) , 0 , 1 , 0 } , {
44 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P3" ) , 0 , 1 , 0 } , { 45 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P4" ) , 0 , 1 , 0 } , {
46 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P5" ) , 0 , 1 , 0 } , { 47 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P6" ) , 0 , 1 , 0 } , {
48 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P7" ) , 0 , 1 , 0 } , { 49 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P8" ) , 0 , 1 , 0 } , {
50 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P9" ) , 0 , 1 , 0 } , { 51 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P10" ) , 0 , 1 , 0 } ,
{ 52 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P11" ) , 0 , 1 , 0 } , { 53 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P12" ) , 0 , 1 , 0 } ,
{ 54 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P13" ) , 0 , 1 , 0 } , { 55 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P14" ) , 0 , 1 , 0 } ,
{ 56 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P15" ) , 0 , 1 , 0 } , { 57 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P16" ) , 0 , 2 , 0 } ,
{ 58 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P17" ) , 0 , 1 , 0 } , { 59 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P18" ) , 0 , 2 , 0 } ,
{ 60 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P19" ) , 0 , 1 , 0 } , { 61 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P21" ) , 0 , 1 , 0 } ,
{ 62 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P22" ) , 0 , 3 , 0 } , { 63 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P23" ) , 0 , 4 , 0 } ,
{ 64 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P25" ) , 0 , 1 , 0 } , { 65 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P26" ) , 0 , 5 , 0 } ,
{ 66 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P27" ) , 0 , 1 , 0 } , { 67 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P28" ) , 0 , 1 , 0 } ,
{ 68 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P29" ) , 0 , 1 , 0 } , { 69 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P30" ) , 0 , 2 , 0 } ,
{ 70 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P31" ) , 0 , 1 , 0 } , { 71 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P32" ) , 0 , 1 , 0 } ,
{ 72 , TARGET_STRING ( "emulacion_planta/To Instrument" ) , TARGET_STRING (
"P33" ) , 0 , 1 , 0 } , { 73 , TARGET_STRING (
"emulacion_planta/To Instrument" ) , TARGET_STRING ( "P34" ) , 0 , 1 , 0 } ,
{ 74 , TARGET_STRING ( "emulacion_planta/Transfer Fcn" ) , TARGET_STRING (
"A" ) , 0 , 6 , 0 } , { 75 , TARGET_STRING ( "emulacion_planta/Transfer Fcn"
) , TARGET_STRING ( "C" ) , 0 , 7 , 0 } , { 76 , TARGET_STRING (
"emulacion_planta/Unbuffer1" ) , TARGET_STRING ( "ic" ) , 0 , 1 , 0 } , { 77
, TARGET_STRING ( "emulacion_planta/Unbuffer2" ) , TARGET_STRING ( "ic" ) , 0
, 1 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0
} } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . d5zqtfyyrm [ 0 ] , & rtB .
khu4zuqr24 , & rtB . an0aw1ghhl , & rtB . ofhnzvls0r , & rtB . cgjotdlpgl , &
rtP . QueryInstrument_P1 , & rtP . QueryInstrument_P2 , & rtP .
QueryInstrument_P3 , & rtP . QueryInstrument_P4 , & rtP . QueryInstrument_P5
, & rtP . QueryInstrument_P6 , & rtP . QueryInstrument_P7 , & rtP .
QueryInstrument_P8 , & rtP . QueryInstrument_P9 , & rtP . QueryInstrument_P10
, & rtP . QueryInstrument_P11 , & rtP . QueryInstrument_P12 , & rtP .
QueryInstrument_P13 , & rtP . QueryInstrument_P14 , & rtP .
QueryInstrument_P15 , & rtP . QueryInstrument_P16 [ 0 ] , & rtP .
QueryInstrument_P17 , & rtP . QueryInstrument_P18 [ 0 ] , & rtP .
QueryInstrument_P19 , & rtP . QueryInstrument_P21 , & rtP .
QueryInstrument_P22 [ 0 ] , & rtP . QueryInstrument_P23 [ 0 ] , & rtP .
QueryInstrument_P25 , & rtP . QueryInstrument_P26 [ 0 ] , & rtP .
QueryInstrument_P27 , & rtP . QueryInstrument_P28 , & rtP .
QueryInstrument_P29 , & rtP . QueryInstrument_P30 , & rtP .
QueryInstrument_P31 , & rtP . QueryInstrument_P32 , & rtP .
QueryInstrument_P33 , & rtP . QueryInstrument_P34 , & rtP .
QueryInstrument_P35 [ 0 ] , & rtP . QueryInstrument_P36 , & rtP .
QueryInstrument_P37 , & rtP . QueryInstrument_P38 , & rtP .
QueryInstrument_P39 , & rtP . ToInstrument_P1 , & rtP . ToInstrument_P2 , &
rtP . ToInstrument_P3 , & rtP . ToInstrument_P4 , & rtP . ToInstrument_P5 , &
rtP . ToInstrument_P6 , & rtP . ToInstrument_P7 , & rtP . ToInstrument_P8 , &
rtP . ToInstrument_P9 , & rtP . ToInstrument_P10 , & rtP . ToInstrument_P11 ,
& rtP . ToInstrument_P12 , & rtP . ToInstrument_P13 , & rtP .
ToInstrument_P14 , & rtP . ToInstrument_P15 , & rtP . ToInstrument_P16 [ 0 ]
, & rtP . ToInstrument_P17 , & rtP . ToInstrument_P18 [ 0 ] , & rtP .
ToInstrument_P19 , & rtP . ToInstrument_P21 , & rtP . ToInstrument_P22 [ 0 ]
, & rtP . ToInstrument_P23 [ 0 ] , & rtP . ToInstrument_P25 , & rtP .
ToInstrument_P26 [ 0 ] , & rtP . ToInstrument_P27 , & rtP . ToInstrument_P28
, & rtP . ToInstrument_P29 , & rtP . ToInstrument_P30 [ 0 ] , & rtP .
ToInstrument_P31 , & rtP . ToInstrument_P32 , & rtP . ToInstrument_P33 , &
rtP . ToInstrument_P34 , & rtP . TransferFcn_A [ 0 ] , & rtP . TransferFcn_C
[ 0 ] , & rtP . Unbuffer1_ic , & rtP . Unbuffer2_ic , } ; static int32_T *
rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_MATRIX_COL_MAJOR , 0 , 2 , 0 } , { rtwCAPI_SCALAR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } , {
rtwCAPI_VECTOR , 8 , 2 , 0 } , { rtwCAPI_VECTOR , 10 , 2 , 0 } , {
rtwCAPI_VECTOR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 12 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 2 , 1 , 1 , 1 , 1 , 9 , 1 , 15 , 1 , 3
, 1 , 7 , 1 , 2 } ; static const real_T rtcapiStoredFloats [ ] = { 0.1 , 0.0
, 0.01 } ; static const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , (
NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] , 3 ,
1 } , { ( const void * ) & rtcapiStoredFloats [ 1 ] , ( const void * ) &
rtcapiStoredFloats [ 1 ] , 0 , 0 } , { ( const void * ) & rtcapiStoredFloats
[ 2 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] , 2 , 0 } , { ( const
void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [
1 ] , 3 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { {
rtBlockSignals , 5 , rtRootInputs , 0 , rtRootOutputs , 0 } , {
rtBlockParameters , 73 , rtModelParameters , 0 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 4105250154U , 987030450U , 1680989255U ,
1742817734U } , ( NULL ) , 0 , 0 } ; const rtwCAPI_ModelMappingStaticInfo *
emulacion_planta_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void emulacion_planta_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( (
* rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void emulacion_planta_host_InitializeDataMapInfo (
emulacion_planta_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
