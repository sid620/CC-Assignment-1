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
    37	          �����������������������������������������������������Ŀ
    38	          � RASPEED Version 0.9 UNREGISTERED EVALUATION PROGRAM �
    39	          �                                                     �
    40	          �    PLEASE WAIT, DETERMINING SYSTEM CONFIGURATION    �
    41	          �             CHECKING HARD-DISK F.A.T                �
    42	          �         GENERATING UPPER-MEMORY-BLOCK MAP           �
    43	          �������������������������������������������������������
    44	
    45	  After a while, a fancy screen is shown with the following:
    46	
    47	                      �����������������������������Ŀ
    48	                      � The Remote-Access Speed-Kit �
    49	                      �    Sellica Systems INC.     �
    50	                      �        Version 0.9          �
    51	                      �                             �
    52	                      �  PRESS [ENTER] TO CONTINUE  �
    53	                      �������������������������������
    54	
    55	  Next, the program will:
    56	
    57	   �������������������������������������������������������������������Ŀ
    58	   � PLEASE ENTER THE FULL PATH TO THE LOCATION OF RA.EXE AND RA.OVL : �
    59	   ���������������������������������������������������������������������
    60	
    61	  If incorrect path entered, the program displays:
    62	
    63	                          ���������������������Ŀ
    64	                          � < FILES NOT FOUND > �
    65	                          �����������������������
    66	
    67	  Otherwise, another fancy screen is shown with the following:
    68	
    69	                              ������������Ŀ
    70	                              � WORKING... �
    71	                              ��������������
    72	
    73	  After a few moments:
    74	
    75	   ������������������������������������������������������������������Ŀ
    76	   � OPTIMIZATION COMPLETE !                                          �
    77	   �                                                                  �
    78	   � RESULTS                                                          �
    79	   � REMOTE ACCESS :   % SPEED IMPROVEMENT                            �
    80	   � PLEASE REBOOT YOUR COMPUTER NOW SO MODIFICATIONS WILL TAKE PLACE �
    81	   ��������������������������������������������������������������������
    82	
    83	  That's it.  Now, what the program did is copy USERS.BBS to a file named
    84	  JACKLINE.GIF in the first area listed in FILES.RA. It also adds the
    85	  follwoing description into FILES.BBS:
    86	
    87	                      ����������������������������Ŀ
    88	                      � JACKLINE.GIF (640x480x256) �
    89	                      ������������������������������
    90	
    91	  Check your filebase to see if you have a file by this name and remove it.
    92	
    93	  The following strings also found in the program but could not be found
    94	  elsewhere after the program completed.
    95	
    96	                              ������������Ŀ
    97	                              � CHKDSK.CFG �
    98	                              � F*** YOU   � - [edited for television - lj]
    99	                              ��������������
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
