/* Copyright 2013 JP Norair
  *
  * Licensed under the OpenTag License, Version 1.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  * http://www.indigresso.com/wiki/doku.php?id=opentag:license_1_0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *

NOTE: This works with older versions of RIDE and arm-gcc.  It is for versions
prior to 7.50, which is from 09/2014.

If you are building with RIDE, you can make sure the project looks for this
linker script at the following location:
$(ApplicationDir)/../../_common/linker/stm32l1xx_128_16.ld

Default linker script for STM32L1xx with 128KB Flash + 16KB SRAM + 4KB EEPROM

DETAILS
- Declares 192B stack, although this is only used for Kernel Tasks.  ISRs and
    threads have their own stacks, allocated in OpenTag configuration.  Assume
    another 256B for the ISR stack and at least 160B per thread.

*/



/* DEFAULT STACK SIZES: 
   used by the startup in order to allocate stacks for the different modes.
*/
__Stack_Size = 192 ;
PROVIDE ( _Stack_Size = __Stack_Size ) ;
__Stack_Init = _estack  - __Stack_Size ;


/*"PROVIDE" allows to overriding these values from an object file or the commmand line.*/
PROVIDE ( _Stack_Init = __Stack_Init ) ;


/* There will be a link error if there is not this amount of RAM free at the end. */
_Minimum_Stack_Size = 0x100 ;



/* Send all unreferenced IRQHandlers to reset */

PROVIDE (   Undefined_Handler = 0 ) ;
PROVIDE (   NMI_Handler = 0 ) ;
PROVIDE (   HardFault_Handler = 0 ) ;
PROVIDE (   MemManage_Handler = 0 ) ;
PROVIDE (   BusFault_Handler = 0 ) ;
PROVIDE (   UsageFault_Handler = 0 ) ;

PROVIDE (   SVC_Handler = 0 ) ;
PROVIDE (   DebugMon_Handler = 0 ) ;
PROVIDE (   PendSV_Handler = 0 ) ;
PROVIDE (   SysTick_Handler = 0 ) ;

PROVIDE (   WWDG_IRQHandler = 0 ) ;
PROVIDE (   PVD_IRQHandler = 0 ) ;
PROVIDE (   TAMPER_STAMP_IRQHandler = 0 ) ;
PROVIDE (   RTC_WKUP_IRQHandler = 0 ) ;
PROVIDE (   FLASH_IRQHandler = 0 ) ;
PROVIDE (   RCC_IRQHandler = 0 ) ;
PROVIDE (   EXTI0_IRQHandler = 0 ) ;
PROVIDE (   EXTI1_IRQHandler = 0 ) ;
PROVIDE (   EXTI2_IRQHandler = 0 ) ;
PROVIDE (   EXTI3_IRQHandler = 0 ) ;
PROVIDE (   EXTI4_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel1_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel2_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel3_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel4_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel5_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel6_IRQHandler = 0 ) ;
PROVIDE (   DMA1_Channel7_IRQHandler = 0 ) ;
PROVIDE (   ADC1_IRQHandler = 0 ) ;
PROVIDE (   USB_HP_IRQHandler = 0 ) ;
PROVIDE (   USB_LP_IRQHandler = 0 ) ;
PROVIDE (   DAC_IRQHandler = 0 ) ;
PROVIDE (   COMP_IRQHandler = 0 ) ;
PROVIDE (   EXTI9_5_IRQHandler = 0 ) ;
PROVIDE (   TIM9_IRQHandler = 0 ) ;
PROVIDE (   TIM10_IRQHandler = 0 ) ;
PROVIDE (   TIM11_IRQHandler = 0 ) ;
PROVIDE (   TIM2_IRQHandler = 0 ) ;
PROVIDE (   TIM3_IRQHandler = 0 ) ;
PROVIDE (   TIM4_IRQHandler = 0 ) ;
PROVIDE (   I2C1_EV_IRQHandler = 0 ) ;
PROVIDE (   I2C1_ER_IRQHandler = 0 ) ;
PROVIDE (   I2C2_EV_IRQHandler = 0 ) ;
PROVIDE (   I2C2_ER_IRQHandler = 0 ) ;
PROVIDE (   SPI1_IRQHandler = 0 ) ;
PROVIDE (   SPI2_IRQHandler = 0 ) ;
PROVIDE (   USART1_IRQHandler = 0 ) ;
PROVIDE (   USART2_IRQHandler = 0 ) ;
PROVIDE (   USART3_IRQHandler = 0 ) ;
PROVIDE (   EXTI15_10_IRQHandler = 0 ) ;
PROVIDE (   RTC_Alarm_IRQHandler = 0 ) ;
PROVIDE (   USB_FS_WKUP_IRQHandler = 0 ) ;
PROVIDE (   TIM6_IRQHandler = 0 ) ;
PROVIDE (   TIM7_IRQHandler = 0 );




