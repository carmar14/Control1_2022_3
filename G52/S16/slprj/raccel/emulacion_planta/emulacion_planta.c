#include "rt_logging_mmi.h"
#include "emulacion_planta_capi.h"
#include <math.h>
#include "emulacion_planta.h"
#include "emulacion_planta_private.h"
#include "emulacion_planta_dt.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 4 , & stopRequested ) ; }
rtExtModeShutdown ( 4 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 4 ; const char_T
* gbl_raccel_Version = "9.4 (R2020b) 29-Jul-2020" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const int_T gblNumRootInportBlks = 0 ; const int_T
gblNumModelInputs = 0 ; extern const char * gblInportFileName ; extern
rtInportTUtable * gblInportTUtables ; const int_T gblInportDataTypeIdx [ ] =
{ - 1 } ; const int_T gblInportDims [ ] = { - 1 } ; const int_T
gblInportComplex [ ] = { - 1 } ; const int_T gblInportInterpoFlag [ ] = { - 1
} ; const int_T gblInportContinuous [ ] = { - 1 } ; int_T enableFcnCallFlag [
] = { 1 , 1 , 1 , 1 } ; const char * raccelLoadInputsAndAperiodicHitTimes (
SimStruct * S , const char * inportFileName , int * matFileFormat ) { return
rt_RAccelReadInportsMatFile ( S , inportFileName , matFileFormat ) ; } B rtB
; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS = &
model_S ; void MdlInitialize ( void ) { rtX . cn5nnkmax5 [ 0 ] = 0.0 ; rtX .
cn5nnkmax5 [ 1 ] = 0.0 ; } void MdlStart ( void ) { { bool
externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} { static int_T rt_ToWksWidths [ ] = { 2 } ; static int_T
rt_ToWksNumDimensions [ ] = { 1 } ; static int_T rt_ToWksDimensions [ ] = { 2
} ; static boolean_T rt_ToWksIsVarDims [ ] = { 0 } ; static void *
rt_ToWksCurrSigDims [ ] = { ( NULL ) } ; static int_T rt_ToWksCurrSigDimsSize
[ ] = { 4 } ; static BuiltInDTypeId rt_ToWksDataTypeIds [ ] = { SS_DOUBLE } ;
static int_T rt_ToWksComplexSignals [ ] = { 0 } ; static int_T
rt_ToWksFrameData [ ] = { 0 } ; static RTWPreprocessingFcnPtr
rt_ToWksLoggingPreprocessingFcnPtrs [ ] = { ( NULL ) } ; static const char_T
* rt_ToWksLabels [ ] = { "" } ; static RTWLogSignalInfo rt_ToWksSignalInfo =
{ 1 , rt_ToWksWidths , rt_ToWksNumDimensions , rt_ToWksDimensions ,
rt_ToWksIsVarDims , rt_ToWksCurrSigDims , rt_ToWksCurrSigDimsSize ,
rt_ToWksDataTypeIds , rt_ToWksComplexSignals , rt_ToWksFrameData ,
rt_ToWksLoggingPreprocessingFcnPtrs , { rt_ToWksLabels } , ( NULL ) , ( NULL
) , ( NULL ) , { ( NULL ) } , { ( NULL ) } , ( NULL ) , ( NULL ) } ; static
const char_T rt_ToWksBlockName [ ] = "emulacion_planta/To Workspace" ; rtDW .
eqdtbg2zr2 . LoggedData = rt_CreateStructLogVar ( ssGetRTWLogInfo ( rtS ) ,
ssGetTStart ( rtS ) , ssGetTFinal ( rtS ) , 0.0 , ( & ssGetErrorStatus ( rtS
) ) , "simout" , 1 , 0 , 1 , 0.1 , & rt_ToWksSignalInfo , rt_ToWksBlockName )
; if ( rtDW . eqdtbg2zr2 . LoggedData == ( NULL ) ) return ; ssCachePointer (
rtS , & ( rtDW . eqdtbg2zr2 . LoggedData ) ) ; } { SimStruct * rts =
ssGetSFunction ( rtS , 0 ) ; sfcnStart ( rts ) ; if ( ssGetErrorStatus ( rts
) != ( NULL ) ) return ; } { SimStruct * rts = ssGetSFunction ( rtS , 1 ) ;
sfcnStart ( rts ) ; if ( ssGetErrorStatus ( rts ) != ( NULL ) ) return ; }
MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { rtB . khu4zuqr24 = 0.0
; rtB . khu4zuqr24 += rtP . TransferFcn_C [ 0 ] * rtX . cn5nnkmax5 [ 0 ] ;
rtB . khu4zuqr24 += rtP . TransferFcn_C [ 1 ] * rtX . cn5nnkmax5 [ 1 ] ; if (
ssIsSampleHit ( rtS , 3 , 0 ) ) { { SimStruct * rts = ssGetSFunction ( rtS ,
0 ) ; sfcnOutputs ( rts , 0 ) ; } rtB . cgjotdlpgl = rtB . d5zqtfyyrm [ 1 ] ;
} if ( ssIsSampleHit ( rtS , 3 , 0 ) ) { rtB . ofhnzvls0r = rtB . d5zqtfyyrm
[ 0 ] ; } if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { { SimStruct * rts =
ssGetSFunction ( rtS , 1 ) ; sfcnOutputs ( rts , 0 ) ; } } if ( ssIsSampleHit
( rtS , 3 , 0 ) ) { rtB . bb25dg3ui1 [ 0 ] = rtB . cgjotdlpgl ; rtB .
bb25dg3ui1 [ 1 ] = rtB . khu4zuqr24 ; { double locTime = ssGetTaskTime ( rtS
, 3 ) ; ; if ( ssGetLogOutput ( rtS ) ) { { if ( rtwTimeInLoggingInterval (
rtliGetLoggingInterval ( ssGetRootSS ( rtS ) -> mdlInfo -> rtwLogInfo ) ,
locTime ) ) { rt_UpdateStructLogVar ( ( StructLogVar * ) rtDW . eqdtbg2zr2 .
LoggedData , & locTime , & rtB . bb25dg3ui1 [ 0 ] ) ; } } } } } if (
ssIsSampleHit ( rtS , 2 , 0 ) ) { rtB . an0aw1ghhl = rtB . ofhnzvls0r ; }
UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) { UNUSED_PARAMETER
( tid ) ; } void MdlDerivatives ( void ) { XDot * _rtXdot ; _rtXdot = ( (
XDot * ) ssGetdX ( rtS ) ) ; _rtXdot -> cn5nnkmax5 [ 0 ] = 0.0 ; _rtXdot ->
cn5nnkmax5 [ 0 ] += rtP . TransferFcn_A [ 0 ] * rtX . cn5nnkmax5 [ 0 ] ;
_rtXdot -> cn5nnkmax5 [ 1 ] = 0.0 ; _rtXdot -> cn5nnkmax5 [ 0 ] += rtP .
TransferFcn_A [ 1 ] * rtX . cn5nnkmax5 [ 1 ] ; _rtXdot -> cn5nnkmax5 [ 1 ] +=
rtX . cn5nnkmax5 [ 0 ] ; _rtXdot -> cn5nnkmax5 [ 0 ] += rtB . an0aw1ghhl ; }
void MdlProjection ( void ) { } void MdlTerminate ( void ) { { SimStruct *
rts = ssGetSFunction ( rtS , 0 ) ; sfcnTerminate ( rts ) ; } { SimStruct *
rts = ssGetSFunction ( rtS , 1 ) ; sfcnTerminate ( rts ) ; } } void
MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 2 ) ;
ssSetNumPeriodicContStates ( rtS , 0 ) ; ssSetNumY ( rtS , 0 ) ; ssSetNumU (
rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ; ssSetNumSampleTimes ( rtS ,
4 ) ; ssSetNumBlocks ( rtS , 11 ) ; ssSetNumBlockIO ( rtS , 6 ) ;
ssSetNumBlockParams ( rtS , 313 ) ; } void MdlInitializeSampleTimes ( void )
{ ssSetSampleTime ( rtS , 0 , 0.0 ) ; ssSetSampleTime ( rtS , 1 , 0.0 ) ;
ssSetSampleTime ( rtS , 2 , 0.01 ) ; ssSetSampleTime ( rtS , 3 , 0.1 ) ;
ssSetOffsetTime ( rtS , 0 , 0.0 ) ; ssSetOffsetTime ( rtS , 1 , 1.0 ) ;
ssSetOffsetTime ( rtS , 2 , 0.0 ) ; ssSetOffsetTime ( rtS , 3 , 0.0 ) ; }
void raccel_set_checksum ( ) { ssSetChecksumVal ( rtS , 0 , 4105250154U ) ;
ssSetChecksumVal ( rtS , 1 , 987030450U ) ; ssSetChecksumVal ( rtS , 2 ,
1680989255U ) ; ssSetChecksumVal ( rtS , 3 , 1742817734U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; ( void ) memset ( ( char * ) rtS , 0 ,
sizeof ( SimStruct ) ) ; ( void ) memset ( ( char * ) & mdlInfo , 0 , sizeof
( struct _ssMdlInfo ) ) ; ssSetMdlInfoPtr ( rtS , & mdlInfo ) ;
ssSetExecutionInfo ( rtS , executionInfo ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ssSetWorkSizeInBytes ( rtS , sizeof ( rtB ) ,
"BlockIO" ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof ( B ) ) ; }
{ real_T * x = ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ; ( void )
memset ( ( void * ) x , 0 , sizeof ( X ) ) ; } { void * dwork = ( void * ) &
rtDW ; ssSetRootDWork ( rtS , dwork ) ; ssSetWorkSizeInBytes ( rtS , sizeof (
rtDW ) , "DWork" ) ; ( void ) memset ( dwork , 0 , sizeof ( DW ) ) ; } {
static DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) & dtInfo , 0
, sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ; dtInfo .
numDataTypes = 14 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ] ; dtInfo
. dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = &
rtBTransTable ; dtInfo . PTransTable = & rtPTransTable ; dtInfo .
dataTypeInfoTable = rtDataTypeInfoTable ; }
emulacion_planta_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive (
rtS , true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "emulacion_planta" ) ;
ssSetPath ( rtS , "emulacion_planta" ) ; ssSetTStart ( rtS , 0.0 ) ;
ssSetTFinal ( rtS , rtInf ) ; { static RTWLogInfo rt_DataLoggingInfo ;
rt_DataLoggingInfo . loggingInterval = NULL ; ssSetRTWLogInfo ( rtS , &
rt_DataLoggingInfo ) ; } { { static int_T rt_LoggedStateWidths [ ] = { 2 } ;
static int_T rt_LoggedStateNumDimensions [ ] = { 1 } ; static int_T
rt_LoggedStateDimensions [ ] = { 2 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 } ; static BuiltInDTypeId
rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE } ; static int_T
rt_LoggedStateComplexSignals [ ] = { 0 } ; static RTWPreprocessingFcnPtr
rt_LoggingStatePreprocessingFcnPtrs [ ] = { ( NULL ) } ; static const char_T
* rt_LoggedStateLabels [ ] = { "CSTATE" } ; static const char_T *
rt_LoggedStateBlockNames [ ] = { "emulacion_planta/Transfer Fcn" } ; static
const char_T * rt_LoggedStateNames [ ] = { "" } ; static boolean_T
rt_LoggedStateCrossMdlRef [ ] = { 0 } ; static RTWLogDataTypeConvert
rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 ,
1.0 , 0 , 0.0 } } ; static RTWLogSignalInfo rt_LoggedStateSignalInfo = { 1 ,
rt_LoggedStateWidths , rt_LoggedStateNumDimensions , rt_LoggedStateDimensions
, rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert } ; static void *
rt_LoggedStateSignalPtrs [ 1 ] ; rtliSetLogXSignalPtrs ( ssGetRTWLogInfo (
rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . cn5nnkmax5 [ 0 ] ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 2 ] ;
static real_T absTol [ 2 ] = { 1.0E-6 , 1.0E-6 } ; static uint8_T
absTolControl [ 2 ] = { 0U , 0U } ; static real_T
contStateJacPerturbBoundMinVec [ 2 ] ; static real_T
contStateJacPerturbBoundMaxVec [ 2 ] ; static ssNonContDerivSigInfo
nonContDerivSigInfo [ 1 ] = { { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
an0aw1ghhl ) , ( NULL ) } } ; { int i ; for ( i = 0 ; i < 2 ; ++ i ) {
contStateJacPerturbBoundMinVec [ i ] = 0 ; contStateJacPerturbBoundMaxVec [ i
] = rtGetInf ( ) ; } } ssSetSolverRelTol ( rtS , 0.001 ) ; ssSetStepSize (
rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ; ssSetMaxNumMinSteps ( rtS , -
1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ; ssSetMaxStepSize ( rtS , 0.01 )
; ssSetSolverMaxOrder ( rtS , - 1 ) ; ssSetSolverRefineFactor ( rtS , 1 ) ;
ssSetOutputTimes ( rtS , ( NULL ) ) ; ssSetNumOutputTimes ( rtS , 0 ) ;
ssSetOutputTimesOnly ( rtS , 0 ) ; ssSetOutputTimesIndex ( rtS , 0 ) ;
ssSetZCCacheNeedsReset ( rtS , 0 ) ; ssSetDerivCacheNeedsReset ( rtS , 0 ) ;
ssSetNumNonContDerivSigInfos ( rtS , 1 ) ; ssSetNonContDerivSigInfos ( rtS ,
nonContDerivSigInfo ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ;
ssSetSolverName ( rtS , "VariableStepAuto" ) ; ssSetVariableStepSolver ( rtS
, 1 ) ; ssSetSolverConsistencyChecking ( rtS , 0 ) ;
ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ; ssSetSolverRobustResetMethod (
rtS , 0 ) ; ssSetAbsTolVector ( rtS , absTol ) ; ssSetAbsTolControlVector (
rtS , absTolControl ) ; ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetModelDerivatives ( rtS ,
MdlDerivatives ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 4105250154U ) ; ssSetChecksumVal ( rtS , 1 ,
987030450U ) ; ssSetChecksumVal ( rtS , 2 , 1680989255U ) ; ssSetChecksumVal
( rtS , 3 , 1742817734U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 1 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
ssSetNumSFunctions ( rtS , 2 ) ; { static SimStruct childSFunctions [ 2 ] ;
static SimStruct * childSFunctionPtrs [ 2 ] ; ( void ) memset ( ( void * ) &
childSFunctions [ 0 ] , 0 , sizeof ( childSFunctions ) ) ; ssSetSFunctions (
rtS , & childSFunctionPtrs [ 0 ] ) ; ssSetSFunction ( rtS , 0 , &
childSFunctions [ 0 ] ) ; ssSetSFunction ( rtS , 1 , & childSFunctions [ 1 ]
) ; { SimStruct * rts = ssGetSFunction ( rtS , 0 ) ; static time_T sfcnPeriod
[ 1 ] ; static time_T sfcnOffset [ 1 ] ; static int_T sfcnTsMap [ 1 ] ; (
void ) memset ( ( void * ) sfcnPeriod , 0 , sizeof ( time_T ) * 1 ) ; ( void
) memset ( ( void * ) sfcnOffset , 0 , sizeof ( time_T ) * 1 ) ;
ssSetSampleTimePtr ( rts , & sfcnPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rts ,
& sfcnOffset [ 0 ] ) ; ssSetSampleTimeTaskIDPtr ( rts , sfcnTsMap ) ; {
static struct _ssBlkInfo2 _blkInfo2 ; struct _ssBlkInfo2 * blkInfo2 = &
_blkInfo2 ; ssSetBlkInfo2Ptr ( rts , blkInfo2 ) ; } { static struct
_ssPortInfo2 _portInfo2 ; struct _ssPortInfo2 * portInfo2 = & _portInfo2 ;
_ssSetBlkInfo2PortInfo2Ptr ( rts , portInfo2 ) ; } ssSetMdlInfoPtr ( rts ,
ssGetMdlInfoPtr ( rtS ) ) ; { static struct _ssSFcnModelMethods2 methods2 ;
ssSetModelMethods2 ( rts , & methods2 ) ; } { static struct
_ssSFcnModelMethods3 methods3 ; ssSetModelMethods3 ( rts , & methods3 ) ; } {
static struct _ssSFcnModelMethods4 methods4 ; ssSetModelMethods4 ( rts , &
methods4 ) ; } { static struct _ssStatesInfo2 statesInfo2 ; static
ssPeriodicStatesInfo periodicStatesInfo ; static ssJacobianPerturbationBounds
jacPerturbationBounds ; ssSetStatesInfo2 ( rts , & statesInfo2 ) ;
ssSetPeriodicStatesInfo ( rts , & periodicStatesInfo ) ;
ssSetJacobianPerturbationBounds ( rts , & jacPerturbationBounds ) ; } {
static struct _ssPortOutputs outputPortInfo [ 1 ] ; ssSetPortInfoForOutputs (
rts , & outputPortInfo [ 0 ] ) ; _ssSetNumOutputPorts ( rts , 1 ) ; { static
struct _ssOutPortUnit outputPortUnits [ 1 ] ; _ssSetPortInfo2ForOutputUnits (
rts , & outputPortUnits [ 0 ] ) ; } ssSetOutputPortUnit ( rts , 0 , 0 ) ; {
static struct _ssOutPortCoSimAttribute outputPortCoSimAttribute [ 1 ] ;
_ssSetPortInfo2ForOutputCoSimAttribute ( rts , & outputPortCoSimAttribute [ 0
] ) ; } ssSetOutputPortIsContinuousQuantity ( rts , 0 , 0 ) ; { static int_T
dimensions [ 2 ] ; dimensions [ 0 ] = 2 ; dimensions [ 1 ] = 1 ;
_ssSetOutputPortDimensionsPtr ( rts , 0 , dimensions ) ;
_ssSetOutputPortNumDimensions ( rts , 0 , 2 ) ; ssSetOutputPortWidth ( rts ,
0 , 2 ) ; ssSetOutputPortSignal ( rts , 0 , ( ( real_T * ) rtB . d5zqtfyyrm )
) ; } } ssSetModelName ( rts , "Query Instrument" ) ; ssSetPath ( rts ,
"emulacion_planta/Query Instrument" ) ; if ( ssGetRTModel ( rtS ) == ( NULL )
) { ssSetParentSS ( rts , rtS ) ; ssSetRootSS ( rts , ssGetRootSS ( rtS ) ) ;
} else { ssSetRTModel ( rts , ssGetRTModel ( rtS ) ) ; ssSetParentSS ( rts ,
( NULL ) ) ; ssSetRootSS ( rts , rts ) ; } ssSetVersion ( rts ,
SIMSTRUCT_VERSION_LEVEL2 ) ; { static mxArray * sfcnParams [ 39 ] ;
ssSetSFcnParamsCount ( rts , 39 ) ; ssSetSFcnParamsPtr ( rts , & sfcnParams [
0 ] ) ; ssSetSFcnParam ( rts , 0 , ( mxArray * ) rtP .
QueryInstrument_P1_Size ) ; ssSetSFcnParam ( rts , 1 , ( mxArray * ) rtP .
QueryInstrument_P2_Size ) ; ssSetSFcnParam ( rts , 2 , ( mxArray * ) rtP .
QueryInstrument_P3_Size ) ; ssSetSFcnParam ( rts , 3 , ( mxArray * ) rtP .
QueryInstrument_P4_Size ) ; ssSetSFcnParam ( rts , 4 , ( mxArray * ) rtP .
QueryInstrument_P5_Size ) ; ssSetSFcnParam ( rts , 5 , ( mxArray * ) rtP .
QueryInstrument_P6_Size ) ; ssSetSFcnParam ( rts , 6 , ( mxArray * ) rtP .
QueryInstrument_P7_Size ) ; ssSetSFcnParam ( rts , 7 , ( mxArray * ) rtP .
QueryInstrument_P8_Size ) ; ssSetSFcnParam ( rts , 8 , ( mxArray * ) rtP .
QueryInstrument_P9_Size ) ; ssSetSFcnParam ( rts , 9 , ( mxArray * ) rtP .
QueryInstrument_P10_Size ) ; ssSetSFcnParam ( rts , 10 , ( mxArray * ) rtP .
QueryInstrument_P11_Size ) ; ssSetSFcnParam ( rts , 11 , ( mxArray * ) rtP .
QueryInstrument_P12_Size ) ; ssSetSFcnParam ( rts , 12 , ( mxArray * ) rtP .
QueryInstrument_P13_Size ) ; ssSetSFcnParam ( rts , 13 , ( mxArray * ) rtP .
QueryInstrument_P14_Size ) ; ssSetSFcnParam ( rts , 14 , ( mxArray * ) rtP .
QueryInstrument_P15_Size ) ; ssSetSFcnParam ( rts , 15 , ( mxArray * ) rtP .
QueryInstrument_P16_Size ) ; ssSetSFcnParam ( rts , 16 , ( mxArray * ) rtP .
QueryInstrument_P17_Size ) ; ssSetSFcnParam ( rts , 17 , ( mxArray * ) rtP .
QueryInstrument_P18_Size ) ; ssSetSFcnParam ( rts , 18 , ( mxArray * ) rtP .
QueryInstrument_P19_Size ) ; ssSetSFcnParam ( rts , 19 , ( mxArray * ) rtP .
QueryInstrument_P20_Size ) ; ssSetSFcnParam ( rts , 20 , ( mxArray * ) rtP .
QueryInstrument_P21_Size ) ; ssSetSFcnParam ( rts , 21 , ( mxArray * ) rtP .
QueryInstrument_P22_Size ) ; ssSetSFcnParam ( rts , 22 , ( mxArray * ) rtP .
QueryInstrument_P23_Size ) ; ssSetSFcnParam ( rts , 23 , ( mxArray * ) rtP .
QueryInstrument_P24_Size ) ; ssSetSFcnParam ( rts , 24 , ( mxArray * ) rtP .
QueryInstrument_P25_Size ) ; ssSetSFcnParam ( rts , 25 , ( mxArray * ) rtP .
QueryInstrument_P26_Size ) ; ssSetSFcnParam ( rts , 26 , ( mxArray * ) rtP .
QueryInstrument_P27_Size ) ; ssSetSFcnParam ( rts , 27 , ( mxArray * ) rtP .
QueryInstrument_P28_Size ) ; ssSetSFcnParam ( rts , 28 , ( mxArray * ) rtP .
QueryInstrument_P29_Size ) ; ssSetSFcnParam ( rts , 29 , ( mxArray * ) rtP .
QueryInstrument_P30_Size ) ; ssSetSFcnParam ( rts , 30 , ( mxArray * ) rtP .
QueryInstrument_P31_Size ) ; ssSetSFcnParam ( rts , 31 , ( mxArray * ) rtP .
QueryInstrument_P32_Size ) ; ssSetSFcnParam ( rts , 32 , ( mxArray * ) rtP .
QueryInstrument_P33_Size ) ; ssSetSFcnParam ( rts , 33 , ( mxArray * ) rtP .
QueryInstrument_P34_Size ) ; ssSetSFcnParam ( rts , 34 , ( mxArray * ) rtP .
QueryInstrument_P35_Size ) ; ssSetSFcnParam ( rts , 35 , ( mxArray * ) rtP .
QueryInstrument_P36_Size ) ; ssSetSFcnParam ( rts , 36 , ( mxArray * ) rtP .
QueryInstrument_P37_Size ) ; ssSetSFcnParam ( rts , 37 , ( mxArray * ) rtP .
QueryInstrument_P38_Size ) ; ssSetSFcnParam ( rts , 38 , ( mxArray * ) rtP .
QueryInstrument_P39_Size ) ; } ssSetPWork ( rts , ( void * * ) & rtDW .
dbtfgizldg ) ; { static struct _ssDWorkRecord dWorkRecord [ 1 ] ; static
struct _ssDWorkAuxRecord dWorkAuxRecord [ 1 ] ; ssSetSFcnDWork ( rts ,
dWorkRecord ) ; ssSetSFcnDWorkAux ( rts , dWorkAuxRecord ) ; _ssSetNumDWork (
rts , 1 ) ; ssSetDWorkWidth ( rts , 0 , 1 ) ; ssSetDWorkDataType ( rts , 0 ,
SS_POINTER ) ; ssSetDWorkComplexSignal ( rts , 0 , 0 ) ; ssSetDWork ( rts , 0
, & rtDW . dbtfgizldg ) ; } QueryInstrument ( rts ) ; sfcnInitializeSizes (
rts ) ; sfcnInitializeSampleTimes ( rts ) ; ssSetSampleTime ( rts , 0 , 0.1 )
; ssSetOffsetTime ( rts , 0 , 0.0 ) ; sfcnTsMap [ 0 ] = 3 ;
ssSetNumNonsampledZCs ( rts , 0 ) ; _ssSetOutputPortConnected ( rts , 0 , 1 )
; _ssSetOutputPortBeingMerged ( rts , 0 , 0 ) ; } { SimStruct * rts =
ssGetSFunction ( rtS , 1 ) ; static time_T sfcnPeriod [ 1 ] ; static time_T
sfcnOffset [ 1 ] ; static int_T sfcnTsMap [ 1 ] ; ( void ) memset ( ( void *
) sfcnPeriod , 0 , sizeof ( time_T ) * 1 ) ; ( void ) memset ( ( void * )
sfcnOffset , 0 , sizeof ( time_T ) * 1 ) ; ssSetSampleTimePtr ( rts , &
sfcnPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rts , & sfcnOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rts , sfcnTsMap ) ; { static struct _ssBlkInfo2
_blkInfo2 ; struct _ssBlkInfo2 * blkInfo2 = & _blkInfo2 ; ssSetBlkInfo2Ptr (
rts , blkInfo2 ) ; } { static struct _ssPortInfo2 _portInfo2 ; struct
_ssPortInfo2 * portInfo2 = & _portInfo2 ; _ssSetBlkInfo2PortInfo2Ptr ( rts ,
portInfo2 ) ; } ssSetMdlInfoPtr ( rts , ssGetMdlInfoPtr ( rtS ) ) ; { static
struct _ssSFcnModelMethods2 methods2 ; ssSetModelMethods2 ( rts , & methods2
) ; } { static struct _ssSFcnModelMethods3 methods3 ; ssSetModelMethods3 (
rts , & methods3 ) ; } { static struct _ssSFcnModelMethods4 methods4 ;
ssSetModelMethods4 ( rts , & methods4 ) ; } { static struct _ssStatesInfo2
statesInfo2 ; static ssPeriodicStatesInfo periodicStatesInfo ; static
ssJacobianPerturbationBounds jacPerturbationBounds ; ssSetStatesInfo2 ( rts ,
& statesInfo2 ) ; ssSetPeriodicStatesInfo ( rts , & periodicStatesInfo ) ;
ssSetJacobianPerturbationBounds ( rts , & jacPerturbationBounds ) ; } {
static struct _ssPortInputs inputPortInfo [ 1 ] ; _ssSetNumInputPorts ( rts ,
1 ) ; ssSetPortInfoForInputs ( rts , & inputPortInfo [ 0 ] ) ; { static
struct _ssInPortUnit inputPortUnits [ 1 ] ; _ssSetPortInfo2ForInputUnits (
rts , & inputPortUnits [ 0 ] ) ; } ssSetInputPortUnit ( rts , 0 , 0 ) ; {
static struct _ssInPortCoSimAttribute inputPortCoSimAttribute [ 1 ] ;
_ssSetPortInfo2ForInputCoSimAttribute ( rts , & inputPortCoSimAttribute [ 0 ]
) ; } ssSetInputPortIsContinuousQuantity ( rts , 0 , 0 ) ; { static int_T
dimensions [ 2 ] ; ssSetInputPortRequiredContiguous ( rts , 0 , 1 ) ;
ssSetInputPortSignal ( rts , 0 , & rtB . khu4zuqr24 ) ; dimensions [ 0 ] = 1
; dimensions [ 1 ] = 1 ; _ssSetInputPortDimensionsPtr ( rts , 0 , dimensions
) ; _ssSetInputPortNumDimensions ( rts , 0 , 2 ) ; ssSetInputPortWidth ( rts
, 0 , 1 ) ; } } ssSetModelName ( rts , "To Instrument" ) ; ssSetPath ( rts ,
"emulacion_planta/To Instrument" ) ; if ( ssGetRTModel ( rtS ) == ( NULL ) )
{ ssSetParentSS ( rts , rtS ) ; ssSetRootSS ( rts , ssGetRootSS ( rtS ) ) ; }
else { ssSetRTModel ( rts , ssGetRTModel ( rtS ) ) ; ssSetParentSS ( rts , (
NULL ) ) ; ssSetRootSS ( rts , rts ) ; } ssSetVersion ( rts ,
SIMSTRUCT_VERSION_LEVEL2 ) ; { static mxArray * sfcnParams [ 34 ] ;
ssSetSFcnParamsCount ( rts , 34 ) ; ssSetSFcnParamsPtr ( rts , & sfcnParams [
0 ] ) ; ssSetSFcnParam ( rts , 0 , ( mxArray * ) rtP . ToInstrument_P1_Size )
; ssSetSFcnParam ( rts , 1 , ( mxArray * ) rtP . ToInstrument_P2_Size ) ;
ssSetSFcnParam ( rts , 2 , ( mxArray * ) rtP . ToInstrument_P3_Size ) ;
ssSetSFcnParam ( rts , 3 , ( mxArray * ) rtP . ToInstrument_P4_Size ) ;
ssSetSFcnParam ( rts , 4 , ( mxArray * ) rtP . ToInstrument_P5_Size ) ;
ssSetSFcnParam ( rts , 5 , ( mxArray * ) rtP . ToInstrument_P6_Size ) ;
ssSetSFcnParam ( rts , 6 , ( mxArray * ) rtP . ToInstrument_P7_Size ) ;
ssSetSFcnParam ( rts , 7 , ( mxArray * ) rtP . ToInstrument_P8_Size ) ;
ssSetSFcnParam ( rts , 8 , ( mxArray * ) rtP . ToInstrument_P9_Size ) ;
ssSetSFcnParam ( rts , 9 , ( mxArray * ) rtP . ToInstrument_P10_Size ) ;
ssSetSFcnParam ( rts , 10 , ( mxArray * ) rtP . ToInstrument_P11_Size ) ;
ssSetSFcnParam ( rts , 11 , ( mxArray * ) rtP . ToInstrument_P12_Size ) ;
ssSetSFcnParam ( rts , 12 , ( mxArray * ) rtP . ToInstrument_P13_Size ) ;
ssSetSFcnParam ( rts , 13 , ( mxArray * ) rtP . ToInstrument_P14_Size ) ;
ssSetSFcnParam ( rts , 14 , ( mxArray * ) rtP . ToInstrument_P15_Size ) ;
ssSetSFcnParam ( rts , 15 , ( mxArray * ) rtP . ToInstrument_P16_Size ) ;
ssSetSFcnParam ( rts , 16 , ( mxArray * ) rtP . ToInstrument_P17_Size ) ;
ssSetSFcnParam ( rts , 17 , ( mxArray * ) rtP . ToInstrument_P18_Size ) ;
ssSetSFcnParam ( rts , 18 , ( mxArray * ) rtP . ToInstrument_P19_Size ) ;
ssSetSFcnParam ( rts , 19 , ( mxArray * ) rtP . ToInstrument_P20_Size ) ;
ssSetSFcnParam ( rts , 20 , ( mxArray * ) rtP . ToInstrument_P21_Size ) ;
ssSetSFcnParam ( rts , 21 , ( mxArray * ) rtP . ToInstrument_P22_Size ) ;
ssSetSFcnParam ( rts , 22 , ( mxArray * ) rtP . ToInstrument_P23_Size ) ;
ssSetSFcnParam ( rts , 23 , ( mxArray * ) rtP . ToInstrument_P24_Size ) ;
ssSetSFcnParam ( rts , 24 , ( mxArray * ) rtP . ToInstrument_P25_Size ) ;
ssSetSFcnParam ( rts , 25 , ( mxArray * ) rtP . ToInstrument_P26_Size ) ;
ssSetSFcnParam ( rts , 26 , ( mxArray * ) rtP . ToInstrument_P27_Size ) ;
ssSetSFcnParam ( rts , 27 , ( mxArray * ) rtP . ToInstrument_P28_Size ) ;
ssSetSFcnParam ( rts , 28 , ( mxArray * ) rtP . ToInstrument_P29_Size ) ;
ssSetSFcnParam ( rts , 29 , ( mxArray * ) rtP . ToInstrument_P30_Size ) ;
ssSetSFcnParam ( rts , 30 , ( mxArray * ) rtP . ToInstrument_P31_Size ) ;
ssSetSFcnParam ( rts , 31 , ( mxArray * ) rtP . ToInstrument_P32_Size ) ;
ssSetSFcnParam ( rts , 32 , ( mxArray * ) rtP . ToInstrument_P33_Size ) ;
ssSetSFcnParam ( rts , 33 , ( mxArray * ) rtP . ToInstrument_P34_Size ) ; }
ssSetPWork ( rts , ( void * * ) & rtDW . kepkxqm1uv ) ; { static struct
_ssDWorkRecord dWorkRecord [ 1 ] ; static struct _ssDWorkAuxRecord
dWorkAuxRecord [ 1 ] ; ssSetSFcnDWork ( rts , dWorkRecord ) ;
ssSetSFcnDWorkAux ( rts , dWorkAuxRecord ) ; _ssSetNumDWork ( rts , 1 ) ;
ssSetDWorkWidth ( rts , 0 , 1 ) ; ssSetDWorkDataType ( rts , 0 , SS_POINTER )
; ssSetDWorkComplexSignal ( rts , 0 , 0 ) ; ssSetDWork ( rts , 0 , & rtDW .
kepkxqm1uv ) ; } SendInstrument ( rts ) ; sfcnInitializeSizes ( rts ) ;
sfcnInitializeSampleTimes ( rts ) ; ssSetSampleTime ( rts , 0 , 0.0 ) ;
ssSetOffsetTime ( rts , 0 , 1.0 ) ; sfcnTsMap [ 0 ] = 1 ; ssSetInputPortWidth
( rts , 0 , 1 ) ; ssSetInputPortDataType ( rts , 0 , SS_DOUBLE ) ;
ssSetInputPortComplexSignal ( rts , 0 , 0 ) ; ssSetInputPortFrameData ( rts ,
0 , 0 ) ; ssSetInputPortUnit ( rts , 0 , 0 ) ;
ssSetInputPortIsContinuousQuantity ( rts , 0 , 0 ) ; ssSetNumNonsampledZCs (
rts , 0 ) ; _ssSetInputPortConnected ( rts , 0 , 1 ) ;
ssSetInputPortBufferDstPort ( rts , 0 , - 1 ) ; } } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = - 1 ; void MdlOutputsParameterSampleTime
( int_T tid ) { UNUSED_PARAMETER ( tid ) ; }
