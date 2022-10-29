     1	
     2	
     3	Well, here's my 3 cents worth on LPT/COM port addresses and IRQ's:
     4	 
     5	The "standard" addresses for the LPT and COm ports are:
     6	           COM1   3F8   IRQ4
     7	           COM2   2F8   IRQ3
     8	           COM3   2E8   IRQ4
     9	           COM4   2E0   IRQ3
    10	           LPT1   3BC   IRQ7
    11	           LPT2   378   IRQ7
    12	           LPT3   278   IRQ5
    13	 
    14	However,....   I have also seen LPT2 use IRQ5 and LPT3 use IRQ7!!!
    15	               COM3 and COM4 addresses are not really that "standard",
    16	                 and COM4 especially may vary depending on your board.
    17	 
    18	I believe that the using IRQ7 for all LPT ports in a system works fine,
    19	LPT ports seem to share IRQ's just fine.  This is not nearly as true for
    20	COM ports, although in most cases the pairs COM1/3 {IRQ4) and COM2/4
    21	(IRQ3) work fine.  Some COM boards/modems are just not happy sharing an
    22	IRQ with another COM port/modem!!  If you have trouble with a COm port
    23	in a machine with more than two ports, try disabling/removing the other
    24	member of the pair and see if the problem goes away.
    25	 
    26	I have also seen some software that is hardcoded to expect the above
    27	address/IRQ "standard" settings, even though most CO{ boards allow you
    28	to m{x and match (say COM2 using IRQ 2,4 or 5)!!  Unless you are setup
    29	for non-standard IRQ #'s to avoid some other IRQ conflict, it's best to
    30	stick to the "standards".
    31	 
    32	For an explaination of when COM1 isn't COM1 see the message I will post
    33	titled COM/LPT ports and their addresses.  It explains how the BIOS
    34	determines how to assign the COM1/2/3/4 & LPT1/2/3 device names to a
    35	hardware port at a particular address.
    36	
    37	------
    38	
    39	One of the most confusing things about how PC hardware is configured has
    40	to do with the way the BIOS assigns device names (COM1, COM2, etc)
    41	to a hardware port.
    42	 
    43	Most users think that by addressing their serial board at address 2F8,
    44	that they have set that port up as COM2.  This is not always true!!!
    45	If this poor user didn't have a serial port at address 3F8 (COM1's
    46	"standard" address), then their port at 2F8 will be given the device
    47	name COM1!!!!!!  How can this be???  Well, let me explain.
    48	 
    49	When your machine boots and the BIOS does its initialization magic, it
    50	goes out to the hardware of your system, and checks certain addresses
    51	(in a fixed order) for serial ports and parallel ports.  The first
    52	serial port it finds is given the DOS device name "COM1".  The second is
    53	given the name "COM2", and so on for up to 4 serial ports.  Parallel
    54	ports are given device names in the same way.  The first port found gets
    55	the device name "LPT1" and so on.
    56	 
    57	Serial ports are searched for at addresses (in this order!):
    58	    3F8   2F8   2E8   2E0
    59	Parallel ports are searched for at (in this order):
    60	    3BC   378   278
    61	 
    62	As I said before, the first port of each type found gets the first
    63	device name (COM1 or LPT1), the second gets the second (COM2 or LPT2),
    64	and so on.  Thus in the simple example above, since the first address in
    65	the serial port list that the BIOS finds an actual serial port at is 2F8
    66	(the "standard" COM2 address), that port gets the device name COM1 !!!
    67	 
    68	The only reason I have figured out for this, is so that if a user only
    69	has one serial port on their machine, they can just call it COM1, they
    70	don't have to know hosw it's addressed.  This causes problems for some
    71	dumb software that assumes that serial/parallel ports use the "standard"
    72	IRQ (interrupt request) assignments.  In the example, the user has a
    73	serial port that looks to DOS like it's COM1, but the IRQ is probably
    74	comfigured to COM2's "Standard" IRQ (IRQ.  If a dumb piece of software
    75	says, "Gee, I'm using COM1, so it must be using IRQ4.  I'll setup~r the
    76	IRQ4 interrupt vector so I'll get the interrupts for that po!!"
    77	The problem is that the software will NEVER see the ports interrupt (it
    78	is actually using IRQ3)!!!  No interrupts = No data transfer!!!!!
    79	 
    80	Most programs (TELIX, PROCOMM, etc.) allow the user to change the
    81	port address/IRQ information (for that program only!), so that they can
    82	correctly access the serial ports.  NOTE: Parallel ports don't seem to
    83	have these sorts of problems.
    84	
    85		-Fafhrd