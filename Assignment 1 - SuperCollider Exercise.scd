/*  CPSC 431 Homework 2: Pset and Reading

This Pset is an evaluative one. We need to know if this set of problems is easy, medium, or hard.  (Of course, this is relative...)  To this end, the last "question" is your assessment of how difficult this homework was and how long it took to complete. The results are private and will be used to partially determine the level of difficulty of future Psets.

The reading for this week is the SuperCollider Book Chapter 5 on programming in SuperCollider. The chapter goes into more detail and covers more subjects than those I cover in the syntax classes.

Please submit this document to the course dropbox link shown above, being sure to rename it according to the guideline's naming convension: LASTNAME_431-HOMEWORK-2.scd


*/


/* Problem 1.

Use () and {} to define an expression that:

  • Defines two variables, one of which (variable one) is available to both structures and one (variable two) is only available within the inner structure { }.
  • Assigns integers to both variables.

When evaluated, the expression should:
  • Multiply the variables
  • Post the results to the post window.

*/


(

var x = 13;
var result;

result = {
	var y = 2;
	x * y;
}.value;

result.postln;

)


/* Problem 2.

Write an expression that:
  • Randomly generates eight integers between 0 and 10 (with no duplicates)
  • Uses the .add method to add them to an Array resulting in an array of size 8.
  • Assigns the array to an environmental variable.
  • Posts the variable to the post window

*/

(
~x = Array.new;

(0..10).asArray.scramble.do { |i|
    if (~x.size < 8) {
        ~x = ~x.add(i);
    }
};

~x.postln;
)


/* Problem 3a.

Write an expression that:

   •  Generates one hundred float values between 0 and 1 rounded to the hundredth
   •  Maps those floats to the range 24-92 and rounds them to the nearest integer
   •  Removes duplicate numbers (resulting in an array with a size less than 100)
   •  Reorders the values such that they are ordered from highest to lowest
   •  Posts a multiline string with 1) the variable name, 2) the collection and 3) the size of the resulting collection

*/

(
var floatArr, intArr, processedArr;
floatArr = Array.fill(100, {((1.0.rand) * 100).round * 0.01});

intArr = floatArr.collect { |float| round(float.linlin(0, 1, 24, 92)) };

processedArr = intArr.asSet.asArray.sort.reverse;

(
"\n" ++
"Variable Name: processedArr\n" ++
"Collection: " ++ processedArr.asString ++ "\n" ++
"Size: " ++ processedArr.size.asString
).postln;

)
/* Problem 3b.

Write an expression that:
Achieves an array with 100 unique float values (between 0 and 1 inclusive) rounded to the hundredth decimal point, sorted high to low using the control structure 'while'.

*/

(
var set, arr;
set = Set.new;

while { set.size < 100 } {
	var randomNum = ((1.0.rand * 100).round * 0.01);
	set = set.add(randomNum);
};

arr = set.asArray.sort.reverse;
arr.postln;
)


)


/*  Problem 4.

Write an expression that:
  • Uses the do Control Structure to fill an array with 5 octaves worth of a C major scale (in MIDI* numbers)
  • The numbers should start with 24 (Which is C1)

Below is an Environmental variable assigned to an Array (~array) to fill with the midi values.

~scale is assigned to a special kind of class, the Scale class.  When you iterate over ~scale you will see that it is already populated.

Expected Length: this can be coded in one-line using 4 messages (.thisIsAMessage) and 4 operations (this + thing).

Note: you will not be graded-down if your code is longer, is multiline, etc.  The above is to give you an idea of the amount of code required.

* all you need to know about MIDI for now is that MIDI numbers are integers between 0-127

*/

(
~arr = [];
~scale = Scale.major;

~arr = 5.collect{ |i| ~scale.degrees + (i * 12 + 24) }.flat;
~arr.postln;

)

// Output should be
// -> [ 24, 26, 28, 29, 31, 33, 35, 36, 38, 40, 41, 43, 45, 47, 48, 50, 52, 53, 55, 57, 59, 60, 62, 64, 65, 67, 69, 71, 72, 74, 76, 77, 79, 81, 83 ]




/* Feedback: Please use the following link to report your experience with this Pset. Your input is anonymous.

https://forms.gle/K6xzDLpqEq4rmwQk9

*/