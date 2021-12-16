<style>
.matlab {
  background-color: #DDCC77;
  color: black;
} 
.matlab-other {
  background-color: #B5A8F7;
  color: black;
} 
.julia {
  background-color: #7ECEC0;
  color: black;
} 
</style>
# JuliaForMatlabUsers
Julia programming cheat sheet if you already know Matlab

# License

This work is licensed under Creative Commons CC-BY-4.0 (c) Yasri Yudhistira and other contributors

Please refer to the following for more information
https://creativecommons.org/licenses/by/4.0/

# Contents
1. [Basic Programming](#Basic-programming)
2. [Variables](#Variables)
3. [Number Types](#Number-types)
    1. [Types](##Types)
    2. [Literals](##Literals)
    3. [Type Conversion and Checking](##Type-conversion-and-checking)
    4. [Numerical operations](##Numerical-operations)
    5. [Comparison](##Comparison)
    6. [Logical Operations](##Logical-operations)
    7. [Complex Number Operations](##Complex-number-operations)
    8. [Bitwise Operations](##Bitwise-operations)
    9. [Updating Operations (only available in Julia)](##Updating-operations-only-available-in-Julia)
4. [Vector and Matrix](#Vector-and-matrix)
    1. [Creation](##Creation)
    2. [Combination](##Combination)
    3. [Removal](##Removal)
    4. [Indexing](##Indexing)
    5. [Size and Shape](##Size-and-shape)
    6. [Resize and Reshape](##Resize-and-reshape)
    7. [Element Wise Operations](##Element-wise-operations)
    8. [Comprehension](##Comprehension)
    9. [Broadcasting](##Broadcasting)

# Basic Programming
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| % Comment      | # Comment   | single line comment
| %{<br>Comment line1<br>Comment line2<br>%} | #=<br>Comment line1<br>Comment line2<br>=# | multi line comments
| a = b + 20     | a = b + 20  | show calculation result on screen
| a = b + 20;    | a = b + 20; | do not show result on screen
| 1 + 3; 6 + 10; | 1 + 3; 6 + 10; | more than 1 operations in single line, without showing the result on screen
| a = b + ...<br>20 | a = b +<br>20 | No `...` is needed in Julia. If statement is incomplete it knows that it will continue in the next line. Be careful of something like this: <br>a = b<br>+ 20<br>Instead it will do two operations, first assigning `a = b` then showing 20.
| x = ['hello ' ... <br>'world']; | x = "hello " * <br>"world"; | "hello world" written in two lines assignment
| multiline = sprintf([ ... <br>'Line 1\n'... <br>'Line 2\n'... <br>]); | multiline = """Line1<br>Line2<br>""" | Multi line string, in this example resulting in "Line1\nLine2\n"

# Variables
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| x = 1.0        | x = 1.0
| Z = "My string" | Z = "My string"
|                | 안녕하세요 = "Hello" | unicode variable name is allowed in Julia. Not in matlab
| pi = 3         | pi = 3      | Shadowing existing constants is possible in both Matlab and Julia. In Julia it is only possible when it is not yet used
| clear pi       |             | reset variable to original definition

# Number Types

## Types
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
|                | Float16
| double         | Float32
| single         | Float64
|                | BigFloat
| int8           | Int8
| int16          | Int16
| int32          | Int32
| int64          | Int64
|                | Int128
| uint8          | UInt8
| uint16         | UInt16
| uint32         | UInt32
| uint64         | UInt64
|                | UInt128
|                | BigInt
| double         | Complex{type} | Julia uses different type for complex numbers which may have specialized type, e.g. Complex{Float64}
| logical        | Bool

## Literals
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| uint32(1)             | 1           | integer value. By default matlab always initialize number without explicit type to double
| 0x12          | 0x12        | hexadecimal
| 0b011100      | 0b011100    | binary value
| 0b11110001u64 | UInt64(0b11110001)
| 1 or 1. or 1.0           | 1. or 1.0   | float value
| .5 or 0.5           | .5 or 0.5   | float
| | 10_000   | use _ to separate thousands
| | 0.000_000_005   | use _ to separate digits
| | 0b1011_0010   | use _ to separate digits
| 1+2i | 1+2im | complex number
| true          | true        | boolean true literal
| false         | false        | boolean false literal
| nan or NaN    | NaN         | Not a number |
| inf or Inf    | Inf         | Infinity, can be -Inf or +Inf for negative and positive infinity respectively

## Type Conversion and Checking
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| uint8(2.0)    | UInt8(2.0)  | Convert to uint8 from float. Use similar function to convert from one type to another |
| class(a)      | typeof(a) | Find the type of variable `a` |
| isnan, isinf, isinteger, isreal, isfinite, isnumeric | isnan, isinf, isinteger, isreal, isfinite, isnumeric | Same functionality
| isfloat      | isreal

## Numerical Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| +x | +x | unary plus
| -x | -x | unary minus
| x + y | x + y | addition
| x - y | x - y | subtraction
| x * y | x * y | multiplication
| x / y | x / y | division
| floor(x/y) | x ÷ y | integer divide truncated to an integer
| x \ y | x \ y | inverse divide equivalent to y / x
| x ^ y | x ^ y | raises x to the yth power
| rem(x, y) | x % y or rem(x,y) | reminder equivalent. Note difference between mod and rem in both Matlab and Julia is that mod returns the 0 or same sign as divisor (y) and rem returns same sign as divident (x). So mod(-5, 3) returns 1 and rem(-5, 3) returns -2. While mod(5, -3) returns -1 and rem(5, -3) returns 2.
| mod(x, y)     | mod(x, y)
| 1 + 2.2 % result is 3 | 1 + Int(2.2) # result is 3| In case of mixed type, matlab convert all types to common super type. Julia convert to higher precision. |
| double(1) + 2.2 % result is 3.2 | 1 + 2.2 # result is 3.2 | 

## Comparison
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| == | == | equality
| ~= | !=, ≠ | inequality
| < | < | less than
| <= | <=, ≤ | less than or equal to
| > | > | greater than
| >= | >=, ≥ | greater than or equal to

## Logical Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| ~x             | !x          | negation
| x && y         | x && y      | logical shortcut and
| x \|\| y       | x \|\| y    | logical shortcut or

## Complex Number Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| 1+2i | 1+2im | complex number
| complex(1, 2) | complex(1, 2) | complex number
| real(1 + 2i) | real(1 + 2im)
| imag(1 + 2i) | imag(1 + 2im)
| conj(1 + 2i) | conj(1 + 2im)
| abs(1 + 2i) | abs(1 + 2im) | absolute
| abs(1 + 2i)^2 | abs2(1 + 2im) | absolute squared
| angle(1 + 2i) | angle(1 + 2im)
| sqrt(i) | sqrt(1im)
| sqrt(-1) | sqrt(-1 + 0im) or sqrt(Complex(-1))| Julia will generate error for sqrt(-1)

## Bitwise Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| bitcmp(x)     |  ~x | bitwise not
| bitand(x, y)  | x & y | bitwise and
| bitor(x, y)   | x | y | bitwise or
| bitxor(x, y)  | x ⊻ y | bitwise xor (exclusive or)
| bitshift(x, -y) | x >>> y | logical shift right. In matlab if x is negative it turns into arightmatic shift right.
|               | x >> y | arithmetic shift right
| bitshift(x, y) | x << y | logical/arithmetic shift left

## Updating Operations (only available in Julia)
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
|  | +=
|  | -=
|  | *=
|  | /=
|  | \=
|  | ÷=
|  | %=
|  | ^=
|  | &=
|  | |=
|  | ⊻=
|  | >>>=
|  | >>=
|  | <<=

# Vector and Matrix

## Creation
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| []            | []          | Empty vector
| [1 2 3] or [1, 2, 3] | [1 2 3]     | row vector. Julia treat this as Matrix with 1 row.
| [1; 2; 3]            | [1; 2; 3] or [1, 2, 3]   | column vector. Julia treat comma (`,`) as "Vector" (matrix with 1 column)
|                  | 1:3 | range of numbers between 1 to 3. Similar to [1; 2; 3] but conceptually different
| (1:3)' | collect(1:3) | collect to convert range into column vector
|        | j:k:n | range from j to k with step n
| zeros(m)         | zeros(m, m)
| zeros(m, n)      | zeros(m, n)
| uint8(zeros(m))  | zeros(UInt8, m, m) | zero numbers with defined type, e.g. UInt8
| uint8([0 0 0]])  | UInt8[0 0 0] | zero numbers with defined type, e.g. UInt8
| ones(m)          | ones(m, m) | Types can also be specified, see zeros
| ones(m, n)       | ones(m, n) | Types can also be specified, see zeros
| a = eye(m)       | a = I | Identity matrix, needs `using LinearAlgebra` in Julia
| diag(x)          | Diagonal(x) | create diagonal matrix
| rand(m)          | rand(m, m) | Julia needs explicit dimension
| rand(m, n)       | rand(m, n)
| randn(m)         | randn(m, m) | Julia needs explicit dimension
| randn(m, n)      | randn(m, n)
| true(m)          | trues(m, m) | Julia needs explicit dimension
| true(m, n)       | trues(m, n)
| false(m)         | falses(m, m) | Julia needs explicit dimension
| false(m, n)      | falses(m, n)
| nan(m) or NaN(m) | repeat([NaN], m, m) | Julia needs explicit dimension
| nan(m, n) or NaN(m, n) | repeat([NaN], m, n)
| inf(m) or Inf(m) | repeat([Inf], m, m) | Julia needs explicit dimension
| inf(m, n) or Inf(m, n) | repeat([Inf], m, n)
| a = b            | a = copy(b) | copy values. In matlab copy by value is the only assignment possible, although it is technically assigned by reference until change on `b` is requested.
|                  | a = b | assign by reference

## Combination
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| [[1 2] [3 4]]    | [1 2 3 4]
| [[1, 2], [3, 4]] | [1 2 3 4]
| [[1; 2], [3; 4]] | [[1, 2] [3, 4]] | Julia uses space to concat horizontally
| [[1; 2], [3; 4]] | hcat([1, 2], [3, 4]) | Or use hcat to get the same result
| [[1; 2]; [3; 4]] | [[1, 2]; [3, 4]] | Julia use `;` to concat vertically
| [[1; 2]; [3; 4]] | vcat([1, 2], [3, 4]) | Or use vcat to get the same result
|                  | [[1, 2], [3, 4]] | Combination with `','` gives unexpected result from matlab point of view, resulting in arrays of two vectors, namely [1, 2] and [3, 4]
| [[1; 2; 3] [4; 5; 6]] | [1:3 4:6]
| A = [10  20  30; 60  70  80];<br>A(3, 4) = 1; | B = zeros(eltype(A), 3, 4);<br>B[1:2, 1:3] = A;<br>A = B;<br>A[3,4] = 1; | expanding matrix in Julia is done by initializing matrix with larger size, and copy the first few elements into it

## Removal
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| A(2, :) = [] | A = A[1:end .!= 2, :] | remove row 2
| A(:, 2) = [] | A = A[:, 1:end .!= 2] | remove column 2
| A([2, 3], :) = [] | A = A[setdiff(1:end, [2, 3]), :] | remove row 2 and 3
| A([2, 3], :) = []; <br>A(:, 1) = []; | A = A[setdiff(1:end, [2, 3]), 1:end .!= 1] | remove row 2 and 3 and column 1. Julia can do rows and columns removal simulataneously
| squeeze(A) | dropdims(A, dims=tuple(findall(size(A) .== 1)...)) | Remove all dimensions of length 1
|  | dropdims(A, dims=2) | Remove 2nd dimension of A if 2nd dimension has length of 1. If length is not 1, error is thrown

## Indexing
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| X = A(I_1, I_2, ..., I_n) | X = A[I_1, I_2, ..., I_n] | A is n-dimensional array. Note Julia uses [] and Matlab ()
| X = A(1:2:10, 2:2:10) | X = A[1:2:10, 2:2:10] | Multi dimensional indexing using range
| A([1, 3], [4, 5]) | A[[1, 3], [4, 5]] | Select a few rows (1 & 3) and columns (4 & 5). Note difference in bracket between Julia [] and Matlab ()
| A(2:3, 2:end-1) | A[2:3, 2:end-1] | use special keyword `end` to refer to last index
| A([]) | A[[]] | Select no element from A
| A(2, :) | transpose(A[2, :]) | Select 2nd row of the 2D matrix. In Julia it will be gathered as Vector (column matrix). To have the same dimension, transpose is needed.
| A(:, 2) | A[:, 2] | Select 2nd column of the 2D matrix.
| A(:) | A[:] | vectorizing matrix
| A([true; true; false; false]) | A[[true, true, false, false]] | select by boolean. Note that Julia will produce column vector. In Matlab use semicolon (;)
| A([true, true, false, false]) | transpose(A[[true, true, false, false]]) | select by boolean. Note that Julia will produce column vector, hence transpose is needed if Matlab uses comma (,) in boolean list
| A(I_1, I_2, ..., I_n) = X | A[I_1, I_2, ..., I_n] = X<br>A[I_1, I_2, ..., I_n] .= X | Number of element in X must be the same as the place in A to fill in. Note sign difference in Julia [] and Matlab ()

## Size and Shape
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| class(A) | eltype(A) | the type of the elements contained in AXa
| numel(A) | length(A) | the number of elements in A
| length(A) | max(size(A)) | length or largest dimension
| ndims(A) | ndims(A) | the number of dimensions of A
| size(A) | size(A) | a tuple containing the dimensions of A
| size(A, n) | size(A, n) | the size of A along dimension n
| | axes(A) | a tuple containing the valid indices of A
| | axes(A,n) | a range expressing the valid indices along dimension n
| | eachindex(A) | an efficient iterator for visiting each position in A
| | stride(A,k) | the stride (linear index distance between adjacent elements) along dimension k
| | strides(A) | a tuple of the strides in each dimension
| isscalar(A) | isa(x, Union{Number,AbstractString,Char,Bool}) | Determine whether A is scalar
| issorted(A) | issorted(A) | Determine if array is sorted
| issortedrows(A) | | Determine if matrix or table rows are sorted
| isvector(A) | isa(A, Array) && (sum(size(A) .!= 1) <= 1) | Determine whether array is vector
| ismatrix(A) | isa(A, Union{Array, Matrix}) && (sum(size(A) .!= 1) > 1) | Determine whether array is matrix
| isrow(A) | isa(A, Union{Array, Matrix}) && (sum((size(A) .!= 1)[setdiff(1:ndims(A), 2)]) == 0) | Determine whether array is row vector
| iscolumn(A) | isa(A, Union{Array, Matrix}) && (ndims(A) == 1 \|\| sum(size(A)[2:end] .!= 1) == 0) | Determine whether array is column vector
| isempty(A) | isempty(A) | Determine whether array is empty

## Resize and Reshape
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| reshape(A, 3, 2) | reshape(A, 3, 2) | an array containing the same data as A, but with different dimensions
| reshape(A, [], 1) | reshape(A, :, 1) | reshape into column vector
| reshape(A, 1, []) | reshape(A, 1, :) | reshape into row vector
| sort(A) | sort(A) | Sort vector A
| sort(A) | sort(A, dims=1) | Sort matrix by first dimension. Note in Julia dimension explicit defition is required
| sort(A, 2) | sort(A, dims=2) | Sort matrix by 2nd dimension
| sort(A) | sort(A, rev=true) | Sort vector A
| sort(A, 'descend') | sort(A, dims=1, rev=true) | Sort matrix by first dimension from high to low. For matrix, dimension is required
| [B, idx] = sort(A) | idx = sortperm(A); B = A(idx) | sort vector A and return it's index. Note that in Julia it only works for vector, not matrix
| [B, idx] = sort(A) |  | no equivalent function in Julia when A is matrix
| sortrows(A, 1) | sortslices(A, dims=1, lt=(x, y)->isless(x[1], y[1])) | Sort rows of matrix based on column 1
| sortrows(A, 2) | sortslices(A, dims=1, lt=(x, y)->isless(x[2], y[2])) | Sort rows of matrix based on column 1
| sortrows(A, [1, 7]) | sortslices(A, dims=1, lt=(x, y)->(isless(x[1], y[1]) \|\| (isequal(x[1], y[1]) && isless(x[7], y[7])))) | Sort rows of matrix based on column 1 then column 7
| transpose(A) | transpose(A) | Transpose vector or matrix
| A' or ctranspose(A) | A' or adjoint(A) | Complex conjugate transpose
| flip(A) | reverse(A, dims=1) | Flip order of elements
| flip(A, 2) | reverse(A, dims=2) | Flip order of elements in 2nd dimension
| rot90(A) | rotl90(A) | Rotate array 90 degrees counterclockwise (left)
| rot90(A, 3) | rotl90(A, 3) or rotr90(A) | Rotate array 270 degrees counterclockwise (left) or 90 degree clockwise (right)
| rot90(A, 2) | rotl90(A, 2) or rotr90(A, 2) or rot180(A) | Rotate array 180 degrees
| permute(A, [m, n, p]) | permutedims(A, (m, n, p)) | Permute array dimensions
| circshift(A, n) | circshift(A, n) | Shift array circularly
| circshift(A, n, m) | circshift(A, (n, m)) | Shift matrix circularly. Julia uses tuple
| shiftdim(A) | | Shift array dimensions

## Element Wise Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| +x | +x | unary plus
| -x | -x | element wise negation
| x + y | x + y or x .+ y | element wise addition. If x and y has the same number of element but different dimension, for example x is row vector and y is column vector, then x + y in Julia gives the same answer in Matlab. Otherwise x + y in Julia throws error and Matlab do auto expansion.
| x - y | x - y or x .- y | element wise subtraction. Same rule as .+ see above
| x .* y | x .* y | element wise multiplication
| x ./ y | x ./ y | element wise division
| floor(x ./ y) | x .÷ y | element wise integer divide truncated to an integer
| x .\ y | x .\ y | element wise inverse divide equivalent to y / x
| x .^ y | x .^ y | element wise raises x to the yth power
| arrayfun(f, x) | f.(x) | element wise f. Sometimes f(x) in matlab gives the same result when x is array
| sin(x) or arrayfun(sin, x)| sin.(x) | element wise sin, return same dimension as x. Julia will throw error on sin(x) when x is array
| max(a, b) or arrayfun(@(x, y) max(x,y), a, b) | max.(a,b) | element wise max, return same dimension as a and b. Julia max(a, b) will throw error when a and b are arrays
| a == b or arrayfun(@(x, y) x == y, a, b)| a .== b | element wise equality comparison, return same dimension as a and b. Julia a == b will do all(a .== b) when a and b are arrays
| a > b or arrayfun(@(x, y) x > y, a, b)| a .> b | element wise greater than comparison. Same rule as above. Same as other operators as .< .!= .≈ (isapprox), .≉

## Comprehension
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| sum(1 ./ ((1:1000) .^ 2)) | sum(1/n^2 for n=1:1000) | sums a series
| arrayfun(@(x, y, z) 0.25\*x + 0.5\*y + 0.25\*z, x(1:end-2), x(2:end-1), x(3:end)) | [ 0.25\*x[i-1] + 0.5\*x[i] + 0.25\*x[i+1] for i=2:length(x)-1 ] | weighted average of the current element and its left and right neighbor along a 1-d grid
| | [(i,j) for i=1:3 for j=1:i if i+j == 4] | result:<br>2-element Vector{Tuple{Int64, Int64}}:<br>(2, 2)<br>(3, 1)
| | map(tuple, (1/(i+j) for i=1:2, j=1:2), [1 3; 2 4]) | result: <br>2×2 Matrix{Tuple{Float64, Int64}}:<br>(0.5, 1)       (0.333333, 3)<br>(0.333333, 2)  (0.25, 4)

## Broadcasting
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| a = rand(2,1); A = rand(2,3);<br>a + A | a = rand(2,1); A = rand(2,3);<br>broadcast(+, a, A) | Result 2x3 matrix. Matlab will perform auto expansion, Julia needs explicit broadcast
| a = rand(2,1); b = rand(1,2);<br>a + b | a = rand(2,1); b = rand(1,2);<br>broadcast(+, a, b) | Result: 2x2 matrix. Matlab will perform auto expansion, Julia needs explicit broadcast

# String

## String Types
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| char           | Char
| string         | String

## Char Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| c = 'hello'    | c = ['h', 'e', 'l', 'l', 'o']
| d = double(c)  | d = Float32.(c)
| a = char(d)    | a = Char.(d)
| 'x' - 'a'      | 'x' - 'a'   | Result: 23
| 'A' + 1        | Int('A' + 1) | Result: 66
| char('A' + 1)  | 'A' + 1     | Result: 'B'
| 'A' <= 'X' <= 'Z' | 'A' <= 'X' <= 'Z' | Result: true
| "A" <= "X" <= "Z" | 'A' <= 'X' <= 'Z' | Result: true

## String Creation & Concatenation
```matlab
s = 'hello world';
```

| Matlab (2020b) char array | Matlab (2020b) string | Julia (1.6) | Notes |
| ------------------------- | --------------------- | ----------- | ----- |
| s = 'hello world'; | s = "hello world"; | s = "hello world";
| w = sprintf('hello "alien" world\\n'); | w = "hello ""alien"" world" + sprintf('\\n'); | w = "hello \\"alien\\" world\\n";
| w = sprintf('hello "alien" world\\n'); | w = "hello ""alien"" world" + sprintf('\\n'); | w = """hello "alien" world\\n"""; | Julia can use triple quote
| | | w = "This is long \ <br>line"; | Long line can be broken by \
| ss = ['hello', 'world']; | ss = "hello" + "world"; | ss = "hello" * "world; | Julia uses * for string concatenation
| | ["Red" "Blue" "Green"] + ["Truck" "Sky" "Tree"] | ["Red" "Blue" "Green"] .* ["Truck" "Sky" "Tree"] | Result: "RedTruck" "BlueSky" "GreenTree" | Julia uses element wise concatenation (.*)
| strcat('  a  ', '  b  ') | | rstrip("  a  ") * rstrip("  b  ") | Result: '  ab  '<br>Matlab strcat with char removes right spaces
| | strcat("  a  ", "  b  ") | "  a  " * "  b  " | Result: "  a    b  "<br>Matlab strcat with spring does not remove right spaces
| | append("  a  ", "  b  ") | "  a  " * "  b  " | Result: "  a    b  "<br>append behaves the same as +
| | join(["apples", "bananas", "pineapples"], "") | join(["apples", "bananas", "pineapples"]) | Result: "applesbananaspineapples"<br>Matlab delimiter default is single space, Julia default is empty string
| | join(["apples", "bananas", "pineapples"]) | join(["apples", "bananas", "pineapples"], " ") | Result: "apples bananas pineapples"<br>Matlab delimiter default is single space, Julia default is empty string
| | join(["apples", "bananas", "pineapples"], ", ") | join(["apples", "bananas", "pineapples"], ", ") | Result: "apples, bananas, pineapples"
| | join(["apples", "bananas", "pineapples"; "aa", "bb", "cc"], ", ") | join.([["apples", "bananas", "pineapples"], ["aa", "bb", "cc"]], ", ") | Result: ["apples, bananas, pineapples"; "aa, bb, cc"]<br>Julia use element wise operation (.) on join function
| | join(["Carlos","Sada"; "Ella","Olsen"; "Diana","Lee"], 1) | | Result: "Carlos Ella Diana" "Sada Olsen Lee"<br>Use for loop in Julia
| | join(["x","y","z"; "a","b","c"], [" + "," = "; " - "," = "]) | | Result: "x + y = z" "a - b = c"<br>Use for loop in Julia
| blanks(5) | blanks(5) | " " ^ 5 | Result: "     "
| repmat('a', 1, 5) | join(repmat("a", 1, 5), "") | "a" ^ 5 | Result: "aaaaa"
| repmat('hello', 1, 5) | join(repmat("hello", 1, 5), "") | "hello" ^ 5 | Result: "hellohellohellohellohello"

## String Conversion
| Matlab (2020b) char array | Matlab (2020b) string | Julia (1.6) | Notes |
| ------------------------- | --------------------- | ----------- | ----- |
| char("hello") | | collect("hello") | Returns : ['h', 'e', 'l', 'l', 'o']
| | string('hello') | join(['h', 'e', 'l', 'l', 'o']) | Returns: "hello"
| str2double('123') | str2double("123") | parse(Float32, "123")
| | double("123") | parse(Float32, "123")
| double('123') | | codeunits("123") | Returns: 49 50 51. In Julia codeunits only works with ASCII characters
| double('∀ x ∃ y') | | Int.(collect("∀ x ∃ y")) | Returns: 8704 32 120 32 8707 32 121<br>For Unicode, use element wise operation to convert char to Int
| num2str(123) | string(123) | string(123) | Returns: "123"

## String Testing
| Matlab (2020b) char array | Matlab (2020b) string | Julia (1.6) | Notes |
| ------------------------- | --------------------- | ----------- | ----- |
| length('∀ x ∃ y') | | length("∀ x ∃ y") | Returns : 7<br>length with string in matlab returns 1 (number of string, not length of the string)
| strlength('∀ x ∃ y') | strlength("∀ x ∃ y") | length("∀ x ∃ y") | Returns : 7<br>strlength can be used in both char array and string
| str = {'Mary Ann Jones', 'Paul Jay Burns', 'John Paul Smith'};<br>contains(str, 'Paul') | str = ["Mary Ann Jones", "Paul Jay Burns", "John Paul Smith"];<br>contains(str, "Paul") | str = ["Mary Ann Jones", "Paul Jay Burns", "John Paul Smith"];<br>contains.(str, "Paul) | Result: 0 1 1<br>Julia uses element wise operation
| contains(str, {'Paul', 'Ann'}) | contains(str, ["Paul", "Ann"]) | contains.(str, r"Paul\|Ann") | Result: 1 1 1<br>Julia uses regex
| contains(str, 'jones', 'IgnoreCase', true) | contains(str, "jones", 'IgnoreCase', true) | contains.(str, r"jones"i) | Result: 1 0 0<br>Julia uses regex
| count(str, 'n') | count(str, "n") | | Result: 3 1 1<br>Julia needs loop



## String Indexing
| Matlab (2020b) char array | Matlab (2020b) string | Julia (1.6) | Notes |
| ------------------------- | --------------------- | ----------- | ----- |
| s(1) | s{1}(1) | s[1] or s[begin] | returns : 'h'
| s(5) | s{1}(5) | s[5] | returns : 'o'
| s(end) | s{1}(end) | s[end] | returns : 'd'
| s(4:9) | s{1}(4:9) | s[4:9] | returns : 'lo wor'
| t = [0x2200, ' x ', 0x2203, ' y']; | t = char(0x2200) + " x " + char(0x2203) + " y"; | t = "\u2200 x \u2203 y"; | '∀ x ∃ y'
| t(1:2) | t{1}(1:2) | t[1:4] | Result: '∀ '. Julia count unicode char depending on the char size in byte. In this example, t[1:2] will return ERROR: StringIndexError: invalid index [2], valid nearby indices [1]=>'∀', [4]=>' '<br>Stacktrace:<br>[...]
| t(3) | t{1}(3) | t[collect(eachindex(t))[3]] | Result: 'x'. Julia first collect starting indices of unicode characters in the string, and then index it to the right location
| t(3:5) | t{1}(3:5) | t[collect(eachindex(t))[3]:collect(eachindex(t))[5]] | Result: 'x ∃'. Julia first collect starting indices of unicode characters in the string, and then index it to the right locations
| for c = t<br>disp(c);<br>end | for c = t{1}<br>disp(c);<br>end | for c in t<br>println(t)<br>end 

## String Interpolation
| Matlab (2020b) char array | Matlab (2020b) string | Julia (1.6) | Notes |
| ------------------------- | --------------------- | ----------- | ----- |
| sprintf('1 + 1 = %d', 1 + 1) | "1 + 1 is " + (1 + 1) | "1 + 1 is $(1 + 1)" | Result: "1 + 1 is 2"
| sprintf('Price is $%d', 1 + 1) | "Price is $" + (1 + 1) | "Price is \$$(1 + 1)" | Result: "Price is $2"
| compose('Price is $%d', [1; 2; 3])  | "Price is $" + [1; 2; 3] | "Price is \$" .* string.([1; 2; 3]) | Result:<br>"Price is $1"<br>"Price is $2"<br>"Price is \$3"<br>Julia needs to use element wise string conversion<br>Matlab char array returns 3x1 cell of chars
| | | "Price is \$" .* string([1; 2; 3]) | Result:<br>"Price is $[1, 2, 3]"<br>Julia returns best representation of vector as string
| sprintf('Price is $%d', [1; 2; 3]) | | join("Price is \$" .* string.([1; 2; 3])) | Result:<br>"Price is $1Price is $2Price is \$3"<br>Returns as 1 string

## String Comparison
| Matlab (2020b) char array | Matlab (2020b) string | Julia (1.6) | Notes |
| ------------------------- | --------------------- | ----------- | ----- |
| | "abracadabra" < "xylophone" | "abracadabra" < "xylophone" | Result: true
| strcmp('abracadabra', 'xylophone') | "abracadabra" == "xylophone" | "abracadabra" == "xylophone" | Result: false
| ~strcmp('Hello, world.', 'Goodbye, world.') | "Hello, world." ~= "Goodbye, world." | "Hello, world." != "Goodbye, world." | Result: true
| strncmp('abracadabra', 'abracad', 3) | strncmp("abracadabra", "abracad", 3) | first("abracadabra", 3) == first("abracad", 3) | Result: true
| strcmpi('abracadabra', 'ABracadabRA') | strcmpi("abracadabra", "ABracadabRA") | lowercase("abracadabra") == lowercase("ABracadabRA") | Result: true
| strncmpi('abracadabra', 'ABracad', 3) | strncmpi("abracadabra", "ABracad", 3) | first(lowercase("abracadabra"), 3) == first(lowercase("ABracad"), 3) | Result: true
| | matches(["Mercury","Venus","Earth","Mars"], "Earth") | ["Mercury","Venus","Earth","Mars"] .== "Earth" | Result: [false, false, true, false]<br>Note Julia uses element wise operator (.)
| | matches(["Mercury","Venus","Earth","Mars"], "earth", "IgnoreCase", true) | lowercase.(["Mercury","Venus","Earth","Mars"]) .== lowercase("earth") | Result: [false, false, true, false]<br>Note Julia uses element wise operator (.)
| | matches(["Mercury","Venus","Earth","Mars"], ["Earth", "Venus"]) | (["Mercury","Venus","Earth","Mars"] .== "Earth") .\| (["Mercury","Venus","Earth","Mars"] .== "Venus") | Result: [false, true, true, false]<br>Note Julia uses element wise operator (.)



# Function
<table>
  <tr>
    <th>Matlab (2020b)</th>
    <th>Julia (1.6)</th> 
    <th>Notes</th>
  </tr>
  <tr>
    <td><pre><code>
function output = func_basic(a, b)
    output = []
end
    </code></pre></td>
    <td><pre><code>
function func_basic(a, b)
    []
end
    </code></pre></td>
    <td>Basic function definition with two input arguments and one output</td>
  </tr>

</table>

# Operations

## Creating grid

## Linear Algebra

## Image Operation

