     1	
     2	#2   33 07 Aug 85  06:32:49  $0.00
     3	From: Donald Larson on Fido #333 in Net #115 Attache_Node, Schaumburg...........IL
     4	To: Sysop And All On on Fido #100 in Net #115
     5	Subject: Long Distance Services
     6	Everyone has asked at one time or another which of the long distance services
     7	are the best for data transmission.  This is especially true for the person
     8	who calls all over the country in search of that one program that will make
     9	their life easier.  Here's the story, according to an article in the August,
    10	1984 issue of Data Communications.
    11	
    12	The editors of the magazine made the following tests and observations.
    13	
    14	Carrier    Connect   Attempts  1st Try	BER   Error   BLER   Signal
    15		    Time     Required		      Burst	      Loss
    16	
    17	Allnet	    17.86      1.07	 93	 0	 0     0.0    -21.5
    18	AT&T	    14.16      1.07	 93	105   0.99     1.0    -18.7
    19	ITT-USTS    19.68      2.93	 40    2535   9.02    72.1    -20.6
    20	MCI	    14.96      1.27	 73	427   1.82    14.4    -24.2
    21	SBS	    21.72      1.13	 87	 64   0.50     1.5    -18.9
    22	SPRINT	    16.40      1.67	 56	 96   0.50     4.5    -18.3
    23	TELESAVER   26.67      1.40	 80    4314  23.3    109.0    -19.5
    24	WU	    19.78      2.60	 47	221   1.64     7.4    -24.8
    25	
    26	Connect Time - Seconds from last digit to answerback from distant modem
    27	Attempts - Average Number of calls required to complete call to other end
    28	1st Try - Percent of calls completed on first try
    29	BER - Bit error rate, number of bits in error per million bits
    30	Error Burst - number of bursts where 80 consecutive bits in error per million
    31	bits transmitted
    32	BLER - Block error rate, number of 1,000 bit blocks per 1,000 blocks
    33	Signal loss - loss of signal level (in db) at mid frequency (1004 hz)
    34	
    35	This is installment 1 of 3 installments.  More later.
    36	
    37	Don
    38	
    39	
    40	
    41	Read Command [2] 1 - 26, * :
    42	#3   30 07 Aug 85  21:39:21  $0.00
    43	From: Donald Larson on Fido #333 in Net #115 Attache_Node, Schaumburg...........IL
    44	To: Sysop And All on Fido #100 in Net #115
    45	Subject: Long Distance Services (Part 2)
    46	OK folks, here's installment 2 on long distance services for data
    47	transmission.  Again, this information is from an article in Data
    48	Communications, August 1984.  Here are some additional pieces of data:
    49	
    50	Carrier   Slope    S/N	   P/AR     Jitter     Billing
    51	
    52	Allnet	   5.4	  27.8	   57.5      5.8	 8.4	 $3.52
    53	AT&T	   1.7	  31.0	   71.3      4.5	 9.0	 $5.06
    54	ITT-USTS   6.3	  25.4	   55.3     10.0	 9.0	 $3.95
    55	MCI	   7.8	  27.9	   58.4      6.7	10.0	 $4.31
    56	SBS	   5.6	  30.4	   50.0      4.1	 9.4	 $3.67
    57	SPRINT	   7.4	  28.7	   63.6      6.1	10.0	 $5.10
    58	TELESAVER  7.3	  26.1	   41.9      8.5	11.0	 $4.91
    59	WU	   8.6	  29.0	   62.8      5.5	11.0	 $4.73
    60	
    61	Slope - Difference in attenuation (or loss) between middle frequency (1004)
    62	and the high and low levels (averaged). (Bell Spec < 14)
    63	S/N (Signal to Noise) - Measurement of signal strength over noise (static)
    64	background.  (Bell Spec > 24 db)
    65	PAR (Peak to Average Ratio) - Measurement of velocity distortion according to
    66	frequency.  Medium speed spec from Bell is > 48.
    67	Jitter (Phase Jitter) - Measurement of AC influence upon signals, measured in
    68	degrees.  Maximum permitted by Bell is 10 degrees.  Especially rough on phase
    69	modulated modems (212A is Phase shift keyed).
    70	Billing - Actual time was 8.5 minutes.	Amount shown is the amount the carrier
    71	billed.  This may be due to billing errors and/or minimum connect times
    72	(particularly important for Fido's short connects).  Dollar amounts are for
    73	coast to coast tests and may not be accurate for other comparisons.
    74	
    75	In the next and final installment, I'll discuss these stats in a management
    76	overview style (excerpted from the article and annotated by my experience)
    77	along with personal observations.
    78	
    79	Stay tuned for chapter 3 (Summary and Recommendations along with a discussion
    80	of equal access and the national toll network).
    81	
    82	Don
    83	
    84	
    85	
    86	Read Command [3] 1 - 26, * : 3 4
    87	#5   37 13 Aug 85  16:18:05  $0.00
    88	From: Donald Larson on Fido #333 in Net #115 Attache_Node, Schaumburg...........IL
    89	To: Sysop And All on Fido #100 in Net #115
    90	Subject: Long Distance Services - Part 3
    91	This is the executive summary of the previous two articles.
    92	
    93	Allnet - Best cost and bit error rates.  Suffered slightly in analog line
    94	measurements.  Data applications are highly ranked but the voice levels may
    95	suffer.  Excellent prices and billing accuracy.
    96	
    97	AT&T - Best overall quality for mixed voice and data applications.  In general,
    98	 the rates they charge are not bad for the quality compared to the batting
    99	averages, rate accuracy, etc.  Still the standard to compare against.
   100	
   101	GTE Sprint - Good quality for data, less for voice.  The general call "batting
   102	average" for first try call completion.  Ended up as the highest call cost on
   103	timed calls.  Their actual rates are lower than AT&T but the billing accuracy
   104	was poor.
   105	
   106	ITT USTS - Poor by almost all standards, except for price. Recommended for
   107	patient voice callers with plenty of time.
   108	
   109	MCI - Mediocre for data.  Voice quality probably acceptable but data
   110	performance not as good as others available.
   111	
   112	SBS - Second best in savings and surprisingly good quality.  A little long in
   113	call set up time. May be some problems with over 1200 bps data due to
   114	relatively poor P/AR rating.  Heavily recommended by Data Communications's
   115	magazine tests.
   116	
   117	Telesaver - Worst bit and block error rates overall.  Minimal savings over
   118	AT&T does not justify for data or even voice.
   119	
   120	Western Union - Poor call completion first attempt average; often required
   121	more than six attempts to connect.  Passable data performance but marginally.
   122	Not recommended for short voice and data calls but savings may be worth it on
   123	long length rates.
   124	
   125	I personally have been using SBS for several months with a great deal of
   126	success.  I highly recommend it.  I have also used MCI but had a greater
   127	problem with error rates.  My best advice is to try out the carrier and see
   128	what you see.
   129	
   130	Don
   131	
   132	PS - Let me know your experiences; I'll try to collect them and publish them
   133	occasionally.
   134	
   135	