Gorispace: Programing Language for Gorillas
===========================================

Purpose
-------

Orangutans, chimps, bonobos, and gorillas are so smart among apes that they can think about abstract matter. It is said that their interlligence corresponds to five-years-old human children. As you may know, there are chimps and gorillas in labs who can communicate using sign language.

In particular, gorillas in a forest can communicate with human. In a book I have read, [Juichi Yamagiwa](http://www.kyoto-u.ac.jp/en/research/forefront/message/rakuyu07_a.htm) said that he can speak more than 10 words used by gorillas. Under this fact, we wonder why there is not any programming language for gorillas.

So, I have developed `Gorispace', which is a programming language for gorillas.

Hello World!
------------

Sample code

> hoo hooo, hooo hoooos hoo, hoo. hoos hoooo, hoo hooo wraagh hooos wraaagh, hoooo hooo hoo hoooo hooo. hoooos, hoooos, hoo, hoooo hoooos hoo hoooos. wraaaagh. hooos wraaagh hoooo hoo hoo, hoooo hoo, hoooos hoooos hoo, hooos hoooos hoooo hoo, wraaaagh. hooos. wraagh. hooo hoooo hoooo hooo. hoooo. hooos, hoooos. hoo. hoooos, hoooos. hoooo, hooo. wraaaagh hooos wraaaagh hoooo hooo. hoo. hooo hoooo hoos hoooos hooo, hoos, hoooos, hoooos. hoos wraaagh hoos. wraaagh hoo, hoooo hoooo. hoo hoo, hoooos, hoooo, hoo. hooo. hoooo hooo wraagh, hoooos wraaagh hoo, hoooo hoooo, hoooo hoo hooos hooo hoooos, hoo, hoooos hooos hoos wraaagh hoooos, wraaaagh. hoo, hooo, hooo hoo hoo, hoooos, hooos hoooo. hoooos, hoooos hoos, hoos. wraaaagh, hoooos. wraaaagh, hoooo hoooo, hoooo hooo, hoo hooos hoooos hoooos hoo, hoo, hoooos hoooo, wraaagh hoos. wraaagh. hooo hoo, hoooo hoooo hooo. hoooos hooos hooo, hoooos. hoooos hooo. hoooo. wraaagh. hooos wraaaagh hoooo, hoooo, hoooo hoo, hooo, hooos, hooos hoooo. hoooo hoooos hoo hoooo wraaaagh hooos, wraaagh hooo, hooo hooo hoooo hooo, hoooo. hoooo hoooo, hooos hoooo, hoos hoo wraaagh, hoos wraaagh. hoooo hoo, wraaaagh wraaagh wraaaagh 

Result

> $ bin/gorispace -e samples/en/helloworld.gs 
> Hello World

Fibonacci
---------

Sample code

> hoo. hoooo hoooo. hoooos hoo hoooo hooos hoooo. hoooo hoooo, wraagh hoooos wraaagh, hoooo hoo, hoooo. hoo hooo hoooos, hoooos. hoo hooos, hooos, hooos, hoooos wraaagh hoooos. wraaagh hoooo, hoooo hooo hooo hooo hooos hoooos. hooos. hoooo, hooos, hoos hoos wraagh. hoos wraagh, hooo, hoo hoo hoooo hooo hoooos, hoo hooo. hoooo. hoo. hoooo wraagh hooos wraaaagh. hooo, hoo hoooo hoooo hooo. hooos hoos, hooo hoos, hooos, hoo, hooos. wraaaagh. hooos wraagh hooo hooo. hoo, hoo. hoo hoos hoooos, hoo hoooo. hoooo hoooo, hooos, wraaaagh hooos, wraaagh, hooo hoo hoo. hoooo hoooo. hoooos hoooos hoo hooos, hoooos hooos hooo wraaagh, hoooos. wraaagh, hooo hoo, hooo hoo. hooo, hooos, hooos hoooos hoos hooo, hoooo. hooos wraaagh hoos wraaaagh hoo hoooo. hooo, hoooo hoooo hooos. hoos hoos hooos, hooos hoos wraagh, hooos. wraaagh hoo. hoooo hoooo hooo hoooo hooos, hoooo, hooo hoooo hooo, hoooo. wraagh, hoos wraaagh, hoooo hoo hooo hoooo. hoooo, hooos hoooo wraagh, hoos, wraaaagh hoooos hoooos, hooo hoooo, hoooo. hooo, wraaaagh hoo. hoo hooo hoos wraagh. hooo. wraaagh, hoo, hooos wraagh, hoooo, hoos. hooo. hoooo, hoooo hoooos hoooo, hoooos hoo. wraaagh. hoooos. wraaagh. hooo hoooo. wraaagh, hoo, hoo hoos wraaaagh hooo, wraaaagh hooo, hoooo hoooo, hooo, hooos. wraaagh, hoooo wraagh, hooos hoos hoooos, hoooo hoooos. hooo hoooo. hoooo. hooo, hoo, hoo hoos, wraaaagh. hoooos hooos hooos hoooo wraaagh, hooos hoo, wraagh hoooo, hoos, wraaaagh hoooo hoooos, hoooo, hooo, hoooo hooos, hooo hoos. hoo wraaaagh hoos, wraagh hoooo hooo hoooo, hoooo hoooo. hooos hooo wraagh, hooos hooos hooos hoooo hoo. hoo, hooos wraaaagh hooos, hoooo hooo hoos. hoo, wraaaagh, hoo, hooo hoo hoo hoos hooo wraaaagh. hoo wraaaagh hoooos hooos. hoooos hooo, wraaagh, hoooos hooos, hoooos hooo wraaagh. wraaaagh hooo wraaagh hooos wraaaagh wraagh, hoooo hooo, hoos, hoo. wraaagh wraaagh. wraaagh wraaagh 

Result

> $ bin/gorispace -e samples/en/fibonacci.gs 
> How many? 5
> 1
> 1
> 2
> 3
> 5
> 8
> 13

Grammar
-------

    +-----------+------------------+
    |IMP        |Meaning           |
    +-----------+------------------+
    |hoo        |Stack Manipulation|
    |hoos hoo   |Arithmetic        |
    |hoos hoos  |Heap access       |
    |wraagh     |Flow Control      |
    |hoos wraagh|I/O               |
    +-----------+------------------+

    Stack Manipulation IMP:hoo 
    +-------------+---------+-----------------------------------+
    |Command      |Parameter|Meaning                            |
    +-------------+---------+-----------------------------------+
    |hoo          |Number   |Push the number onto the stack     |
    |wraagh hoo   |         |Duplicate the top item on the stack|
    |wraagh hoos  |         |Swap the top two items on the stack|
    |wraagh wraagh|         |Discard the top item on the stack  |
    +-------------+---------+-----------------------------------+

    Arithmetic IMP:hoos hoo 
    +----------+---------+----------------+
    |Command   |Parameter|Meaning         |
    +----------+---------+----------------+
    |hoo hoo   |         |Addition        |
    |hoo hoos  |         |Subtraction     |
    |hoo wraagh|         |Multiplication  |
    |hoos hoo  |         |Integer Division|
    |hoos hoos |         |Modulo          |
    +----------+---------+----------------+

    Heap access IMP:hoos hoos 
    +-------+---------+--------+
    |Command|Parameter|Meaning |
    +-------+---------+--------+
    |hoo    |         |Store   |
    |hoos   |         |Retrieve|
    +-------+---------+--------+

    Flow Control IMP:wraagh 
    +-------------+---------+--------------------------------------------------------+
    |Command      |Parameter|Meaning                                                 |
    +-------------+---------+--------------------------------------------------------+
    |hoo hoo      |Label    |Mark a location in the program                          |
    |hoo hoos     |Label    |Call a subroutine                                       |
    |hoo wraagh   |Label    |Jump unconditionally to a label                         |
    |hoos hoo     |Label    |Jump to a label if the top of the stack is zero         |
    |hoos hoos    |Label    |Jump to a label if the top of the stack is negative     |
    |hoos wraagh  |         |End a subroutine and transfer control back to the caller|
    |wraagh wraagh|         |End the program                                         |
    +-------------+---------+--------------------------------------------------------+

    I/O IMP:hoos wraagh 
    +---------+---------+---------------------------------------------------------------------------+
    |Command  |Parameter|Meaning                                                                    |
    +---------+---------+---------------------------------------------------------------------------+
    |hoo hoo  |         |Output the character at the top of the stack                               |
    |hoo hoos |         |Output the number at the top of the stack                                  |
    |hoos hoo |         |Read a character and place it in the location given by the top of the stack|
    |hoos hoos|         |Read a number and place it in the location given by the top of the stack   |
    +---------+---------+---------------------------------------------------------------------------+

    Number: Numbers can be any number of bits wide, and are simply represented as a series of [Space] and [Tab], terminated by a [LF]. [Space] represents the binary digit 0, [Tab] represents 1. The sign of a number is given by its first character, [Space] for positive and [Tab] for negative. Note that this is not twos complement, it just indicates a sign.
    Label : Labels are simply [LF] terminated lists of spaces and tabs. There is only one global namespace so all labels must be unique.
    
    ※ Note: Sequence of `o' and `a' are viewed as one `o' and `a.'

Refferences
-----------

* [Whitespace](http://compsoc.dur.ac.uk/whitespace)
* [Ook!](http://en.wikipedia.org/wiki/Ook!)
* [Gorilla Info](http://www.primates.com/gorillas/gorilla-info.html)

Author
------

* [ANDO Yasushi](http://reviewmycode.blogspot.com/)
