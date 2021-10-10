# JuliaForMatlabUsers
Julia programming cheat sheet if you already know Matlab

# License

This work is licensed under Creative Commons CC-BY-4.0

Please refer to the following for more information
https://creativecommons.org/licenses/by/4.0/

# Contents
1. [Basic programming](#Basic-programming)
2. [Variables](#Variables)

# Basic programming
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

# Integer, Floating-Point and Boolean Types

## Types
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
|                | Float16
| double         | Float32
| single         | Float64
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
| true          | true        | boolean true literal
| false         | false        | boolean false literal
| nan or NaN    | NaN         | Not a number |
| inf or Inf    | Inf         | Infinity, can be -Inf or +Inf for negative and positive infinity respectively

## Type conversion and checking
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| uint8(2.0)    | UInt8(2.0)  | Convert to uint8 from float. Use similar function to convert from one type to another |
| class(a)      | typeof(a) | Find the type of variable `a` |
| isnan, isinf, isinteger, isreal, isfinite, isnumeric | isnan, isinf, isinteger, isreal, isfinite, isnumeric | Same functionality
| isfloat      | isreal

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
| rand(m)          | rand(m, m)
| rand(m, n)       | rand(m, n)
| randn(m)         | randn(m, m)
| randn(m, n)      | randn(m, n)
| true(m)          | trues(m, m)
| true(m, n)       | trues(m, n)
| false(m)         | falses(m, m)
| false(m, n)      | falses(m, n)
| nan(m) or NaN(m) | repeat([NaN], m, m)
| nan(m, n) or NaN(m, n) | repeat([NaN], m, n)
| inf(m) or Inf(m) | repeat([Inf], m, m)
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

## Resize and reshape
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| reshape(A, 3, 2) | reshape(A, 3, 2) | an array containing the same data as A, but with different dimensions
| reshape(A, [], 1) | reshape(A, :, 1) | reshape into column vector
| reshape(A, 1, []) | reshape(A, 1, :) | reshape into row vector
| sort(A, 2) | sort(A, dims=2) | Sort array elements on 2nd dimension
| sort(A, 'descend') | sort(A, rev=true) | Sort array elements from high to low
| sortrows | | Sort rows of matrix or table
| flip | | Flip order of elements
| fliplr | | Flip array left to right
| flipud | | Flip array up to down
| rot90 | | Rotate array 90 degrees
| transpose | | Transpose vector or matrix
| ctranspose | | Complex conjugate transpose
| permute | | Permute array dimensions
| ipermute | | Inverse permute array dimensions
| circshift | | Shift array circularly
| shiftdim | | Shift array dimensions
| squeeze | | Remove dimensions of length 1


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

## Element wise operation
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
| max(a, b) or arrayfun(@(x, y) max(x,y), a, b) | element wise max, return same dimension as a and b. Julia max(a, b) will throw error when a and b are arrays
| a == b or arrayfun(@(x, y) x == y, a, b)| a .== b | element wise equality comparison, return same dimension as a and b. Julia a == b will do all(a .== b) when a and b are arrays
| a > b or arrayfun(@(x, y) x > y, a, b)| a .> b | element wise greater than comparison. Same rule as above. Same as other operators as .< .!= .≈ (isapprox), .≉

## Comprehension
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |

## Broadcasting

## Creating grid

# Operations

## Number Operations
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

## Bitwise operation
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| bitcmp(x)     |  ~x | bitwise not
| bitand(x, y)  | x & y | bitwise and
| bitor(x, y)   | x | y | bitwise or
| bitxor(x, y)  | x ⊻ y | bitwise xor (exclusive or)
| bitshift(x, -y) | x >>> y | logical shift right. In matlab if x is negative it turns into arightmatic shift right.
|               | x >> y | arithmetic shift right
| bitshift(x, y) | x << y | logical/arithmetic shift left

## Updating operations (only available in Julia)
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

### Logical Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| ~x            | !x          | negation
| x && y        | x && y      | logical shortcut and
| x || y        | x || y      | logical shortcut or

### String Types
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| char           | Char
| string         | String

### String Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| s = 'hello world'; | s = "hello world"; | With matlab char array
| s = 'hello "alien" world'; | s = "hello world"; | With matlab char array
| s = "hello world"; | s = "hello world"; | With matlab string

## Function
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

