     1	From: news@fedfil.UUCP (news)
     2	Newsgroups: talk.origins
     3	Subject: The other crusade
     4	Message-ID: <133@fedfil.UUCP>
     5	Date: 29 Nov 92 02:59:28 GMT
     6	Organization: HTE
     7	Lines: 494
     8	
     9	
    10	
    11	This post has absolutely nothing to do with origins, but rather with
    12	the one other crusade I occasionally indulge in on usenet, i.e. the
    13	crusade to rid the earth of the Ada programming language.  I am about as 
    14	universally loved in the Ada group as on t.o. and for the same basic
    15	crime, preaching reality.  I've had one such article published in the
    16	C++ Journal, and a number of others which are favorites on usenet (comp.
    17	lang.ada), and the following article is probably THE all time favorite.
    18	
    19	Two reasons for bringing this up at all:  to give t.o. readers just a tad
    20	more than the one-dimensional view of myself which you'd get on t.o., and 
    21	two, as an exmple of the utility of comprehending something BEFORE it
    22	becomes common knowledge.  Not too many people would have told you that
    23	Ada was not going to make it even two years ago;  I've been telling 
    24	everybody who would listen that Ada couldn't make it for five years.
    25	Traffic on comp.lang.ada now concerns the demise of the Army STANFINS
    26	project at Fort Benjamin Harrison, the project which General Short
    27	said Ada would live or die with.
    28	
    29	................................................................
    30	................................................................
    31	
    32	
    33	I and a number of my associates, as well as a number of the most
    34	prominent computer scientists of our age, most notably Charles Anthony
    35	Richard Hoare, the inventor of the quick-sort process (Turing Award
    36	Lecture, 1980), believe the Ada programming language to be not only a
    37	major source of frustration and unnecessary cost to everybody involved
    38	with it, but an actual threat to the security of the United States and
    39	of any other nation which might become involved with it.
    40	
    41	The following is from usenet:
    42	
    43	
    44	 From: Nigel Tzeng, NASA
    45	
    46	
    47	>Oh yes...on the other front...executable size...we are sometimes space limited
    48	>on the size of the programs we can have in the on-board systems...how do the
    49	>C vs ADA sizes compare?
    50	 
    51	>This information is important to know...otherwise we cannot make an intelligent
    52	>decision on which language to use in the future.  NASA is trying to figure out
    53	>if they should adopt ADA as the single official language.  Developers at NASA
    54	>need to know the hard data in order to decide whether to support such a stand.
    55	 
    56	Good thinking.  With enough work and most Ada features turned off, Ada speeds
    57	for some tasks should approach those of C.  This has little or nothing to do
    58	with the BIG problems of Ada, which are philosophical/economic in nature
    59	and not easily amenable to technical solution.  Executable size is a
    60	symptom of one such problem.
    61	
    62	
    63	From: Jim Harkins, Scientific Atlanta, San Diego, CA
    64	
    65	>(Bill Wolfe) writes:
    66	>>   There is a great need for a single production programming language
    67	>>   which supports good software and code engineering practices.
    68	
    69	>Yep, and there is great need for a single type of automobile.  Any idiot can
    70	>see that not only is it extremely dangerous for a person to go from driving
    71	>a Hyndai Excel to a Ford Aerostar, as a nation we are wasting an awful lot
    72	>of time both in learning new skills and in designing automobiles that differ
    73	>in several respects.  I think a good compromise would be the Ford Escort...
    74	
    75	This is a REAL good analogy, but I'm afraid Jim doesn't carry it far
    76	enough, simply because he can't conceive of it actually happening.
    77	Problem is, the Ada crew CAN.  You have to put yourself in their
    78	shoes;  they want to control the two extremes of programming, embedded
    79	systems and mainframe/database work, and everything in between and,
    80	hence, they need every feature in the world in their CORE LANGUAGE.
    81	Letting people make up their own libraries for applications (as per C/UNIX)
    82	would be too much like a free system.  Logical consequence:
    83	
    84	
    85	  "My only problem with Ada at this point is the cost ($ and hardware
    86	  resources) of a compiler for my XT clone.  Both IntegrAda and Janus require
    87	  more memory than DOS 4.01 leaves available.  This is BAD DESIGN.  There
    88	  is no excuse for a 551K executable in a PC (pass 2 of Integrada).  Janus
    89	  Ada requires > 580K available to run, and rumor has it that the Integrada
    90	  compiler is a repackaged Janus compiler."
    91	             
    92	From a recent comp.lang.ada posting.
    93	
    94	
    95	Everybody begins to realize: "Hey!, looks like Ada's the only
    96	thing I'm ever gonna have, so I'd better see to it that everything I
    97	ever plan on doing is part of Ada...", and we get Ada-9x, the language
    98	which will include all the great features that Ada left out.  Kind of like
    99	quick-sand or one of those old Chinese finger traps... the more you
   100	struggle, the worse it gets.
   101	
   102	The good news is that, given the speed at which these things happen,
   103	Ada-9x is probably 10 years away.  The bad news is two-fold:  first,
   104	Ada-9x will probably break all existing Ada code and, second, the clunk
   105	factor will likely be so great (1,000,000+ bytes for "HELLO WORLD" might
   106	actually be achieveable), that no more working Ada code will ever be written
   107	afterwards.  Total paralysis.
   108	
   109	Several times recently, Ada affectionados have posted articles
   110	concerning the national information clearinghouse for Ada-9x, including
   111	the phone-modem number (301) 459-8939 for Ada-9x concerns.  This BBS
   112	contains 744 recent user comments on Ada in it's present state; true life
   113	experiences of actual Ada sufferers.  These are grouped in bunches of 50
   114	in self-extracting zip files (e.g. 101-150.exe) and may be downloaded.
   115	For instance:
   116	
   117	
   118	complaint #0300
   119	
   120	
   121	   PROBLEM:
   122	
   123	   Currently, to create and mature an Ada compiler, it takes from
   124	   3..5 years.  For the new architectures of the future and rapid
   125	   compiler development, the language needs to be expressed in terms
   126	   that are easy to parse and to generate code.
   127	
   128	   The definition should be revamped so that the grammar in Ada to
   129	   conform to LR(m,n) for consistent/complete parsing rules -- the
   130	   most efficient and accurate compiler techniques.  Move more
   131	   semantics to the grammar specification to rid the language
   132	   definition of so many special cases.
   133	
   134	The solution proposed, unless I'm missing something, would break nearly
   135	all existing Ada code, hence it isn't likely to happen.  Doesn't say
   136	much for the basic design of Ada either, does it?
   137	
   138	Add the time to finish the 9x standard and the 2 - 3 year time between
   139	first-compiler <--> compiler-which-anybody-can-stand-to-use, and you get
   140	my ten year figure for 9x.  Sort of;  there may never actually be a 9x
   141	compiler which anybody can stand to use.
   142	
   143	Here's the rub:  a casual reading of the 744 little "problems" would
   144	lead one to believe that 1 out of every ten or so was a show-stopper, and
   145	that nine of ten are just people whining for new features.  This would
   146	be a misinterpretation.  In fact, it's probably all of those new
   147	features which are the big serious problem, given past history.  The ten
   148	year problem, however, says that anybody figuring to use Ada starting
   149	now had best get used to the more minor problems (the 1 out of 10).
   150	These include:
   151	
   152	
   153	complaint #0237
   154	
   155	    We cannot adequately configure large systems as the language now
   156	    stands.  There are no standard means of performing the kind of
   157	    operations on library units generally considered desirable.  These
   158	    include:
   159	    -     creating a new variant or version of a compilation unit;
   160	    -     mixed language working, particularly the use of Ada units by
   161	          other languages;
   162	    -     access control, visibility of units to other programmers;
   163	    -     change control and the general history of the system.
   164	    The inability to do these things arises out of a few loosely worded
   165	    paragraphs in the LRM (in 10.1 and 10.4), which imply the existence
   166	    of a single Ada program library, whose state is updated solely by
   167	    the compiler.  This can be an inconvenient foundation on which to
   168	    build.  The relationships between compilations in a project will be
   169	    determined by the problem and the organization of work, and any
   170	    automatic enforcement of a configuration control regime must come
   171	    from a locally chosen PSE.  Ada especially, as a language with large
   172	    and diverse application, must have a separate compilation system
   173	    which gives the greatest freedom possible in this area.
   174	
   175	
   176	    IMPORTANCE:
   177	
   178	    ESSENTIAL
   179	
   180	    Ada was intended for use in large projects, involving many people,
   181	    possibly at different centers.  These are precisely the projects
   182	    which will collapse if the programming support technology is
   183	    inadequate.
   184	
   185	
   186	
   187	That is, Ada can't realistically be used for large systems.
   188	
   189	
   190	complaint #0150
   191	
   192	    Due to the availability of virtual memory, most minicomputer
   193	    and mainframe programmers rarely consider the size of main memory
   194	    as a limiting factor when creating their programs.  In contrast,
   195	    th size of main memory is a major concern of microcomputer
   196	    programmers.  The most widely used microcomputer operating
   197	    systems, MS-DOS, does not have virtual memory capabilities.
   198	    Without the availability of special programming techniques to get
   199	    around this limitation, microcomputer programmers would have to
   200	    severely limit the functionality of their programs, and, it would
   201	    be impossible to create large, integrated information systems for
   202	    microcomputers.  One of most widely used of these programming
   203	    techniques is the "chaining" capability provided in many
   204	    programming languages.  "Chaining" gives a programmer the ability
   205	    to break down large integrated information systems into separate
   206	    executable programs, and, then, when the system is operated, swap
   207	    these programs in and out of main memory as the need arises.
   208	    "Chaining", in effect, simulates virtual memory.  Ada does not
   209	    have the capability to chain programs.  As a result,
   210	    microcomputer programmers who use Ada must severely limit the
   211	    functionality of their programs.
   212	
   213	    Importance (1-10)
   214	
   215	    1 - Microcomputer programmers who use Ada will have to
   216	    continue limiting the functionality of their programs.
   217	    Current Workarounds
   218	
   219	    Programmers must either limit the functionality of their Ada
   220	    programs or use a proprietary CHAIN command supplied by the
   221	    compiler manufacturer - which hurts portability.
   222	
   223	
   224	I.e., Ada can't be used for small systems... klunk factor's too high.
   225	
   226	
   227	Consider the one feature which might come remotely close to justifying
   228	this giant klunk factor:  object-oriented capabilities.
   229	
   230	complaint #0599
   231	
   232	 
   233	    PROBLEM:
   234	
   235	    Inheritance has become one of the standard attributes of
   236	    modern object-oriented programming languages (such as C++
   237	    and Smalltalk-80).  Unfortunately, Ada is quite deficient in
   238	    its support for inheritance ( it is based primarily on
   239	    derived types, and then not particularly well),  and this is
   240	    a valid criticism leveled at the language by critics (and C
   241	    bigots who, if forced to learn a new language, simply prefer
   242	    to learn C++).  There are currently many proposals to add
   243	    full-blown inheritance (and other standard object-oriented
   244	    attributes, such as polymorphism) to Ada; the scope of this
   245	    revision request is much more modest, intended only to make
   246	    the derived type mechanisms that already exist work better.
   247	
   248	    IMPORTANCE: ESSENTIAL
   249	
   250	    If the lack of modern object-oriented attributes is not
   251	    addressed in Ada 9X, Ada will almost certainly become the
   252	    FORTRAN of the '90's.
   253	
   254	    CURRENT WORKAROUNDS:
   255	
   256	    Be thankful for what limited object-oriented support is
   257	    offered by the current language.
   258	
   259	
   260	
   261	
   262	Consider Ada's original primary mandate:  embedded systems:
   263	
   264	
   265	complaint #0021
   266	
   267	
   268	      PROBLEM:
   269	
   270	    A high priority task may be suspended because it needs to rendezvous with
   271	    a low priority task.  That low priority task does not get scheduled
   272	    promptly because of its priority.  However this causes the high priority
   273	    task to be suspended also.
   274	
   275	    IMPORTANCE:  (7)
   276	
   277	    This problem makes the use of task priorities extremely difficult to apply
   278	    correctly in a large system.  It limits the ability to use task priorities
   279	    to improve throughput in a system.
   280	
   281	
   282	complaint #0072
   283	
   284	
   285	
   286	   PROBLEM:
   287	
   288	   The Ada priority system has proved quite inadequate for the
   289	   needs of certain classes of hard realtime embedded systems.
   290	   These are applications where a high degree of responsiveness
   291	   is required.
   292	
   293	   For example, there is a major conflict between the fifo
   294	   mechanism prescribed for the entry queue and the need for the
   295	   highest priority task to proceed wherever possible.
   296	
   297	
   298	complaint #0084
   299	   
   300	   problem
   301	
   302	   Ada tasking involves too much run-time overhead for some high-performance
   303	   applications, including many embedded systems applications for which the
   304	   language was designed. This overhead not only slows down the program in
   305	   general, but may also occur at unpredictable times, thus delaying response at
   306	   critical times. To avoid the overhead, real-time programmers frequently
   307	   circumvent Ada tasking.
   308	
   309	   The problem is exacerbated by Ada's lack of support for those who do try to use
   310	   tasking in an efficient manner. There is no standard set of guidelines to
   311	   programmers for writing optimizable tasking code, or to language implementors,
   312	   for deciding which optimizations to perform. Also, there is no simple way for a
   313	   programmer who is concerned with writing portable high-performance code to
   314	   check that optimizations applied under one implementation will be applied under
   315	   different implementations.
   316	
   317	   The consequences of Ada tasking overhead have not gone unnoticed in higher
   318	   circles of government. A recent General Accounting Office report [1] noted that
   319	   Ada has limitations in real-time applications that require fast processing
   320	   speed, compact computer programs, and accurate timing control. All three of
   321	   these requirements are directly and adversely affected by Ada's current
   322	   tasking overhead.
   323	
   324	
   325	complaint #0278
   326	
   327	
   328	   PROBLEM:
   329	
   330	   In the last 5 years, tomes have been written on the Ada tasking
   331	   model.  It is too complex and has too much overhead for embedded
   332	   systems to utilize effectively.  It also does not fit well with
   333	   architectures found in embedded systems, e.g., multiprogramming/
   334	   distributed processing.  The control mechanisms are not
   335	   responsive to realtime needs.  Applications programs are
   336	   responsible for housekeeping on context switches where the
   337	   process will not return to the previously selected context.  The
   338	   model does not support the well-known basic scheduling
   339	   disciplines, e.g., preempt or nonpreempt and resume or nonresume,
   340	   see Conway's Theory of Scheduling.  The problems with tasking
   341	   efficiency is not the maturity of the compilers, but in the
   342	   underlying model defined in the language and the validation
   343	   requirements for the compilers.
   344	
   345	   importance:  very high, one of the major goals for the Ada 9x
   346	
   347	   current workarounds: Programming standards to avoid tasking or
   348	   only initiate a single task and to not use rendezvous of any kind
   349	   as they are too unpredictable and require too much overhead.
   350	   Allow the ACVC not to test this section so that the application
   351	   does not have to absorb a runtime system from a compiler vendor
   352	   that has little experience with the applications.
   353	
   354	   Or, write in a language like Modula-2 or object oriented C++ that
   355	   does not interfere in the target architecture.
   356	
   357	
   358	
   359	i.e. Ada can't really be used for embedded systems, its original mandate.
   360	How about something simple like string handling?
   361	
   362	
   363	complaint #0163
   364	
   365	Problem: 
   366	  Strings are inadequate in Ada.  It is very frequently the case that
   367	  the length of a string is not known until it is formed...after it
   368	  has been declared.  This leads to ugly, clumsy constructions (blank
   369	  pad everything, keep track of length separately, play tricks with
   370	  DECLARE's and constant strings, etc.).  The obvious solution of
   371	  writing a variable-length string package (see LRM, section 7.6) is
   372	  unsatisfactory:  you are lead to a limited private type because
   373	  neither the standard equality test nor assignment are appropriate.
   374	  (you want the both to ignore everything beyond the actual length of
   375	  the strings)  For limited private types, however, you have no
   376	  assignment statement at all.  We implemented such a package and
   377	  found that using a procedure (SET) for assignment was error-prone
   378	  and hard-to-read.  This even for experienced programmers and even
   379	  after getting beyond the initial learning curve for the package.
   380	
   381	
   382	How about something REAL SIMPLE, like argc/argv?
   383	
   384	complaint #355
   385	
   386	
   387	   PROBLEM:
   388	
   389	   It is difficult, in a standard manner, to get at the operating
   390	   system command line arguments supplied when the program is invoked.
   391	
   392	
   393	   IMPORTANCE:
   394	
   395	   (Scale of 1 - 10, with 10 being most important):
   396	   <<8>>
   397	
   398	
   399	   CURRENT WORKAROUNDS:
   400	
   401	   Look up in vendor-specific manuals the method of accessing the
   402	   command line parameters and access them differently on different
   403	   operating systems.
   404	 
   405	
   406	What about writing an OS in Ada (so that real "software engineers" won't have
   407	to screw around with UNIX anymore)?
   408	
   409	complaint #0186
   410	
   411	
   412	    It is difficult, if not impossible, to use Ada to write an operating
   413	    system.  For example, a multiprocessor naval command and control
   414	    system might need basic software, comparable in complexity to a
   415	    minicomputer network operating system, to support fault tolerance,
   416	    load sharing, change of system operating mode etc.  It is highly
   417	    desirable that such important software be written in Ada, and be
   418	    portable, i.e. be quite independent of the compiler supplier's Ada
   419	    run time system.  Currently, it would be very difficult to do this
   420	    in Ada, because of the difficulty of manipulating tasks of arbitrary
   421	    type and parentage.
   422	
   423	    IMPORTANCE: 7.
   424	
   425	
   426	    CURRENT WORKAROUNDS:
   427	
   428	    Use operating systems written in C or assembler.
   429	
   430	    Write the operating system as an extension of the Ada run time
   431	    system - this is undesirable because it is non-portable and
   432	    unvalidated.
   433	
   434	
   435	What about basic portability?
   436	
   437	
   438	complaint #0365
   439	
   440	
   441	   Problem:
   442	   Implementation Options Lead to Non-Portability and
   443	   Non-Reusability.
   444	
   445	   Discussion:     The LRM allows many implementation
   446	   options and this freedom has lead to numerous
   447	   "dialects" of Ada.  As programs are written to rely on
   448	   the characteristics of a given implementation,
   449	   non-portable Ada code results.  Often, the programmer
   450	   is not even aware that the code is non-portable,
   451	   because implementation differences amy even exist for
   452	   the predefined language features.  Further, it is
   453	   sometimes not impossible to compile an Ada program with
   454	   two different implementations of the same vendor's
   455	   compiler.
   456	
   457	   Another kind of non-portability is that of the programmer's
   458	   skills,  The user interfaces to Ada compilers have become so
   459	   varied that programmers find it very difficult to move from
   460	   one Ada implementation to another,  Not only does the
   461	   command line syntax vary, but so do program library
   462	   structures, library sharability between users, compiler
   463	   capabilities, capacity limits. etc.
   464	
   465	   Importance:     ESSENTIAL
   466	
   467	   Current Workarounds:
   468	
   469	   Significant amounts of code rewriting, recompilation, and
   470	   testing must be done to get a given Ada program to compile
   471	   and to run successfully using another compiler, if at all
   472	   possible, even on the same host-target configuration.  It
   473	   is very difficult to write a truly portable Ada program.
   474	
   475	   Another possible solution to porting an Ada program is for
   476	   a customer to carefully choose a compiler to suit the given
   477	   Ada program, or perhaps collaborate with a vendor to tailor
   478	   the compiler to suit these needs.
   479	
   480	   Significant amounts of programmer retraining must occur
   481	   when a different Ada compiler is used.
   482	
   483	
   484	
   485	Somehow, all of this is beginning to remind me of a song I used to hear in
   486	the late 60's/early 70's (roughly paraphrased):
   487	
   488	
   489	  "ADA! - KUH! - Yeah!, what is it GOOD for, absolutely NOTHIN!, say
   490	  it again...  ADA! - KUH! - Yeah..."
   491	
   492	
   493	
   494	
   495	
   496	
   497	
   498	
   499	-- 
   500	Ted Holden
   501	HTE
   502	 