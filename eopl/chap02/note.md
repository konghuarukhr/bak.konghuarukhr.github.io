2.1 Specifying Data via Interfaces
Data abstraction divides a data type into two pieces: an interface and an implementation.

2.2 Representation Strategies for Data Types
    Data Structure Representation
    Procedural Representation

**The Interpreter Recipe**

1. Look at a piece of data.
2. Decide what kind of data it represents.
3. Extract the components of the datum and do the right thing with them.


**Designing an interface for a recursive data type**

1. Include one constructor for each kind of data in the data type.
2. Include one predicate for each kind of data in the data type.
3. Include one extractor for each piece of data passed to a constructor of the data type.


