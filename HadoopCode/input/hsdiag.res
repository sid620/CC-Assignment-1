     1	  =========================================================================
     2	                                    ||
     3	  From the files of The Hack Squad: ||  by Lee Jackson, Moderator, FidoNet
     4	                                    ||    Int'l Echos SHAREWRE & WARNINGS
     5	          The Hack Report           ||  Volume 2, Number 5
     6	         File Test Results          ||  Result Report Date: April 10, 1993
     7	                                    ||
     8	  =========================================================================
     9	
    10	  *************************************************************************
    11	  *                                                                       *
    12	  *  The following test was performed by R. Wallace Hale, sysop of the    *
    13	  *      Driftnet BBS, (506) 325-9002.  The results, forwarded by         *
    14	  *    James FitzGibbon (FidoNet 1:250/301) and HW Bill Lambdin, are      *
    15	  *        preliminary.  Thanks to everyone for their assistance.         *
    16	  *                                                                       *
    17	  *************************************************************************
    18	
    19	
    20	                                HSDIAG.ZIP WARNING!!!
    21	                                ~~~~~~~~~~~~~~~~~~~~~
    22	
    23	The file HSDIAG.ZIP, masquerading as a high speed modem diagnostic
    24	utility is a Torjan horse.
    25	
    26	This is a PRELIMINARY report and will be expanded and/or modified
    27	(and probably corrected) in due course.
    28	
    29	I received HSDIAG from Bob Feldman today, and have not had sufficient
    30	time to disassemble HSDIAG.EXE completely, but I have done enough to
    31	determine that the program will overwrite the first 255 sectors on the
    32	first eight drives on a system!
    33	
    34	The Trojan begins with the highest number drive and works downward,
    35	finishing with the floppy diskette in Drive A, if such exists.  In
    36	addition to data loss, the system will no longer be bootable from
    37	the hard drive.
    38	
    39	Error messages are suppressed and once started, the Trojan can NOT
    40	be halted by a Ctrl-C or Ctrl-Break key sequence.
    41	
    42	No virus scanner in my arsenal twigs to the Trojan, nor does
    43	F-PROT 2.07 in heuristic mode find anything suspicious.  This is
    44	not at all surprising, and one shouldn't expect any virus scanner
    45	to provide protection against Trojan programs.
    46	
    47	However, tired old PROGNOSE warns of possible danger.
    48	
    49	The following strings can be found in HSDIAG.EXE:
    50	
    51	     18C:      High Speed Modem Diagnostics
    52	     1B6:              Version 1.0
    53	     1E0:         Sound Blaster Support
    54	     232: )       Written by Bully Bros, Incoporated)
    55	       Please Press [ENTER] To Load Diagnostics,
    56	     287: Please wait ..
    57	     296: ..Loading Done!#Press [ENTER] to Start Diagnostics.
    58	     2CA: Bully Bros.Dallas TX.
    59	     2E0: -Copyrite (C) 1993 Bully Bros. Raj And Asshole
    60	     DF0: #$456789:;<=>?uRuntime error
    61	     E0E:  at
    62	
    63	
    64	The Trojan archive contents are:
    65	
    66	Archive:  HSDIAG.ZIP
    67	
    68	Name          Length    Method     SF   Size now  Mod Date    Time     CRC
    69	============  ========  ========  ====  ========  =========  ======== ========
    70	HSDIAG.EXE        4864  Deflated   34       3172  08 Mar 93  22:03:58 1C84FC4D
    71	FILE_ID.DIZ        245  Deflated    7        228  17 Mar 93  02:02:50 7CF5CBD2
    72	HSDIAG1.DAT      17264  Deflated   36      11044  27 Nov 92  13:47:34 46B34F7D
    73	HSDIAG2.DAT       7121  Deflated   57       3012  27 Nov 92  13:47:34 7127D2C7
    74	HELP.DAT          4064  Deflated   31       2802  27 Nov 92  13:47:34 6FD0DD60
    75	UART1.DAT         5872  Deflated   39       3542  27 Nov 92  13:47:34 AFB5E3CE
    76	HSDIAG3.DAT       2848  Deflated   50       1404  27 Nov 92  13:47:34 0089171B
    77	============  ========  ========  ====  ========  =========  ======== ========
    78	*total     7     42278  ZIP 2.0    38%     26706  10 Apr 93  11:23:42
    79	
    80	All executables in the archive appear to have been written with
    81	Borland's Turbo Pascal, version 4.0 or higher.  Since I am not a
    82	Pascal programmer, I can't really be certain on this point.
    83	
    84	I am absolutely certain that all of the .DAT files were taken from
    85	Joseph Sheppard's ATSEND v.1.8 and have merely been renamed.  The
    86	contents of ATSEND18.ZIP are listed below, and I have done a
    87	byte-by-byte comparison of the .DAT files from the hack with the
    88	files in ATSEND18.ZIP to verify this.
    89	
    90	Archive:  ATSEND18.ZIP
    91	
    92	Name          Length    Method     SF   Size now  Mod Date    Time     CRC
    93	============  ========  ========  ====  ========  =========  ======== ========
    94	ATSEND.EXE       17264  Imploded   33      11452  27 Nov 92  13:47:34 46B34F7D
    95	ATSEND.DOC        7121  Imploded   55       3142  27 Nov 92  13:47:34 7127D2C7
    96	HEX2DEC.EXE       4064  Imploded   28       2899  27 Nov 92  13:47:34 6FD0DD60
    97	ATBATCH.EXE       5872  Imploded   37       3688  27 Nov 92  13:47:34 AFB5E3CE
    98	FILE_ID.DIZ        332  Imploded    9        302  27 Nov 92  13:49:38 09F0E0D8
    99	ATSEND.NEW        2848  Imploded   44       1589  27 Nov 92  13:47:34 0089171B
   100	============  ========  ========  ====  ========  =========  ======== ========
   101	*total     6     37501  ZIP 1.10   36%     23708  27 Nov 92  13:49:38
   102	
   103	
   104	I received HSDIAG in ZIP 2.0 format and have no idea whether the
   105	author of the Trojan released it initially in an archive created
   106	with PKZip 1.10 with a forged -AV or not.  Mr. Sheppard uses the
   107	AV feature of PKZip to provide some slight measure of security:
   108	
   109	PKUNZIP (R)    FAST!    Extract Utility    Version 1.1    03-15-90
   110	Copr. 1989-1990 PKWARE Inc. All Rights Reserved. PKUNZIP/h for help
   111	PKUNZIP Reg. U.S. Pat. and Tm. Off.
   112	
   113	Searching ZIP: ATSEND18.ZIP
   114	Testing: ATSEND.EXE    OK -AV
   115	Testing: ATSEND.DOC    OK -AV
   116	Testing: HEX2DEC.EXE   OK -AV
   117	Testing: ATBATCH.EXE   OK -AV
   118	Testing: FILE_ID.DIZ   OK -AV
   119	Testing: ATSEND.NEW    OK -AV
   120	
   121	Authentic files Verified!   # CRI220   Joseph Sheppard
   122	
   123	The hacked archive, HSDIAG.ZIP contains a FILE_ID.DIZ file:
   124	
   125	°±² High Speed Modem Diagnostics ²±°
   126	Superb tool for testing and configuring high
   127	speed (9600bps and up) modems.  Reports on
   128	UART, FIFO, S-Registers, and full NVRAM
   129	editor with context sensitve help.  $35
   130	Written by: Norman Shelbert <ASP>
   131	
   132	This is NOT the FILE_ID.DIZ from Sheppard's ATSEND18.
   133	Don't know who Norman Shelbert may be, but possibly there
   134	is a legitimate high speed modem diagnostic program
   135	written by such a person, and the FILE_ID.DIZ may have
   136	been lifted from that program.
   137	
   138	If at all possible, I will post further information
   139	within the next day or two.
   140	
   141	
   142	R. Wallace Hale, sysop
   143	Driftnet (506) 325-9002
   144	
   145	10 April 1993
   146	
