# Main Page
[Back to main page](README.md)

# Contents
1. [Creation](##Creation)
2. [Combination](##Combination)
3. [Removal](##Removal)
4. [Indexing](##Indexing)
5. [Size and Shape](##Size-and-shape)
6. [Resize and Reshape](##Resize-and-reshape)
7. [Element Wise Operations](##Element-wise-operations)
8. [Comprehension](##Comprehension)
9. [Broadcasting](##Broadcasting)

# Vector and Matrix

## Creation

### Empty vector
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6)</th></tr>
<tr>
<td valign="top">

```matlab
[]
```
</td>
<td valign="top">

```julia
[]
```
</td>
</tr>
</table>

### Row vector
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6)</th></tr>
<tr>
<td valign="top">

```matlab
[1 2 3]
[1, 2, 3]
```
</td>
<td valign="top">

```julia
[1 2 3] # Matrix with 1 row
# 1×3 Matrix{Int64}:
#  1  2  3
```
</td>
</tr>
</table>

### Column vector
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6)</th></tr>
<tr>
<td valign="top">

```matlab
[1; 2; 3]
```
</td>
<td valign="top">

```julia
[1; 2; 3]

# comma in between makes it a vector (column)
[1, 2, 3]
# 3-element Vector{Int64}:
#  1
#  2
#  3

```
</td>
</tr>
</table>

### Assignment
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% copy by value
a = b
```
copy by value is the only assignment possible in matlab, although it is technically assigned by reference until change on `b` is requested.
</td>
<td valign="top">

```julia
# copy by value
a = copy(b)

# copy by reference
a = b
```
</td>
</tr>
</table>

### Range of numbers
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">
Not really a concept of range of numbers as in Julia
</td>
<td valign="top">

```julia
# range of numbers between 1 to 3
1:3

# range of numbers between 1 to 10 with step of 2
1:2:10
```
</td>
</tr>
</table>

### Explicit range of numbers
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
1:3 % [1 2 3]

1:2:10 % [1 3 5 7 9]
```
</td>
<td valign="top">

```julia
collect(1:3)'

collect(1:2:10)'

# Note: transpose (') to make same dimension as in matlab, which is row vector, since collect returns column vector
```
</td>
</tr>
</table>

### NaN and Inf
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
nan(a)
NaN(a)

nan(a, b)
NaN(a, b)

inf(a)
Inf(a)

inf(a, b)
Inf(a, b)
```
</td>
<td valign="top">

```julia
# needs explicit dimension
repeat([NaN], a, a)

repeat([NaN], a, b)


# needs explicit dimension
repeat([Inf], a, a)

repeat([Inf], a, b)
```
</td>
</tr>
</table>

### Built in functions
| Matlab (2020b)   | Julia (1.6)        | Notes |
| ---------------- | ------------------ | ----- |
| zeros(m)         | zeros(m, m)
| zeros(m, n)      | zeros(m, n)
| uint8(zeros(m))  | zeros(UInt8, m, m) | zero numbers with defined type, e.g. UInt8
| uint8([0 0 0]])  | UInt8[0 0 0]       | zero numbers with defined type, e.g. UInt8
| ones(m)          | ones(m, m)         | Types can also be specified, see zeros
| ones(m, n)       | ones(m, n)         | Types can also be specified, see zeros
| a = eye(m)       | a = I(m)           | Identity matrix, needs `using LinearAlgebra` in Julia
| diag(x)          | Diagonal(x)        | create diagonal matrix
| rand(m)          | rand(m, m)         | Julia needs explicit dimension
| rand(m, 1)       | rand(m)            | Julia returns column vector
| rand(m, 1)       | rand(m, 1)         | Julia returns matrix size (m, 1)
| rand(m, n)       | rand(m, n)
| randn(m)         | randn(m, m)        | Julia needs explicit dimension
| randn(m, n)      | randn(m, n)
| true(m)          | trues(m, m)        | Julia needs explicit dimension
| true(m, n)       | trues(m, n)
| false(m)         | falses(m, m)       | Julia needs explicit dimension
| false(m, n)      | falses(m, n)

## Combination

### Horizontal concatenation
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Concatenate without comma (,)
[[1 2] [3 4]]

% Concatenate with horzcat
horzcat([1 2], [3 4])

% Concatenate with comma (,)
[[1, 2], [3, 4]]
```
</td>
<td valign="top">

```julia
# Concatenate without comma (,)
[[1 2] [3 4]]

# Concatenate with hcat
hcat([1 2], [3 4])

# Concatenating with comma will concatenate vectors
[[1 2], [3 4]]
# 2-element Vector{Matrix{Int64}}:
#  [1 2]
#  [3 4]

[[1; 2], [3; 4]]
# 2-element Vector{Vector{Int64}}:
#  [1, 2]
#  [3, 4]

[[1, 2], [3, 4]]
# 2-element Vector{Vector{Int64}}:
#  [1, 2]
#  [3, 4]
```
</td>
</tr>
</table>

### Vertical concatenation
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Concatenate with semicolon (;)
[[1; 2], [3; 4]]

% Concatenate with vertcat
vertcat([1; 2], [3; 4])
```
</td>
<td valign="top">

```julia
# Concatenate with semicolon (;)
[[1; 2]; [3; 4]]

# Concatenate with vcat
vcat([1; 2], [3; 4])

# [1,2] and [3,4] are column vectors
[[1, 2]; [3, 4]]
vcat([1, 2], [3, 4])
# 4-element Vector{Int64}:
#  1
#  2
#  3
#  4
```
</td>
</tr>
</table>

### Horizontal concatenation of column vectors
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Comma or space to append horizontally
[[1; 2] [3; 4]]
[[1; 2], [3; 4]]

horzcat([1; 2], [3; 4])

% All above will return the same
% ans =
% 
%      1     3
%      2     4
```
</td>
<td valign="top">

```julia
# DO NOT use comma to append horizontally
# comma makes column vector
[[1; 2] [3; 4]]
[[1, 2] [3, 4]] 

hcat([1; 2], [3; 4])

# All above will return the same
# 2×2 Matrix{Int64}:
#  1  3
#  2  4

# Otherwise, using comma returns vector of vector
[[1; 2], [3; 4]]
# 2-element Vector{Vector{Int64}}:
#  [1, 2]
#  [3, 4]
```
</td>
</tr>
</table>

### Concatenating range
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
[1:3, 4:6] % Result: [1 2 3 4 5 6]

[(1:3)', (4:6)']
% ans =
% 
%      1     4
%      2     5
%      3     6

[1:3, 4:6]' % With transpose
% ans =
% 
%      1
%      2
%      3
%      4
%      5
%      6

[(1:3)'; (4:6)'] % With transpose
% ans =
% 
%      1
%      2
%      3
%      4
%      5
%      6

```
</td>
<td valign="top">

```julia
# Range notation returns column vector, tranpose is needed
# No comma to concatenate horizontally
[(1:3)' (4:6)'] # Result: [1 2 3 4 5 6]

[1:3; 4:6]' # Result: [1 2 3 4 5 6]

[1:3 4:6]
# 3×2 Matrix{Int64}:
#  1  4
#  2  5
#  3  6

[1:3; 4:6]
# 6-element Vector{Int64}:
#  1
#  2
#  3
#  4
#  5
#  6

# Comma returns vector of range, instead of the individual numbers
[1:3, 4:6]
#2-element Vector{UnitRange{Int64}}:
# 1:3
# 4:6
```
</td>
</tr>
</table>

### Expand matrix
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = [10  20  30; 60  70  80];
A(3, 4) = 1
% A =
% 
%     10    20    30     0
%     60    70    80     0
%      0     0     0     1
```
</td>
<td valign="top">

```julia
# expanding matrix in Julia is done by initializing matrix with larger size, and copy the first few elements into it
A = [10  20  30; 60  70  80];
B = zeros(eltype(A), 3, 4);
B[1:2, 1:3] = A;
A = B;
A[3,4] = 1;
A
# 3×4 Matrix{Int64}:
#  10  20  30  0
#  60  70  80  0
#   0   0   0  1

# Directly expanding matrix result in error
A = [10  20  30; 60  70  80];
A[3,4] = 1;
# ERROR: BoundsError: attempt to access 2×3 Matrix{Int64} at index [3, 4]
```
</td>
</tr>
</table>

## Removal

### Remove single row
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(3, 3)
A(2, :) = []
```
</td>
<td valign="top">

```julia
A = rand(3, 3)
A = A[1:end .!= 2, :]
```
</td>
</tr>
</table>

### Remove single column
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Matlab (2020b)
A = rand(3, 3)
A(:, 2) = []
```
</td>
<td valign="top">

```julia
# Julia (1.6)
A = rand(3, 3)
A = A[:, 1:end .!= 2]
```
</td>
</tr>
</table>

### Remove multiple rows
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(4, 4)
A([2, 3], :) = []
```
</td>
<td valign="top">

```julia
A = rand(4, 4)
A = A[setdiff(1:end, [2, 3]), :]
```
</td>
</tr>
</table>

### Remove multiple rows and column
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(4, 4)

% 2 steps removal, first row then column
A([2, 3], :) = []
A(:, 1) = []
```
</td>
<td valign="top">

```julia
A = rand(4, 4)

A = A[setdiff(1:end, [2, 3]), 1:end .!= 1]
```
</td>
</tr>
</table>

### Remove dimension
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(1, 2, 1, 3)

% Remove all dimensions of length 1
A = squeeze(A)
```
</td>
<td valign="top">

```julia
A = rand(1, 2, 1, 3)

# Remove all dimensions of length 1
dropdims(A, dims=tuple(findall(size(A) .== 1)...))

# remove dimension 3, if it has size 1
dropdims(A, dims=3)

# error if dimension to be removed is not 1
dropdims(A, dims=2)
# ERROR: ArgumentError: dropped dims must all be size 1
```
</td>
</tr>
</table>


## Indexing

### Indexing bracket
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Matlab uses normal bracket ()
X = A(I_1, I_2, ..., I_n)

% Note: A is n-dimensional array
```
</td>
<td valign="top">

```julia
# Julia uses square bracket []
X = A[I_1, I_2, ..., I_n]

# Note: A is n-dimensional array
```
</td>
</tr>
</table>

### Multi dimension indexing using range
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(10, 10)

% Matlab uses normal bracket ()
X = A(1:2:10, 2:2:10)
```
</td>
<td valign="top">

```julia
A = rand(10, 10)

# Julia uses square bracket []
X = A[1:2:10, 2:2:10]
```
</td>
</tr>
</table>

### Select a few rows and a few columns
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(5, 5)

% Matlab uses normal bracket ()
A([1, 3], [4, 5])
```
</td>
<td valign="top">

```julia
A = rand(5, 5)

# Julia uses square bracket []
A[[1, 3], [4, 5]]
```
</td>
</tr>
</table>


### Index with 'end' keyword
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(5, 5)

A(2:3, 2:end-1)
```
</td>
<td valign="top">

```julia
A = rand(5, 5)

A[2:3, 2:end-1]
```
</td>
</tr>
</table>

### Select no element
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(5, 5)

A([])
```
</td>
<td valign="top">

```julia
A = rand(5, 5)

A[[]]
```
</td>
</tr>
</table>

### Select specific row
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(5, 5)

A(2, :)
```
</td>
<td valign="top">

```julia
A = rand(5, 5)

(A[2, :])'
# Julia always returns column vector, needs transpose
```
</td>
</tr>
</table>

### Select specific column
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(5, 5)

A(:, 2)
```
</td>
<td valign="top">

```julia
A = rand(5, 5)

A[:, 2]
```
</td>
</tr>
</table>

### Vectorizing matrix
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(2, 3)

A(:)
```
</td>
<td valign="top">

```julia
A = rand(2, 3)

A[:]
```
</td>
</tr>
</table>

### Indexing by boolean
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(1, 4)
A([true, true, false, false])
% returns as row vector, since A is row vector

A = rand(4, 1)
A([true, true, false, false])
% returns as column vector, since A is column vector
```
</td>
<td valign="top">

```julia
A = rand(1, 4)
(A[[true, true, false, false]])'
# Always returns column vector regardless of A size. Needs transpose to get row vector

A = rand(4, 1)
A[[true, true, false, false]]
# Always returns column vector regardless of A size.
```
</td>
</tr>
</table>

### Assigning parts of matrix
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Number of element in X must be the same as the place in A to fill in
A(I_1, I_2, ..., I_n) = X
```
</td>
<td valign="top">

```julia
# Number of element in X must be the same as the place in A to fill in
A[I_1, I_2, ..., I_n] = X

# Also uses dot notation
A[I_1, I_2, ..., I_n] .= X
```
</td>
</tr>
</table>

## Size and Shape

### Finding element type
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
class(A)
```
</td>
<td valign="top">

```julia
eltype(A)
```
</td>
</tr>
</table>

### Number of element, dimension, shape
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(2, 3)
numel(A)   % Result 6
length(A)  % Result 3 (largest dimension)
ndims(A)   % Result 2
size(A)    % Result [2, 3]
size(A, 1) % Result 2
size(A, 2) % Result 3
```
</td>
<td valign="top">

```julia
A = rand(2, 3)
length(A)  # Result 6
ndims(A)   # Result 2
size(A)    # Result (2, 3) tuple
size(A, 1) # Result 2
size(A, 2) # Result 3
```
</td>
</tr>
</table>

### Testing matrix
```julia
# Julia (1.6)

# matlab isempty(A)
isempty(A)

# matlab isscalar(A)
isa(A, Union{Number, AbstractString, Char, Bool})

# matlab issorted(A)
issorted(A)

# matlab isvector(A)
isa(A, Array) && (sum(size(A) .!= 1) <= 1)

# matlab ismatrix(A)
isa(A, Union{Array, Matrix}) && (sum(size(A) .!= 1) > 1)

# matlab isrow(A)
isa(A, Union{Array, Matrix}) && (sum((size(A) .!= 1)[setdiff(1:ndims(A), 2)]) == 0)

# matlab iscolumn(A)
isa(A, Union{Array, Matrix}) && (ndims(A) == 1 || sum(size(A)[2:end] .!= 1) == 0)
```

### Functions not available in Matlab
| Julia (1.6)  | Notes |
| ------------ | ----- |
| axes(A)      | a tuple containing the valid indices of A
| axes(A, n)   | a range expressing the valid indices along dimension n
| eachindex(A) | an efficient iterator for visiting each position in A
| stride(A, k) | the stride (linear index distance between adjacent elements) along dimension k
| strides(A)   | a tuple of the strides in each dimension

## Resize and Reshape
| Matlab (2020b)        | Julia (1.6)                               | Notes |
| --------------------- | ----------------------------------------- | ----- |
| reshape(A, 3, 2)      | reshape(A, 3, 2)                          | Reshape into different dimension
| reshape(A, [], 1)     | reshape(A, :, 1)                          | reshape into column vector
| reshape(A, 1, [])     | reshape(A, 1, :)                          | reshape into row vector
| transpose(A)          | transpose(A)                              | Transpose vector or matrix
| A'<br>ctranspose(A)   | A'<br>adjoint(A)                          | Complex conjugate transpose
| flip(A)               | reverse(A, dims=1)                        | Flip order of elements
| flip(A, 2)            | reverse(A, dims=2)                        | Flip order of elements in 2nd dimension
| rot90(A)              | rotl90(A)                                 | Rotate array 90 degrees counterclockwise (left)
| rot90(A, 3)           | rotl90(A, 3)<br>rotr90(A)                 | Rotate array 270 degrees counterclockwise (left) or 90 degree clockwise (right)
| rot90(A, 2)           | rotl90(A, 2)<br>rotr90(A, 2)<br>rot180(A) | Rotate array 180 degrees
| permute(A, [m, n, p]) | permutedims(A, (m, n, p))                 | Permute array dimensions
| circshift(A, n)       | circshift(A, n)                           | Shift array circularly
| circshift(A, n, m)    | circshift(A, (n, m))                      | Shift matrix circularly. Julia uses tuple
| shiftdim(A)           |                                           | Shift array dimensions

## Sort

### Sorting vector and matrix
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(4, 1)

sort(A)
sort(A, 'descend') % sort descending

sort(A, 1) % works on vector and matrix
sort(A, 2) % works on vector and matrix
```
</td>
<td valign="top">

```julia
A = rand(4)

sort(A)
sort(A, rev=true) # sort descending

sort(A, dims=1) # error on using dimension on vector
# ERROR: MethodError: no method matching sort!(::Vector{Float64}; dims=1)

A = rand(4, 1) # this will return matrix, not vector
sort(A) # this will fail
# ERROR: UndefKeywordError: keyword argument dims not assigned

sort(A, dims=1) # This will work. Julia needs explicit dimension for matrix
sort(A, dims=2) # This will work. Julia needs explicit dimension for matrix
```
</td>
</tr>
</table>

### Outputing index of the sorted matrix
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(4, 1)
[B, idx] = sort(A)

A = rand(4, 3)
[B, idx] = sort(A) % also works on matrix
```
</td>
<td valign="top">

```julia
A = rand(4)
idx = sortperm(A)
B = A[idx]

A = rand(4, 3)
idx = sortperm(A) # Throw error on matrix
# ERROR: MethodError: no method matching sortperm(::Matrix{Float64})
```
</td>
</tr>
</table>

### Sort matrix by rows
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
A = rand(4, 3)

% sort on first column
sortrows(A, 1)

% sort on 2nd column
sortrows(A, 2)

% sort on first column then 3rd column
sortrows(A, [1, 3])
```
</td>
<td valign="top">

```julia
A = rand(4, 3)

# sort on first column
sortslices(A, dims=1, lt=(x, y)->isless(x[1], y[1]))

# sort on 2nd column
sortslices(A, dims=1, lt=(x, y)->isless(x[2], y[2]))

# sort on first column then 3rd column
sortslices(A, dims=1, lt=(x, y)->(isless(x[1], y[1]) || (isequal(x[1], y[1]) && isless(x[3], y[3]))))
```
</td>
</tr>
</table>

## Element Wise Operations
| Matlab (2020b) | Julia (1.6)     | Notes |
| -------------- | --------------- | ----- |
| +x             | +x              | unary plus
| -x             | -x              | element wise negation
| x + y          | x + y<br>x .+ y | element wise addition. If x and y has the same number of element but different dimension, for example x is row vector and y is column vector, then x + y in Julia gives the same answer in Matlab. Otherwise x + y in Julia throws error and Matlab do auto expansion.
| x - y          | x - y<br>x .- y | element wise subtraction. Same rule as .+ see above
| x .* y         | x .* y          | element wise multiplication
| x ./ y         | x ./ y          | element wise division
| floor(x ./ y)  | x .÷ y          | element wise integer divide truncated to an integer
| x .\ y         | x .\ y          | element wise inverse divide equivalent to y / x
| x .^ y         | x .^ y          | element wise raises x to the yth power
| arrayfun(f, x) | f.(x)           | element wise f. Sometimes f(x) in matlab gives the same result when x is array

### Element wise operation on function (example)
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
x = rand(4, 1)

% works for both x as number or as vector
sin(x)
arrayfun(@sin, x)

a = rand(4, 3)
b = rand(4, 3)

% works for both x as number or as vector
max(a, b)
arrayfun(@(x, y) max(x,y), a, b)

```
</td>
<td valign="top">

```julia
x = rand(4, 1)

sin(x) # ERROR: MethodError: no method matching sin(::Vector{Float64})
sin.(x) # must use element wise operation if x is vector or matrix

a = rand(4, 3)
b = rand(4, 3)

max(a, b) # ERROR: MethodError: no method matching isless(::Matrix{Float64}, ::Matrix{Float64})
max.(a, b) # must use element wise operation if a and b is vector or matrix
```
</td>
</tr>
</table>

### Element wise operation on comparison (example)
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
a = rand(4, 1)

a == a % return [true, true, true, true]

b = a
b(3) = a(3) - 1

a == b % return [true, true, false, true]

a > b % return [false, false, true, false]
```
</td>
<td valign="top">

```julia
a = rand(4, 1)

a == a # return true, equivalent with all(a .== a)
a .== a # return [true, true, true, true]

b = copy(a)
b[3] = a[3] - 1

a == b # return false
a .== b # return [true, true, false, true]

a > b # ERROR: MethodError: no method matching isless(::Matrix{Float64}, ::Matrix{Float64})
a .> b # return [false, false, true, false]
```
</td>
</tr>
</table>

## Comprehension

### Sum a series
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
sum(1 ./ ((1:1000) .^ 2))
```
</td>
<td valign="top">

```julia
sum(1/n^2 for n=1:1000)
```
</td>
</tr>
</table>

### Weighted average of current element and its left and right neighbor along a 1-d grid
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
x = rand(4, 1)

arrayfun(@(x, y, z) 0.25*x + 0.5*y + 0.25*z, x(1:end-2), x(2:end-1), x(3:end))
```
</td>
<td valign="top">

```julia
x = rand(4, 1)

[ 0.25*x[i-1] + 0.5*x[i] + 0.25*x[i+1] for i=2:length(x)-1 ]
```
</td>
</tr>
</table>

### Loop and filter
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% use for loop
output = [];
for i = 1:3
  for j = 1:i
    if i+j == 4
      output = [output; i, j];
    end
  end
end
```
</td>
<td valign="top">

```julia
# use list comprehension
[(i,j) for i=1:3 for j=1:i if i+j == 4]
# 2-element Vector{Tuple{Int64, Int64}}:
#  (2, 2)
#  (3, 1)
```
</td>
</tr>
</table>

### Functional programming
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

</td>
<td valign="top">

```julia
map(tuple, (1/(i+j) for i=1:2, j=1:2), [1 3; 2 4])
# 2×2 Matrix{Tuple{Float64, Int64}}:
# (0.5, 1)       (0.333333, 3)
# (0.333333, 2)  (0.25, 4)
```
</td>
</tr>
</table>

## Broadcasting

### Expansion of matrix of different column size
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
a = rand(2,1)
A = rand(2,3)

a + A % matlab perform auto expansion
% a =
% 
%     0.7757
%     0.4868
% 
% 
% A =
% 
%     0.4359    0.3063    0.5108
%     0.4468    0.5085    0.8176
% 
% 
% ans =
% 
%     1.2116    1.0821    1.2865
%     0.9336    0.9953    1.3044
```
</td>
<td valign="top">

```julia
a = rand(2,1)
A = rand(2,3)

broadcast(+, a, A) # needs explicit broadcast
# 2×1 Matrix{Float64}:
#  0.4355140727705087
#  0.3300976619630358
# 
# 2×3 Matrix{Float64}:
#  0.180913  0.490403  0.523406
#  0.786117  0.438144  0.310452
# 
# 2×3 Matrix{Float64}:
#  0.616427  0.925917  0.95892
#  1.11622   0.768242  0.64055
```
</td>
</tr>
</table>

### Expansion of matrix of different size
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
a = rand(2,1)
b = rand(1,2)

a + b % matlab perform auto expansion
% a =
% 
%     0.7948
%     0.6443
% 
% 
% b =
% 
%     0.3786    0.8116
% 
% 
% ans =
% 
%     1.1734    1.6064
%     1.0229    1.4559
```
</td>
<td valign="top">

```julia
a = rand(2,1)
b = rand(1,2)

broadcast(+, a, b) # needs explicit broadcast
# 2×1 Matrix{Float64}:
#  0.7805359041834159
#  0.21249440551207988
# 
# 1×2 Matrix{Float64}:
#  0.986313  0.57324
# 
# 2×2 Matrix{Float64}:
#  1.76685  1.35378
#  1.19881  0.785735
```
</td>
</tr>
</table>
