/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLHHMBtf.aml, Sun Sep  9 09:03:08 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001D2 (466)
 *     Revision         0x01
 *     Checksum         0xC9
 *     OEM ID           "andres"
 *     OEM Table ID     "am89hd61"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 1, "kai", "am89hd61", 0x00003000)
{
    External (_SB_.PCI0.HDAS, DeviceObj)    // (from opcode)
    
    Method (_SB.PCI0.HDAS._DSM, 4, NotSerialized)
    {
        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "layout-id", Buffer() { 27, 0x00, 0x00, 0x00 },
            "hda-gfx", Buffer() { "onboard-1" },
            "PinConfigurations", Buffer() { },
            //"MaximumBootBeepVolume", 77,
        })   
    }

    Name (_SB.PCI0.HDAS.RMCF, Package (0x02)
    {
        "CodecCommander", 
        Package (0x04)
        {
            "Perform Reset", 
            ">n", 
            "Perform Reset on External Wake", 
            ">n"
        }
    })
               
    Method (_SB.PCI0.RP01.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LNot (Arg2))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package (0x06)
        {
            "name", 
            Buffer (0x09)
            {
                "#display"
            }, 

            "IOName", 
            Buffer (0x09)
            {
                "#display"
            }, 

            "class-code", 
            Buffer (0x04)
            {
                 0xFF, 0xFF, 0xFF, 0xFF                         
            }
        })
    }
}