/******************************************************************************/
/*                       Peripheral memory map                                */
/******************************************************************************/
/*this allows to compile the ST lib in "non-debug" mode*/


/* Peripheral and SRAM base address in the alias region */
PERIPH_BB_BASE        = 0x42000000;
SRAM_BB_BASE          = 0x22000000;

/* Peripheral and SRAM base address in the bit-band region */
SRAM_BASE             = 0x20000000;
PERIPH_BASE           = 0x40000000;

/* Flash registers base address */
PROVIDE ( FLASH_BASE            = 0x40023C00);
/* Flash Option Bytes base address */
PROVIDE ( OB_BASE               = 0x1FF80000);

/* Peripheral memory map */
APB1PERIPH_BASE      = PERIPH_BASE  ;
APB2PERIPH_BASE      = (PERIPH_BASE + 0x10000) ;
AHBPERIPH_BASE       = (PERIPH_BASE + 0x20000) ;

PROVIDE ( TIM2            = (APB1PERIPH_BASE + 0x0000) ) ;
PROVIDE ( TIM3            = (APB1PERIPH_BASE + 0x0400) ) ;
PROVIDE ( TIM4            = (APB1PERIPH_BASE + 0x0800) ) ;
PROVIDE ( TIM6            = (APB1PERIPH_BASE + 0x1000) ) ;
PROVIDE ( TIM7            = (APB1PERIPH_BASE + 0x1400) ) ;
PROVIDE ( LCD             = (APB1PERIPH_BASE + 0x2400) ) ;
PROVIDE ( RTC             = (APB1PERIPH_BASE + 0x2800) ) ;
PROVIDE ( WWDG            = (APB1PERIPH_BASE + 0x2C00) ) ;
PROVIDE ( IWDG            = (APB1PERIPH_BASE + 0x3000) ) ;
PROVIDE ( SPI2            = (APB1PERIPH_BASE + 0x3800) ) ;
PROVIDE ( USART2          = (APB1PERIPH_BASE + 0x4400) ) ;
PROVIDE ( USART3          = (APB1PERIPH_BASE + 0x4800) ) ;
PROVIDE ( I2C1            = (APB1PERIPH_BASE + 0x5400) ) ;
PROVIDE ( I2C2            = (APB1PERIPH_BASE + 0x5800) ) ;
PROVIDE ( PWR             = (APB1PERIPH_BASE + 0x7000) ) ;
PROVIDE ( DAC             = (APB1PERIPH_BASE + 0x7400) ) ;
PROVIDE ( COMP            = (APB1PERIPH_BASE + 0x7C00) ) ;
PROVIDE ( RI              = (APB1PERIPH_BASE + 0x7C04) ) ;

PROVIDE ( SYSCFG          = (APB2PERIPH_BASE + 0x0000) ) ;
PROVIDE ( EXTI            = (APB2PERIPH_BASE + 0x0400) ) ;
PROVIDE ( TIM9            = (APB2PERIPH_BASE + 0x0800) ) ;
PROVIDE ( TIM10           = (APB2PERIPH_BASE + 0x0C00) ) ;
PROVIDE ( TIM11           = (APB2PERIPH_BASE + 0x1000) ) ;
PROVIDE ( ADC1            = (APB2PERIPH_BASE + 0x2400) ) ;
PROVIDE ( ADC             = (APB2PERIPH_BASE + 0x2700) ) ;
PROVIDE ( TIM1            = (APB2PERIPH_BASE + 0x2C00) ) ;
PROVIDE ( SPI1            = (APB2PERIPH_BASE + 0x3000) ) ;
PROVIDE ( USART1          = (APB2PERIPH_BASE + 0x3800) ) ;

