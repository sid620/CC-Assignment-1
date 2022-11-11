     1	  =========================================================================
     2	                                    ||
     3	  From the files of The Hack Squad: ||  by Lee Jackson, Moderator, FidoNet
     4	                                    ||   Int'l Echos SHAREWRE & WARNINGS
     5	          The Hack Report           ||  Volume 2, Number 6
     6	         File Test Results          ||  Result Report Date: May 29, 1993
     7	                                    ||
     8	  =========================================================================
     9	
    10	  *************************************************************************
    11	  *                                                                       *
    12	  *  The following test results are courtesy of HackWatcher Nemrod Kedem, *
    13	  *    a McAfee Associates Agent in Israel (FidoNet address 2:403/138).   *
    14	  *                 His assistance is greatly appreciated.                *
    15	  *                                                                       *
    16	  *************************************************************************
    17	
    18	
    19	
    20	
    21	  New trojan found in Israel.
    22	
    23	  This one is named RASPEED and its archive is as follows:
    24	
    25	  Archive:  RASPEED.ARJ
    26	
    27	  Name        Length   Method    SF  Size now Mod Date   Time     CRC
    28	  =========== ======== =======  ==== ======== ========= ======== ========
    29	  RASPEED.EXE    29120 Comp-1    37     18242 21 May 93 08:51:14 B9717331
    30	  RASPEED.DOC     4344 Comp-1    66      1443 21 May 93 12:46:36 194BB7EB
    31	  FILE_ID.DIZ      611 Comp-1    57       262 20 May 93 10:13:48 0E680542
    32	  =========== ======== =======  ==== ======== ========= ======== ========
    33	  *total    3    34075 ARJ 4     40%    21310 29 May 93 21:16:56
    34	
    35	  When run, it displays the following:
    36	
    37	          ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    38	          ³ RASPEED Version 0.9 UNREGISTERED EVALUATION PROGRAM ³
    39	          ³                                                     ³
    40	          ³    PLEASE WAIT, DETERMINING SYSTEM CONFIGURATION    ³
    41	          ³             CHECKING HARD-DISK F.A.T                ³
    42	          ³         GENERATING UPPER-MEMORY-BLOCK MAP           ³
    43	          ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    44	
    45	  After a while, a fancy screen is shown with the following:
    46	
    47	                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    48	                      ³ The Remote-Access Speed-Kit ³
    49	                      ³    Sellica Systems INC.     ³
    50	                      ³        Version 0.9          ³
    51	                      ³                             ³
    52	                      ³  PRESS [ENTER] TO CONTINUE  ³
    53	                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    54	
    55	  Next, the program will:
    56	
    57	   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    58	   ³ PLEASE ENTER THE FULL PATH TO THE LOCATION OF RA.EXE AND RA.OVL : ³
    59	   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    60	
    61	  If incorrect path entered, the program displays:
    62	
    63	                          ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    64	                          ³ < FILES NOT FOUND > ³
    65	                          ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    66	
    67	  Otherwise, another fancy screen is shown with the following:
    68	
    69	                              ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
    70	                              ³ WORKING... ³
    71	                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
    72	
    73	  After a few moments:
    74	
    75	   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    76	   ³ OPTIMIZATION COMPLETE !                                          ³
    77	   ³                                                                  ³
    78	   ³ RESULTS                                                          ³
    79	   ³ REMOTE ACCESS :   % SPEED IMPROVEMENT                            ³
    80	   ³ PLEASE REBOOT YOUR COMPUTER NOW SO MODIFICATIONS WILL TAKE PLACE ³
    81	   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    82	
    83	  That's it.  Now, what the program did is copy USERS.BBS to a file named
    84	  JACKLINE.GIF in the first area listed in FILES.RA. It also adds the
    85	  follwoing description into FILES.BBS:
    86	
    87	                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
    88	                      ³ JACKLINE.GIF (640x480x256) ³
    89	                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    90	
    91	  Check your filebase to see if you have a file by this name and remove it.
    92	
    93	  The following strings also found in the program but could not be found
    94	  elsewhere after the program completed.
    95	
    96	                              ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
    97	                              ³ CHKDSK.CFG ³
    98	                              ³ F*** YOU   ³ - [edited for television - lj]
    99	                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
   100	
   101	  The trojan hangs on RA 2.00 but seems to run well under RA 1.11.
   102	
   103	  The document if full of b*llsh*t and if one will read the DOC before
   104	  running the program, he will sure find out it's a fake program. Once
   105	  again we see that RTFM is true!
   106	
   107	  Best Regards,
   108	  Nemrod Kedem
   109	  Israeli HackWatcher.
