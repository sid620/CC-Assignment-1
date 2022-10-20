     1	
     2	*****************************************************************************
     3	*                                                                           *
     4	*    FIRE Starter : Get the BEST out of JRCOMM and your DUALST 14.4k Bds    *
     5	*                                                                           *
     6	*****************************************************************************
     7	-----------------------------------------------------------------------------
     8	
     9	
    10	         a
    11	
    12	 '' __    -    -__
    13	   _\ /> / /> / /
    14	   _ /_   _   _       _ ___    _
    15	  |_)|_) | | | \ | | |   |  | | | |\ | ``     19 may 1991.
    16	  |  | \ |_| |_/ |_| |_  |  | |_| | \|
    17	
    18	                               (c) 1991 Text Files. Call TRADE-LINE.
    19	                                   The Fastest CANADIAN ELITE AMIGA BBS.
    20	                                   [ 514 ] 966-1133. 14,400 BDS. 395 MEGS.
    21	
    22	
    23	
    24	
    25	
    26	
    27	
    28	
    29	
    30	
    31	
    32	
    33	
    34	
    35	
    36	
    37	
    38	
    39	----------------------------------------------------------------------------
    40	TEXT CREATED BY THE SPIRIT (MONTREAL,CANADA)
    41	----------------------------------------------------------------------------
    42	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    43	The REAL Best Settings for a DUAL STANDARD V42 BIS. (USERS VERSION)
    44	- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    45	
    46	
    47	This settings where not designed for SysOp.
    48	
    49	If you have a DUAL STANDARD and use JRCOMM, then read the whole file.
    50	If you have a HST, then skip the DUAL STANDARD settings.
    51	This file will tell you how to configure your DUAL STANDARD and/or
    52	JRCOMM X.X (Tested on version 1.02a) for ULTIMATE Speeds.
    53	
    54	I don't have the Super Fat Agnus, so I can't try anything in PAL
    55	mode. I have heard that CPS are quite faster using a PAL mode..
    56	Well, try it out if you have the chip, you have nothing to loose!
    57	
    58	It's amazing the number of LAME text files & TOP, ULTIMATE, BEST, K-RAD
    59	CPS utility we see each day (almost) floorishing in our ware list..
    60	Believe me, with this, if you have the configuration I talked about,
    61	YOU CANNOT HAVE BETTER CPS. Period. I made a LOT of tests..
    62	And that is the best configuration I got.
    63	
    64	
    65	
    66	NOW PRESS CONTROL+C and LOAD JRCOMM! (or stop a new CLI)
    67	
    68	---------------------------------------------------------------------
    69	JRCOMM PART
    70	---------------------------------------------------------------------
    71	
    72	FILE TRANSFER PARAMETER MENU
    73	****************************
    74	
    75	EVERYTHING OFF.. Except :
    76	                           ZMODEM (when will we get a NEW protocol???)
    77	                           Don't care
    78	                           Expand Blanks
    79	                           Resume Transfer (useful!)
    80	                           Auto Download
    81	                           Auto D/L challenge
    82	                           32 Bit CRC
    83	                           Binary Mode
    84	                           Save Aborted (saves the file even if aborted)
    85	                           Relaxed Timing
    86	                           Overdrive
    87	
    88	SERIAL MENU
    89	***********
    90	
    91	EVERYTHING OFF.. Except :
    92	
    93	                           19,2k (Why the HELL use 38.4k on 68000 machines?
    94	                                  And besides, the REAL 38.4k modems aren't
    95	                                  even out yet!)
    96	                           8
    97	                           None
    98	                           1
    99	                           Full
   100	
   101	
   102	MODEM MENU
   103	**********
   104	
   105	                          ATZ^M for the Init Command (Why RECONFIGURE
   106	                                 when everything is the NRAM?? )
   107	                          ~~+++~~ATH^M (Why put THREE ~ when it works
   108	                                        with two, it's faster when
   109	                                       ya need to hangup! hehe)
   110	                                       |
   111	                                       |__\  Well of course, you can
   112	                                          /  always use the VOICE/DATA
   113	                                              or a LIGHTNING fast hang up.
   114	
   115	The rest of this menu is up to you. It won't affect the speed in any way.
   116	(The Hangup function of course does not alter the speed, but since I'm
   117	writing this text, I might give ya some hints on other option.. eh?)..
   118	
   119	
   120	TERMINAL MENU
   121	*************
   122	
   123	Bahaha.. There is NOTHING to change in here. I like the people who
   124	actually think putting 2 color will speed up the transfer, NO IT
   125	WON'T! Not even by 1 CPS!! Not even 0.000001 CPS! Another rumour..
   126	
   127	(Yeh, Like the CLOCK VIRUS thing.. :-) )
   128	
   129	
   130	GENERAL MENU
   131	************
   132	
   133	CTS/RTS handshake on (of course)
   134	Disk Check (nothing to do with speed, but it's nice to see automatically
   135	            when you download if the file will fit on your d/L directory)
   136	Task Priority ---> 15 <--- Yes! 15.. It's the HIGHEST.. It will slow
   137	                           down your machine LIKE HELL. But it will
   138	                           avoid 99% of the ZRD32, GARGAGE and other
   139	                           shitty errors coming in and SLOWING everything
   140	                           down. You can put this to 0 if you want, you'll
   141	                           be able to multitask, but the transfers won't
   142	                           be so kickin! You'll might ERRORS & lower CPS..
   143	
   144	Transfer Buffer Size --> 6 <--  This should not be put to anything else.
   145	                                It's the RIGHT balance. If you put too much
   146	                                buffer size, it means that when there is
   147	                                an errors, it will have to send all the
   148	                                buffer all over. If it's too small, it won't
   149	                                help either. I made a LOT of tests on that
   150	                                particular option, so put it to that value!
   151	
   152	GMT Offset --> 0 <--
   153	
   154	
   155	
   156	
   157	
   158	
   159	
   160	
   161	
   162	SOME HINTS..........
   163	---------------------
   164	
   165	There you go with JRCOMM! I use the IBEUMA-ZINC.FONT made by my friend,
   166	Marc Dionne. I feel It's the BEST looking font when BBS'ing. It allows
   167	a perfect display of IBM ANSI Codes and AMIGA ANSI Codes without any problem,
   168	and it looks quite good. I included it in the archive. Just take
   169	IBEUMA-ZINC.font and move it to your FONTS: directory and create a
   170	directory in there called IBEUMA-ZINC and put the little "8" thing..
   171	(3188 BYTES).
   172	
   173	Another neato thing..
   174	
   175	Go in the TERMINAL Menu and change the TEXT #.. Put it to 5 or something.
   176	Then go in your palette menu (use 8 color in IBM mode by the way, that
   177	way you will see NICE looking ANSI, IBM 100% and AMIGA 100%) and change
   178	the FIFTH color. Put it to WHITE. Then modify the FIRST color (which is
   179	white, and put it to something like BLUE!). When you will download,
   180	you won't have that dirty looking WHITE window, you will have a kool
   181	blue or whatever color window you want.
   182	
   183	Adjust the other colors to your own taste (call several boards),
   184	DON'T USE THE DEFAULT IBM COLORS, they SUCK shit!! Put more INTENSITY
   185	and use different colors if you want.. But you'll have to EDIT all your
   186	JRCOMM Phone Book and adjust the colors after too.. That's a pain. So
   187	make sure you REALLY like your colors be4 re-creating your phone book.
   188	
   189	Would be NICE if J. RADIGAN could put an AUTO COLOR adjusts for every
   190	phone book entry.. As soon as you change the DEFAULT Jrcomm.def palette,
   191	it would adjusts all the other entry (this would be an OPTION.. ).
   192	Would have saved ME and other guys some time fer sure!!
   193	
   194	
   195	
   196	
   197	
   198	
   199	
   200	
   201	
   202	
   203	
   204	
   205	
   206	
   207	
   208	
   209	--------------------------------------------------------------------------
   210	PREFERENCES Best Settings
   211	--------------------------------------------------------------------------
   212	
   213	Use the PREF program I included in the ARCHIVE. It's a must. I wonder
   214	if you don't have it already. Go in your prefs, then click on the serial
   215	menu and put 31250 for the Baud speed and 16384 for the buffer. Everything
   216	setted out for maximum input. The buffer will be reduced by  JRCOMM after
   217	(to 6 like I said), so it doesn't really matter. Same thing for the baud.
   218	
   219	Save out everything and go back into your JRCOMM.
   220	
   221	
   222	
   223	
   224	
   225	
   226	
   227	
   228	
   229	
   230	
   231	
   232	
   233	
   234	
   235	
   236	
   237	
   238	
   239	
   240	
   241	-------------------------------------------------------------------------
   242	DUAL STANDARD Best Settings
   243	-------------------------------------------------------------------------
   244	
   245	Type ATI5..
   246	
   247	Then adjust all options to those ones :
   248	
   249	
   250	ati5
   251	
   252	USRobotics Courier 14400 HST Dual Standard NRAM Settings...
   253	
   254	   DIAL=TONE   B0  F1  M1  X3
   255	   BAUD=19200  PARITY=N  WORDLEN=8
   256	
   257	   & A3  & B1  & G2  & H1  & I0  & K1  & L0  & M4  & N0
   258	   & P0  & R2  & S0  & T5  & X1  & Y1  % R0
   259	
   260	   S02=043  S03=013  S04=010  S05=008  S06=001
   261	   S07=060  S08=003  S09=006  S10=007  S11=036
   262	   S12=050  S13=000  S15=000  S19=000  S21=010
   263	   S22=017  S23=019  S24=150  S26=001  S27=000
   264	   S28=008  S29=020  S32=001  S33=000  S34=000
   265	   S35=000  S36=000  S37=000  S38=007
   266	
   267	   STORED PHONE #0: (514) 966-1133
   268	                #1: (514) 966-1133
   269	                #2:
   270	                #3:
   271	
   272	OK
   273	ati4
   274	
   275	USRobotics Courier 14400 HST Dual Standard Settings...
   276	
   277	   B0  C1  E1  F1  M1  Q0  V1  X3
   278	   BAUD=19200  PARITY=N  WORDLEN=8
   279	   DIAL=HUNT   ON HOOK   TIMER
   280	
   281	   & A3  & B1  & C1  & D2  & G2  & H1  & I0  & K1  & L0
   282	   & M4  & N0  & P0  & R2  & S0  & T5  & X1  & Y1  % R0
   283	
   284	   S00=000  S01=000  S02=043  S03=013  S04=010
   285	   S05=008  S06=001  S07=060  S08=003  S09=006
   286	   S10=007  S11=036  S12=050  S13=000  S14=001
   287	   S15=000  S16=000  S17=001  S18=000  S19=000
   288	   S20=000  S21=010  S22=017  S23=019  S24=150
   289	   S25=000  S26=001  S27=000  S28=008  S29=020
   290	   S30=000  S31=000  S32=001  S33=000  S34=000
   291	   S35=000  S36=000  S37=000  S38=007
   292	
   293	   LAST DIALED #: T9661133
   294	
   295	OK
   296	
   297	Then you do AT&W to save everything out.
   298	
   299	Ya can change the ATS11 for SPEED DIALING.. Well at 36, it's VERY QUICK!
   300	(In fact, it can't be quicker for my place, In Montreal!)
   301	
   302	The ATS6 thing (1) is the delay between the DIAL TONE & the ACTUAL
   303	Dialing..
   304	
   305	__________________________________________________________________________
   306	##########################################################################
   307	--------------------------------------------------------------------------
   308	
   309	This is the END of the Text file! Was short & sweet. Now that you are
   310	ready to get KICKIN speeds, dial up my Board...
   311	
   312	( 514 ) 966-1133
   313	
   314	It's known as the F A S T E S T amiga bbs in CANADA. Only ELITE will
   315	be allowed.
   316	
   317	Hope this file will help several users out there!
   318	
   319	Later!
   320	__________________________________________________________________________
   321	##########################################################################
   322	--------------------------------------------------------------------------
   323	Greetings go out to : (no order)
   324	
   325	                Andeveron, Professor, The Raven, DOC, Spread(s)
   326	                Ti-Bob, Mega Man, Stingray, Raj Dood, Lone Wolf,
   327	                Aries, Solo, Beowulf, Sycon (sorry man!), Animal,
   328	                Elektra (Call our system! H/P base!), HellRat,
   329	                Bernard/SkyMan, Etrop, Capricorn, Problem Child,
   330	                Lazarus Long, Creative Impulse, King Cobra,
   331	                The Omega, The Drummer, The Kid, The Adept,
   332	                Tomcat, The Dream Warriors (Canada), Devious Doze,
   333	                and all others I know!
   334	
   335	
   336	
   337	         a
   338	
   339	 '' __    -    -__
   340	   _\ /> / /> / /
   341	   _ /_   _   _       _ ___    _
   342	  |_)|_) | | | \ | | |   |  | | | |\ | ``     19 may 1991.
   343	  |  | \ |_| |_/ |_| |_  |  | |_| | \|
   344	
   345	                               (c) 1991 Text Files. Call TRADE-LINE.
   346	                                   The Fastest CANADIAN ELITE AMIGA BBS.
   347	                                   [ 514 ] 966-1133. 14,400 BDS. 395 MEGS.
   348	                                     ~~~   ~~~~~~~~
   349	
   350	
   351	