PROVIDE ( GPIOA           = (AHBPERIPH_BASE + 0x0000) ) ;
PROVIDE ( GPIOB			  = (AHBPERIPH_BASE + 0x0400) ) ;
PROVIDE ( GPIOC			  = (AHBPERIPH_BASE + 0x0800) ) ;
PROVIDE ( GPIOD			  = (AHBPERIPH_BASE + 0x0C00) ) ;
PROVIDE ( GPIOE			  = (AHBPERIPH_BASE + 0x1000) ) ;
PROVIDE ( GPIOF    		  = (AHBPERIPH_BASE + 0x1400) ) ;
PROVIDE ( CRC    		  = (AHBPERIPH_BASE + 0x3000) ) ;
PROVIDE ( RCC             = (AHBPERIPH_BASE + 0x3800) ) ;

DMA1_BASE            = (AHBPERIPH_BASE + 0x6000);

PROVIDE ( DMA_Channel1    = (DMA1_BASE + 0x0008) ) ;
PROVIDE ( DMA_Channel2    = (DMA1_BASE + 0x001C) ) ;
PROVIDE ( DMA_Channel3    = (DMA1_BASE + 0x0030) ) ;
PROVIDE ( DMA_Channel4    = (DMA1_BASE + 0x0044) ) ;
PROVIDE ( DMA_Channel5    = (DMA1_BASE + 0x0058) ) ;
PROVIDE ( DMA_Channel6    = (DMA1_BASE + 0x006C) ) ;
PROVIDE ( DMA_Channel7    = (DMA1_BASE + 0x0080) ) ;

/* System Control Space memory map */
SCS_BASE              = 0xE000E000;

PROVIDE ( SysTick         = (SCS_BASE + 0x0010) ) ;
PROVIDE ( NVIC            = (SCS_BASE + 0x0100) ) ;
PROVIDE ( SCB             = (SCS_BASE + 0x0D00) ) ;







/* MEMORY MAPPING 
 * Uses 4KB EEPROM for data
 */

MEMORY
{
  RAM (xrw)        : ORIGIN = 0x20000000, LENGTH = 0x4000
  
  FLASH (rx)       : ORIGIN = 0x08000000, LENGTH = 0x20000 
  
  FLASHOV (r)      : ORIGIN = 0x08080000, LENGTH = 0x360
  FLASHISFS (r)    : ORIGIN = 0x08080360, LENGTH = 0xA0
/*FLASHGFB (r)     : ORIGIN = 0x08080400, LENGTH = 0x400*/
  FLASHISF (r)     : ORIGIN = 0x08080400, LENGTH = 0xC00
/*FLASHWL (r)      : ORIGIN = 0x08080C00, LENGTH = 0x400*/
  
  EXTMEMB0 (rx)    : ORIGIN = 0x00000000, LENGTH = 0
  EXTMEMB1 (rx)    : ORIGIN = 0x00000000, LENGTH = 0
  EXTMEMB2 (rx)    : ORIGIN = 0x00000000, LENGTH = 0
  EXTMEMB3 (rx)    : ORIGIN = 0x00000000, LENGTH = 0
}


_estack     = ORIGIN(RAM)+LENGTH(RAM);      /* end of the user mode stack */
_sveelite   = ORIGIN(FLASHOV);             /* start of veelite fs */






