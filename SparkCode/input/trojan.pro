     1	
     2	
     3	    Mark Garvin -- Xymetric Productions -- New York City             3-7-87
     4	
     5	
     6	    I guess I have stirred some interest with my recent messages to BBS's
     7	    concerning Trojan horse programs.  I have decided to write the following
     8	    file in the interest of warning others and hopefully finding clues to the
     9	    origin of the programs.
    10	
    11	    I have been operating a Priam 60 Meg hard disk on my AT for the past two
    12	    years with good results.  About four months ago, I encountered a Trojan
    13	    horse program called HI-Q.COM which corrupted the FAT table on the disk.
    14	    I lost access to the entire D: drive and the files and boot sectors on
    15	    the C: drive were so badly damaged that I had to reformat the drive.
    16	    Since there was nothing to be lost by trying the program again, I decided
    17	    to confirm that HI-Q.COM was indeed the culprit.  I ran a couple of the
    18	    popular Trojan finders on the file first:  Nothing.  Thinking perhaps I
    19	    was mistaken, I ran HI-Q under an INT13-trapper.  No INT 13's were found
    20	    and HI-Q ran normally.  Upon rebooting the system, I found the same boot-
    21	    sector errors, and CHKDSK again reported numerous cross-links, etc.  I
    22	    reformatted the drive and ran media checks to make sure the Priam was
    23	    sound.   After checking several other programs (I did NOT run the Trojan-
    24	    testers or INT13-trapper again in case those were perhaps Trojan), I ran
    25	    HI-Q.COM for the third time.  Same results.  This is enough for me: I'm
    26	    convinced.
    27	
    28	    Up until this point, I had heard of Trojan horses, but honestly doubted
    29	    that there were actually competant computer programmers around who were
    30	    wierd enough to write such a thing.  I should also note that there is a
    31	    program called HI-Q.EXE which has been tested by some boards, and is
    32	    supposedly NOT a Trojan.  I'm not going to try it on my hard disk system.
    33	    The HI-Q.COM program may not have even been an intentional Trojan -- I'm
    34	    willing to keep an open mind on the subject.  Maybe it was incompetent
    35	    programming, or perhaps someone ran SPACEMAKER or a similar program on
    36	    the .EXE file to convert it to a .COM file, and inadvertantly created a
    37	    Trojan.
    38	
    39	    OK -- that's one thing.. The next Trojan I ran was DEFINITELY intentional.
    40	    I had reformatted my Priam after the previous incident, and I haven't
    41	    allowed the mysterious HI-Q program back on the system.  However, I HAVE
    42	    run numerous file-managers, etc. from local BBS's -- maybe I'm just a
    43	    trusting individual, but I wasn't ready to give up on Public Domain or
    44	    shareware software just yet.  Recently, the Priam starting giving me
    45	    trouble again: crosslinked and lost files, and no boot.  I called Priam,
    46	    hoping to get instructions for perhaps salvaging files on the D: drive,
    47	    since the partition was destroyed.  Priam's tech guided me through a HEX/
    48	    ASCII dump of the boot record via a trap-door in Priam's FDISK program.
    49	    Needless to say, we were BOTH incredulous at the result.  Dis-believers
    50	    should look closely at the HEX/ASCII dump below.  This was NOT retyped
    51	    or altered in any way.  After booting from floppy, I redirected printer
    52	    output to a disk file.  What you are looking at below is exactly what
    53	    appeared on my screen after the crash.
    54	
    55	____________________________________________________________________________
    56	
    57	
    58	
    59	0 = Master Boot Record, 25 = Extended Volume Record
    60	1 - 24 = Volume Boot Record
    61	                             
    62	Enter number of record to display (0 - 25) : [   0] 
    63	
    64	  D   H   0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F 0123456789ABCDEF
    65	  0/  0  EB 7D 53 4F 46 54 4C 6F 4B 2B 20 33 2E 30 0D 0A ..SOFTLoK+ 3.0..
    66	 16/ 10  11 28 43 29 20 53 4F 46 54 47 55 41 52 44 0D 0A .(C) SOFTGUARD..
    67	 32/ 20  53 59 53 54 45 4D 53 2C 20 49 4E 43 2E 20 0D 0A SYSTEMS, INC. ..
    68	 48/ 30  32 38 34 30 20 53 74 20 54 68 6F 6D 61 73 0D 0A 2840 St Thomas..
    69	 64/ 40  45 78 70 77 79 2C 20 73 74 65 20 32 30 31 0D 0A Expwy, ste 201..
    70	 80/ 50  53 61 6E 74 61 20 43 6C 61 72 61 2C 20 20 0D 0A Santa Clara,  ..
    71	 96/ 60  43 41 20 39 35 30 35 31 20 20 20 20 20 20 0D 0A CA 95051      ..
    72	112/ 70  34 30 38 2D 39 37 30 2D 39 34 32 30 10 07 00 FA 408-970-9420....
    73	128/ 80  8C C8 8E D0 BC 00 7C FB 8B F4 8E C0 8E D8 FC BF ......|.........
    74	144/ 90  00 06 B9 00 01 F3 A5 EA D4 06 00 00 45 72 72 6F ............Erro
    75	160/ A0  72 20 6C 6F 61 64 69 6E 67 20 6F 70 65 72 61 74 r loading operat
    76	176/ B0  69 6E 67 20 73 79 73 74 65 6D 00 4D 69 73 73 69 ing system.Missi
    77	192/ C0  6E 67 20 6F 70 65 72 61 74 69 6E 67 20 73 79 73 ng operating sys
    78	208/ D0  74 65 6D 00 BE BE 07 B9 04 00 AC 3C 80 74 15 83 tem........<.t..
    79	224/ E0  C6 0F E2 F6 CD 18 AC 0A C0 74 FE BB 07 00 B4 0E .........t......
    80	240/ F0  CD 10 EB F2 4E 8B 14 8B 4C 02 BB 00 7C B8 11 02 ....N...L...|...
    81	       
    82	Press <Esc> to ABORT, any other key to continue .
    83	
    84	0 = Master Boot Record, 25 = Extended Volume Record
    85	1 - 24 = Volume Boot Record
    86	
    87	
    88	_____________________________________________________________________________
    89	
    90	
    91	   In the interest of justice, I would like to make the following obser-
    92	   vations:
    93	
    94	   1) The MAIN phone no. for SoftGuard systems is: 408-970-9240, NOT 9420.
    95	      The no. listed above is not in use.  The message it gives IS the
    96	      normal message for that area, even though it sounds like it is com-
    97	      puter generated.  The phone co. says it is actually registered to
    98	      Siliconix, a Silicon Valley chip-manufacturer, who probably has no
    99	      interest in Public Domain software or BBS's.
   100	
   101	   2) I called SoftGuard, and they gave me a Mr. Phelps-type message, disavow-
   102	      ing any knowledge of any Trojan programs or of SOFTLok, etc. which they
   103	      said is not an official product.  However, they have not returned my
   104	      calls requesting additional information, and a request to speak to some-
   105	      one knowledgable about their software protection techniques has not been
   106	      answered.  This may mean either that the message was cooked up by some-
   107	      one with a vendetta against SoftGuard (I don't know why!), or that Soft-
   108	      Guard wants to be able to identify the source of the Trojan program by
   109	      the information phoned in by irate people whose disks have just crashed.
   110	      In my opinion, the juxtaposition of the phone no. digits could be caused
   111	      by errors on the part of whoever wrote the Trojan program, whether it
   112	      was within SoftGuard, or not.   After restoring the hard disk, I scanned
   113	      every file on it, and "SoftGuard" did not appear anywhere.  The clever-
   114	      ness in bit-shifting the ASCII digits, or otherwise disguising them, may
   115	      also have resulted in the wrong phone no.
   116	
   117	   3) I have not, and will not, install SoftGuard programs on my disks.  Also,
   118	      I obviously do not have any reason to run any of the unprotect programs
   119	      for SoftGuard, of which some are supposedly Trojans themselves (see
   120	      below).  I have no idea of which file of the 2,000+ files on my system
   121	      was the origin of the message.  As explained above, I have scanned them
   122	      for ASCII text and I've come up with nothing so far.
   123	
   124	
   125	
   126	   There are numerous warnings in circulation concerning SoftGuard Systems,
   127	   manufacturers of the SuperLock copy-protection scheme.  They SUPPOSEDLY
   128	   upload Trojan programs to BBS's either to try to get their own form of
   129	   justice against those who try to crack their software, or because they
   130	   are just bitter about the numerous SoftGuard/SuperLock unprotectors which
   131	   are circulating on the BBS's.  Most of these Trojans have the name SUG..
   132	   (Soft-Un-Guard) or something similar.  I did not originally believe that
   133	   SoftGuard would be stupid enough to do such a thing.  After all, a lesson
   134	   should have been learned by the example of Prolok (another copy-protect
   135	   manufacturer), who claimed that their new software would destroy the hard
   136	   disk of anyone who tried to mis-use it.  Most users, legitimate and other-
   137	   wise, dropped them instantly, even though Prolok realized their grave
   138	   error and retracted their previous advertising.  After all, who wants to
   139	   have their hard disk destroyed by accidently inserting the wrong key disk?
   140	
   141	   The SUG programs mentioned are reported to say something like: "Courtesy
   142	   of SoftGuard Systems .. So sue us!" -- after trashing the hard disk.
   143	
   144	   My feelings about possibly casting doubt on the integrity of SoftGuard ?
   145	   They did NOT convince me that they were blameless, and if they cared, they
   146	   would have returned my phone calls.  However, it MAY just be coincidence
   147	   that a lot of the Trojan programs mention SoftGuard.
   148	
   149	
   150	   Recommendations:
   151	
   152	     Whether SoftGuard is at fault or not, they did not give me an adequate
   153	     explanation of the rumors circulating about them, and they did not
   154	     return my calls.  I would recommend that individuals and companies stay
   155	     away from SoftGuard/SuperLock, or any other copy-protect program which
   156	     writes hidden, strange information onto their hard disks.  Users of such
   157	     copy-protected software should write or call the manufacturers and re-
   158	     quest that the copy protection be discontinued.  Explain to them that
   159	     pirates will always crack copy-protection, and that only the legitimate
   160	     users suffer from its use.  If you work for a company that uses copy-
   161	     protected software, why not get a print-out of this file and show it to
   162	     the person in charge of purchasing software?
   163	
   164	     If you DO have a hard disk crash, try to recover the boot-record on the
   165	     disk before just giving up and reformatting.  You may find something
   166	     similar to the above.  The manufacturer or vendor of your hard disk may
   167	     be able to steer you through the proper procedure for doing this.
   168	
   169	     Read this month's (March 1987) issue of 'Computer Language' for more
   170	     information on Trojan horse programs.  The article recommends contacting
   171	     Eric Newhouse at THE CREST BBS regarding trojan horse programs.  If you
   172	     DO run into one, keep a copy of the file, and have a knowledgable BBS-
   173	     user send it, and an explanation to Eric's BBS at 213-471-2518.  DO NOT
   174	     SEND THE FILE WITH ITS ORIGINAL NAME.  The file name should be changed
   175	     to something NOT ending in .EXE or .COM (how about .TRJ), and it should
   176	     be sent to the attention of the SYSOP.  This is usually done by waiting
   177	     for the prompt to enter the file description, and starting the descrip-
   178	     tion with '/'.  Afterwards, also leave a comment to SYSOP which states
   179	     the nature, and description of the file.  In other words, don't inadver-
   180	     tantly upload a Trojan program which could victimize others.
   181	
   182	     Watch out for some of the so-called Trojan testers.  The majority of
   183	     these are legitimate, but a few of them are actually Trojans themselves.
   184	     Also, before jumping the gun and assuming a program is Trojan, check
   185	     other possible sources for disk errors, etc.  Sometimes hard disk media
   186	     just develops errors, and there ARE some programs circulating as 'jokes'
   187	     which put a message up which says they are reformatting your drives, or
   188	     even claim to be draining excess water out of your disk drives.  Most of
   189	     the nasty Trojan programs don't cause their damage immediately.  They
   190	     wait for the drive to fill up a bit, or they wait for a random time
   191	     interval.  In the latter case described above, I suspected a file manager
   192	     that I had just run.  It turns out that others have used the program with
   193	     no ill effects.
   194	
   195	     It seems to me that the future of PD software, as well as BBS systems
   196	     is being threatened by this type of thing.  A concerted effort on the
   197	     part of SYSOPS to correlate the names and origins of people who upload
   198	     Trojan software may help to track them down.  Most BBS software keeps
   199	     track of the names of people uploading software.  I doubt that Trojan
   200	     writers are stupid enough to list their real names, but it's time that
   201	     some ingenuity was used in putting a stop to this.
   202	
   203	     I am a serious software developer, and I have taken some time off to
   204	     write this message in the interest of helping other PD software users.
   205	     Unfortunately, I don't have the time to coordinate any effort in analysis
   206	     of Trojan programs and I cannot be contacted by phone (unlisted), but if
   207	     you DO run into something similar, or if you have questions about any of
   208	     the info presented here, leave me a personal message on any of the larger
   209	     BBS's in New York City, and I will try to reply on the same board.
   210	
   211	
   212	     PLEASE DO circulate this file.  It is important information for anyone
   213	     running a BBS, or using Public Domain or SoftGuard/SuperLock software.
   214	
   215	
   216	
   217	
   218	cturer), who claimed that their new software would destroy the hard
   219	   disk of anyone who tried to mis-use it.  Most users, legitimate and other-
   220	   wise, dropped them instantly, even though Prolok realized their grave
   221	   error and retracted their previ