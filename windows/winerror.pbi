;winerror.pbi

#FACILITY_XPS =                    82
#FACILITY_WINRM  =                 51
#FACILITY_WINDOWSUPDATE  =         36
#FACILITY_WINDOWS_DEFENDER  =      80
#FACILITY_WINDOWS_CE  =            24
#FACILITY_WINDOWS  =               8
#FACILITY_USERMODE_VOLMGR  =       56
#FACILITY_USERMODE_VIRTUALIZATION =55
#FACILITY_USERMODE_VHD  =          58
#FACILITY_URT       =              19
#FACILITY_UMI    =                 22
#FACILITY_UI   =                   42
#FACILITY_TPM_SOFTWARE  =          41
#FACILITY_TPM_SERVICES    =        40
#FACILITY_SXS =                    23
#FACILITY_STORAGE   =              3
#FACILITY_STATE_MANAGEMENT =       34
#FACILITY_SSPI   =                 9
#FACILITY_SCARD   =                16
#FACILITY_SHELL   =                39
#FACILITY_SETUPAPI  =              15
#FACILITY_SECURITY  =              9
#FACILITY_SDIAG   =                60
#FACILITY_RPC  =                   1
#FACILITY_RAS   =                  83
#FACILITY_PLA  =                   48
#FACILITY_OPC  =                   81
#FACILITY_WIN32 =                  7
#FACILITY_CONTROL  =               10
#FACILITY_WEBSERVICES  =           61
#FACILITY_NULL  =                  0
#FACILITY_NDIS    =                52
#FACILITY_METADIRECTORY  =         35
#FACILITY_MSMQ   =                 14
#FACILITY_MEDIASERVER  =           13
#FACILITY_MBN   =                  84
#FACILITY_INTERNET  =              12
#FACILITY_ITF     =                4
#FACILITY_USERMODE_HYPERVISOR =    53
#FACILITY_HTTP  =                  25
#FACILITY_GRAPHICS  =              38
#FACILITY_FWP   =                  50
#FACILITY_FVE   =                  49
#FACILITY_USERMODE_FILTER_MANAGER =31
#FACILITY_DPLAY  =                 21
#FACILITY_DISPATCH   =             2
#FACILITY_DIRECTORYSERVICE  =      37
#FACILITY_CONFIGURATION  =         33
#FACILITY_COMPLUS   =              17
#FACILITY_USERMODE_COMMONLOG  =    26
#FACILITY_CMI    =                 54
#FACILITY_CERT   =                 11
#FACILITY_BCD   =                  57
#FACILITY_BACKGROUNDCOPY  =        32
#FACILITY_ACS   =                  20
#FACILITY_AAF  =                   18

Macro MAKE_HRESULT(sev, fac, code)
	((((sev)<<31) | ((fac)<<16) | ((code))))
EndMacro

Procedure HRESULT_FROM_WIN32(x.l) 
	If x <= 0
		ProcedureReturn x
	
	Else
		ProcedureReturn  ((x & $0000FFFF) | (#FACILITY_WIN32 << 16) | $80000000)
	EndIf 
EndProcedure
 
