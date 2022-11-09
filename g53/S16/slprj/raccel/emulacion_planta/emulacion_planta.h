#ifndef RTW_HEADER_emulacion_planta_h_
#define RTW_HEADER_emulacion_planta_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef emulacion_planta_COMMON_INCLUDES_
#define emulacion_planta_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "sigstream_rtw.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "emulacion_planta_types.h"
#include "multiword_types.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME emulacion_planta
#define NSAMPLE_TIMES (4) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (6) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (2)   
#elif NCSTATES != 2
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T khu4zuqr24 ; real_T d5zqtfyyrm [ 2 ] ; real_T
cgjotdlpgl ; real_T ofhnzvls0r ; real_T bb25dg3ui1 [ 2 ] ; real_T an0aw1ghhl
; } B ; typedef struct { void * dbtfgizldg ; struct { void * LoggedData [ 2 ]
; } fp45fz1qmi ; struct { void * LoggedData ; } fwyevwsda1 ; struct { void *
LoggedData ; } knh530wxrf ; void * kepkxqm1uv ; struct { void * LoggedData ;
} eqdtbg2zr2 ; } DW ; typedef struct { real_T cn5nnkmax5 [ 2 ] ; } X ;
typedef struct { real_T cn5nnkmax5 [ 2 ] ; } XDot ; typedef struct {
boolean_T cn5nnkmax5 [ 2 ] ; } XDis ; typedef struct { real_T cn5nnkmax5 [ 2
] ; } CStateAbsTol ; typedef struct { real_T cn5nnkmax5 [ 2 ] ; } CXPtMin ;
typedef struct { real_T cn5nnkmax5 [ 2 ] ; } CXPtMax ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
TransferFcn_A [ 2 ] ; real_T TransferFcn_C [ 2 ] ; real_T
QueryInstrument_P1_Size [ 2 ] ; real_T QueryInstrument_P1 ; real_T
QueryInstrument_P2_Size [ 2 ] ; real_T QueryInstrument_P2 ; real_T
QueryInstrument_P3_Size [ 2 ] ; real_T QueryInstrument_P3 ; real_T
QueryInstrument_P4_Size [ 2 ] ; real_T QueryInstrument_P4 ; real_T
QueryInstrument_P5_Size [ 2 ] ; real_T QueryInstrument_P5 ; real_T
QueryInstrument_P6_Size [ 2 ] ; real_T QueryInstrument_P6 ; real_T
QueryInstrument_P7_Size [ 2 ] ; real_T QueryInstrument_P7 ; real_T
QueryInstrument_P8_Size [ 2 ] ; real_T QueryInstrument_P8 ; real_T
QueryInstrument_P9_Size [ 2 ] ; real_T QueryInstrument_P9 ; real_T
QueryInstrument_P10_Size [ 2 ] ; real_T QueryInstrument_P10 ; real_T
QueryInstrument_P11_Size [ 2 ] ; real_T QueryInstrument_P11 ; real_T
QueryInstrument_P12_Size [ 2 ] ; real_T QueryInstrument_P12 ; real_T
QueryInstrument_P13_Size [ 2 ] ; real_T QueryInstrument_P13 ; real_T
QueryInstrument_P14_Size [ 2 ] ; real_T QueryInstrument_P14 ; real_T
QueryInstrument_P15_Size [ 2 ] ; real_T QueryInstrument_P15 ; real_T
QueryInstrument_P16_Size [ 2 ] ; real_T QueryInstrument_P16 [ 9 ] ; real_T
QueryInstrument_P17_Size [ 2 ] ; real_T QueryInstrument_P17 ; real_T
QueryInstrument_P18_Size [ 2 ] ; real_T QueryInstrument_P18 [ 9 ] ; real_T
QueryInstrument_P19_Size [ 2 ] ; real_T QueryInstrument_P19 ; real_T
QueryInstrument_P20_Size [ 2 ] ; real_T QueryInstrument_P21_Size [ 2 ] ;
real_T QueryInstrument_P21 ; real_T QueryInstrument_P22_Size [ 2 ] ; real_T
QueryInstrument_P22 [ 15 ] ; real_T QueryInstrument_P23_Size [ 2 ] ; real_T
QueryInstrument_P23 [ 3 ] ; real_T QueryInstrument_P24_Size [ 2 ] ; real_T
QueryInstrument_P25_Size [ 2 ] ; real_T QueryInstrument_P25 ; real_T
QueryInstrument_P26_Size [ 2 ] ; real_T QueryInstrument_P26 [ 7 ] ; real_T
QueryInstrument_P27_Size [ 2 ] ; real_T QueryInstrument_P27 ; real_T
QueryInstrument_P28_Size [ 2 ] ; real_T QueryInstrument_P28 ; real_T
QueryInstrument_P29_Size [ 2 ] ; real_T QueryInstrument_P29 ; real_T
QueryInstrument_P30_Size [ 2 ] ; real_T QueryInstrument_P30 ; real_T
QueryInstrument_P31_Size [ 2 ] ; real_T QueryInstrument_P31 ; real_T
QueryInstrument_P32_Size [ 2 ] ; real_T QueryInstrument_P32 ; real_T
QueryInstrument_P33_Size [ 2 ] ; real_T QueryInstrument_P33 ; real_T
QueryInstrument_P34_Size [ 2 ] ; real_T QueryInstrument_P34 ; real_T
QueryInstrument_P35_Size [ 2 ] ; real_T QueryInstrument_P35 [ 9 ] ; real_T
QueryInstrument_P36_Size [ 2 ] ; real_T QueryInstrument_P36 ; real_T
QueryInstrument_P37_Size [ 2 ] ; real_T QueryInstrument_P37 ; real_T
QueryInstrument_P38_Size [ 2 ] ; real_T QueryInstrument_P38 ; real_T
QueryInstrument_P39_Size [ 2 ] ; real_T QueryInstrument_P39 ; real_T
Unbuffer2_ic ; real_T Unbuffer1_ic ; real_T ToInstrument_P1_Size [ 2 ] ;
real_T ToInstrument_P1 ; real_T ToInstrument_P2_Size [ 2 ] ; real_T
ToInstrument_P2 ; real_T ToInstrument_P3_Size [ 2 ] ; real_T ToInstrument_P3
; real_T ToInstrument_P4_Size [ 2 ] ; real_T ToInstrument_P4 ; real_T
ToInstrument_P5_Size [ 2 ] ; real_T ToInstrument_P5 ; real_T
ToInstrument_P6_Size [ 2 ] ; real_T ToInstrument_P6 ; real_T
ToInstrument_P7_Size [ 2 ] ; real_T ToInstrument_P7 ; real_T
ToInstrument_P8_Size [ 2 ] ; real_T ToInstrument_P8 ; real_T
ToInstrument_P9_Size [ 2 ] ; real_T ToInstrument_P9 ; real_T
ToInstrument_P10_Size [ 2 ] ; real_T ToInstrument_P10 ; real_T
ToInstrument_P11_Size [ 2 ] ; real_T ToInstrument_P11 ; real_T
ToInstrument_P12_Size [ 2 ] ; real_T ToInstrument_P12 ; real_T
ToInstrument_P13_Size [ 2 ] ; real_T ToInstrument_P13 ; real_T
ToInstrument_P14_Size [ 2 ] ; real_T ToInstrument_P14 ; real_T
ToInstrument_P15_Size [ 2 ] ; real_T ToInstrument_P15 ; real_T
ToInstrument_P16_Size [ 2 ] ; real_T ToInstrument_P16 [ 9 ] ; real_T
ToInstrument_P17_Size [ 2 ] ; real_T ToInstrument_P17 ; real_T
ToInstrument_P18_Size [ 2 ] ; real_T ToInstrument_P18 [ 9 ] ; real_T
ToInstrument_P19_Size [ 2 ] ; real_T ToInstrument_P19 ; real_T
ToInstrument_P20_Size [ 2 ] ; real_T ToInstrument_P21_Size [ 2 ] ; real_T
ToInstrument_P21 ; real_T ToInstrument_P22_Size [ 2 ] ; real_T
ToInstrument_P22 [ 15 ] ; real_T ToInstrument_P23_Size [ 2 ] ; real_T
ToInstrument_P23 [ 3 ] ; real_T ToInstrument_P24_Size [ 2 ] ; real_T
ToInstrument_P25_Size [ 2 ] ; real_T ToInstrument_P25 ; real_T
ToInstrument_P26_Size [ 2 ] ; real_T ToInstrument_P26 [ 7 ] ; real_T
ToInstrument_P27_Size [ 2 ] ; real_T ToInstrument_P27 ; real_T
ToInstrument_P28_Size [ 2 ] ; real_T ToInstrument_P28 ; real_T
ToInstrument_P29_Size [ 2 ] ; real_T ToInstrument_P29 ; real_T
ToInstrument_P30_Size [ 2 ] ; real_T ToInstrument_P30 [ 9 ] ; real_T
ToInstrument_P31_Size [ 2 ] ; real_T ToInstrument_P31 ; real_T
ToInstrument_P32_Size [ 2 ] ; real_T ToInstrument_P32 ; real_T
ToInstrument_P33_Size [ 2 ] ; real_T ToInstrument_P33 ; real_T
ToInstrument_P34_Size [ 2 ] ; real_T ToInstrument_P34 ; } ; extern const char
* RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern const rtwCAPI_ModelMappingStaticInfo *
emulacion_planta_GetCAPIStaticMap ( void ) ; extern SimStruct * const rtS ;
extern const int_T gblNumToFiles ; extern const int_T gblNumFrFiles ; extern
const int_T gblNumFrWksBlocks ; extern rtInportTUtable * gblInportTUtables ;
extern const char * gblInportFileName ; extern const int_T
gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern const
int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
