;/**************************************************************************/
;/*                                                                        */
;/*       Copyright (c) Microsoft Corporation. All rights reserved.        */
;/*                                                                        */
;/**************************************************************************/
;
;
;/**************************************************************************/
;/**************************************************************************/
;/**                                                                       */
;/** ThreadX Component                                                     */
;/**                                                                       */
;/**   Thread                                                              */
;/**                                                                       */
;/**************************************************************************/
;/**************************************************************************/
;
;#define TX_SOURCE_CODE
;
;
;/* Include necessary system files.  */
;
;#include "tx_api.h"
;#include "tx_thread.h"
;
;
    AREA ||.text||, CODE, READONLY
;/**************************************************************************/
;/*                                                                        */
;/*  FUNCTION                                               RELEASE        */
;/*                                                                        */
;/*    _tx_thread_interrupt_control                      Cortex-M4/AC5     */
;/*                                                           6.0.1        */
;/*  AUTHOR                                                                */
;/*                                                                        */
;/*    William E. Lamie, Microsoft Corporation                             */
;/*                                                                        */
;/*  DESCRIPTION                                                           */
;/*                                                                        */
;/*    This function is responsible for changing the interrupt lockout     */
;/*    posture of the system.                                              */
;/*                                                                        */
;/*  INPUT                                                                 */
;/*                                                                        */
;/*    new_posture                           New interrupt lockout posture */
;/*                                                                        */
;/*  OUTPUT                                                                */
;/*                                                                        */
;/*    old_posture                           Old interrupt lockout posture */
;/*                                                                        */
;/*  CALLS                                                                 */
;/*                                                                        */
;/*    None                                                                */
;/*                                                                        */
;/*  CALLED BY                                                             */
;/*                                                                        */
;/*    Application Code                                                    */
;/*                                                                        */
;/*  RELEASE HISTORY                                                       */
;/*                                                                        */
;/*    DATE              NAME                      DESCRIPTION             */
;/*                                                                        */
;/*  06-30-2020     William E. Lamie         Initial Version 6.0.1         */
;/*                                                                        */
;/**************************************************************************/
;UINT   _tx_thread_interrupt_control(UINT new_posture)
;{
    EXPORT  _tx_thread_interrupt_control
_tx_thread_interrupt_control
;
;    /* Pickup current interrupt lockout posture.  */
;
    MRS     r1, PRIMASK
    MSR     PRIMASK, r0
    MOV     r0, r1
    BX      lr
;
;}
    END
    