SECTIONS
{
    /* for Cortex devices, the beginning of the startup code is stored in the .isr_vector section, which goes to FLASH */
    .isr_vector :
    {
	. = ALIGN(4);
        KEEP(*(.isr_vector))            /* Startup code */
	. = ALIGN(4);
    } >FLASH
 
	/* the program code is stored in the .text section, which goes to Flash */
    .text :
    {
	    . = ALIGN(4);
        *(.text)                   /* remaining code */
        *(.text.*)                   /* remaining code */
        *(.rodata)                 /* read-only data (constants) */
        *(.rodata*)
        *(.glue_7)
        *(.glue_7t)
	    . = ALIGN(4);
		
   	    _etext = .;
		
		/* This is used by the startup in order to initialize the .data secion */
   	    _sidata = .;
    } >FLASH  
 
 
	/* VEELITE VWORM FLASH */
    .vl_ov : {
	    . = ALIGN(4);
		KEEP(*(.vl_ov))
	} > FLASHOV
	
	.vl_isfs : {
	    . = ALIGN(4);
		KEEP(*(.vl_isfs))
		. = ALIGN(4);
	} > FLASHISFS
	
/*
	.vl_gfb : {
	    . = ALIGN(4);
		KEEP(*(.vl_gfb))
		. = ALIGN(4);
	} > FLASHGFB
*/
	
	.vl_isf : {
	    . = ALIGN(4);
		KEEP(*(.vl_isf))
		. = ALIGN(4);
	} > FLASHISF
 
 
	/* Fallow blocks: Allocated space for flash wear leveling 
    .vl_fallow :
    {
	    . = ALIGN(4);
		KEEP(*(.vl_fallow))
	    . = ALIGN(4);
		
    } >FLASHWL 
    */
    
    
 /* This is the initialized data section
    The program executes knowing that the data is in the RAM
    but the loader puts the initial values in the FLASH (inidata).
    It is one task of the startup to copy the initial values from FLASH to RAM. */
    .data  : AT ( _sidata )
    {
	    . = ALIGN(4);
        /* This is used by the startup in order to initialize the .data secion */
        _sdata = . ;
        _data = . ;
        
        *(.data)
        *(.data.*)
        *(.RAMtext)

	    . = ALIGN(4);
	    /* This is used by the startup in order to initialize the .data secion */
   	 _edata = . ;
    } >RAM
    
    /*calculate end address of idata*/
    _eidata = _sidata + _edata - _sdata;
    
    /*check that idata remains in FLASH region*/
    _lastdataromaddress = ORIGIN(FLASH) + LENGTH(FLASH);
    toobig = ( _eidata > _lastdataromaddress) ? "!!!!!!!!! FLASH IS FULL !!!!!!!!!" : 0 ;

    

    /* This is the uninitialized data section */
    .bss :
    {
	    . = ALIGN(4);
        /* This is used by the startup in order to initialize the .bss secion */
        _sbss = .;
        _bss = .;
        
        *(.bss)
        *(COMMON)
        
	    . = ALIGN(4);
	    /* This is used by the startup in order to initialize the .bss secion */
   	 _ebss = . ;
    } >RAM
    
    PROVIDE ( end = _ebss );
    PROVIDE ( _end = _ebss );
    
    /* This is the user stack section 
    This is just to check that there is enough RAM left for the User mode stack
    It should generate an error if it's full.
     */
    ._usrstack :
    {
	    . = ALIGN(4);
        _susrstack = . ;
        
        . = . + _Minimum_Stack_Size ;
        
	    . = ALIGN(4);
        _eusrstack = . ;
    } >RAM
    

      
    /* this is the EXTMEM */
    /* the C or assembly source must explicitly place the code or data there
    using the "section" attribute */
    
    /* EXTMEM Bank0 */
    .eb0text :
    {
        *(.eb0text)                   /* remaining code */
        *(.eb0rodata)                 /* read-only data (constants) */
        *(.eb0rodata*)
    } >EXTMEMB0
    
    /* EXTMEM Bank1 */
    .eb1text :
    {
        *(.eb1text)                   /* remaining code */
        *(.eb1rodata)                 /* read-only data (constants) */
        *(.eb1rodata*)
    } >EXTMEMB1
    
    /* EXTMEM Bank2 */
    .eb2text :
    {
        *(.eb2text)                   /* remaining code */
        *(.eb2rodata)                 /* read-only data (constants) */
        *(.eb2rodata*)
    } >EXTMEMB2
    
    /* EXTMEM Bank0 */
    .eb3text :
    {
        *(.eb3text)                   /* remaining code */
        *(.eb3rodata)                 /* read-only data (constants) */
        *(.eb3rodata*)
    } >EXTMEMB3
    
    __exidx_start = .;
    __exidx_end = .;
    
    /* after that it's only debugging information. */
    
    
    
    
    /* remove the debugging information from the standard libraries */
    /DISCARD/ :
    {
     libc.a ( * )
     libm.a ( * )
     libgcc.a ( * )
     }

    /* Stabs debugging sections.  */
    .stab          0 : { *(.stab) }
    .stabstr       0 : { *(.stabstr) }
    .stab.excl     0 : { *(.stab.excl) }
    .stab.exclstr  0 : { *(.stab.exclstr) }
    .stab.index    0 : { *(.stab.index) }
    .stab.indexstr 0 : { *(.stab.indexstr) }
    .comment       0 : { *(.comment) }
    /* DWARF debug sections.
       Symbols in the DWARF debugging sections are relative to the beginning
       of the section so we begin them at 0.  */
    /* DWARF 1 */
    .debug          0 : { *(.debug) }
    .line           0 : { *(.line) }
    /* GNU DWARF 1 extensions */
    .debug_srcinfo  0 : { *(.debug_srcinfo) }
    .debug_sfnames  0 : { *(.debug_sfnames) }
    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    /* DWARF 2 */
    .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }
}
