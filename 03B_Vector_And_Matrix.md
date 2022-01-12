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
```matlab
% Matlab (2020b)
[]
```
```julia
# Julia (1.6)
[]
```

### Row vector
```matlab
% Matlab (2020b)
[1 2 3]
[1, 2, 3]
```
```julia
# Julia (1.6)
[1 2 3] # Matrix with 1 row
# 1×3 Matrix{Int64}:
#  1  2  3
```

### Column vector
```matlab
% Matlab (2020b)
[1; 2; 3]
```
```julia
# Julia (1.6)
[1; 2; 3]
[1, 2, 3] # comma in between makes it a vector (column)
# 3-element Vector{Int64}:
#  1
#  2
#  3

```

### Assignment
```matlab
% Matlab (2020b)
a = b % copy by value is the only assignment possible in matlab, although it is technically assigned by reference until change on `b` is requested.
```
```julia
# Julia (1.6)
a = copy(b) # copy by value
a = b # copy by reference
```

### Range of numbers
```matlab
% Matlab (2020b)
% Not really a concept of range of numbers as in Julia
```
```julia
# Julia (1.6)
1:3 # range of numbers between 1 to 3
1:2:10 # range of numbers between 1 to 10 with step of 2
```

### Explicit range of numbers
```matlab
% Matlab (2020b)
1:3 % [1 2 3]
1:2:10 % [1 3 5 7 9]
```
```julia
# Julia (1.6)
collect(1:3)' # Note a transpose to make dimension the same as matlab, which is row vector
collect(1:2:10)' # Note a transpose to make dimension the same as matlab, which is row vector
```

### NaN and Inf
```matlab
% Matlab (2020b)
nan(a)
NaN(a)
nan(a, b)
NaN(a, b)
inf(a)
Inf(a)
inf(a, b)
Inf(a, b)
```
```julia
# Julia (1.6)
repeat([NaN], a, a) # needs explicit dimension
repeat([NaN], a, b)
repeat([Inf], a, a) # needs explicit dimension
repeat([Inf], a, b)
```

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
```matlab
% Matlab (2020b)
[[1 2] [3 4]]
[[1, 2], [3, 4]]
```
```julia
# Julia (1.6)
# Concatenate without comma (,) or hcat. Comma will concatenate vector, see below examples
[[1 2] [3 4]]
hcat([1 2], [3 4])

#
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

### Vertical concatenation
```matlab
% Matlab (2020b)
[[1; 2], [3; 4]]
```
```julia
# Julia (1.6)
# Concatenate with semicolon (;) or vcat
# Result: [1; 2; 3; 4]
[[1, 2]; [3, 4]] # [1,2] and [3,4] are vertical vectors
[[1; 2]; [3; 4]]
vcat([1; 2], [3; 4])
vcat([1, 2], [3, 4])
```

### Horizontal concatenation of column vectors
```matlab
% Matlab (2020b)
[[1; 2], [3; 4]]
% ans =
% 
%      1     3
%      2     4
```
```julia
# Julia (1.6)
[[1; 2] [3; 4]] # do not use comma to append horizontally
[[1, 2] [3, 4]] # comma makes column vector
hcat([1; 2], [3; 4]) # or use hcat
# 2×2 Matrix{Int64}:
#  1  3
#  2  4

# Otherwise, using comma returns vector of vector
[[1; 2], [3; 4]]
# 2-element Vector{Vector{Int64}}:
#  [1, 2]
#  [3, 4]
```

### Concatenating range
```matlab
% Matlab (2020b)
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

```
```julia
# Julia (1.6)
# Range notation returns column vector instead of row vector in matlab
[(1:3)' (4:6)'] # Result: [1 2 3 4 5 6]

[1:3 4:6] # no comma to concatenate horizontally
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

### Expand matrix
```matlab
% Matlab (2020b)
A = [10  20  30; 60  70  80];
A(3, 4) = 1
% A =
% 
%     10    20    30     0
%     60    70    80     0
%      0     0     0     1
```
```julia
# Julia (1.6)
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

## Removal

### Remove single row
```matlab
% Matlab (2020b)
A = rand(3, 3)
A(2, :) = []
```
```julia
# Julia (1.6)
A = rand(3, 3)
A = A[1:end .!= 2, :]
```

### Remove single column
```matlab
% Matlab (2020b)
A = rand(3, 3)
A(:, 2) = []
```
```julia
# Julia (1.6)
A = rand(3, 3)
A = A[:, 1:end .!= 2]
```

### Remove multiple rows
```matlab
% Matlab (2020b)
A = rand(4, 4)
A([2, 3], :) = []
```
```julia
# Julia (1.6)
A = rand(4, 4)
A = A[setdiff(1:end, [2, 3]), :]
```

### Remove multiple rows and column
```matlab
% Matlab (2020b)
A = rand(4, 4)
A([2, 3], :) = []
A(:, 1) = [] % 2 steps removal, first row then column
```
```julia
# Julia (1.6)
A = rand(4, 4)
A = A[setdiff(1:end, [2, 3]), 1:end .!= 1]
```

### Remove dimension
```matlab
% Matlab (2020b)
% Remove all dimensions of length 1
A = rand(1, 2, 1, 3)
A = squeeze(A)
```
```julia
# Julia (1.6)
# Remove all dimensions of length 1
A = rand(1, 2, 1, 3)
dropdims(A, dims=tuple(findall(size(A) .== 1)...))

dropdims(A, dims=3) # remove dimension 3, if it has size 1
dropdims(A, dims=2) # error if dimension is not 1
# ERROR: ArgumentError: dropped dims must all be size 1
```

## Indexing

### Indexing bracket
```matlab
% Matlab (2020b)
X = A(I_1, I_2, ..., I_n) % Matlab uses normal bracket ()
% Note: A is n-dimensional array
```
```julia
# Julia (1.6)
X = A[I_1, I_2, ..., I_n] # Julia uses square bracket []
# Note: A is n-dimensional array
```

### Multi dimension indexing using range
```matlab
% Matlab (2020b)
A = rand(10, 10)
X = A(1:2:10, 2:2:10)
```
```julia
# Julia (1.6)
A = rand(10, 10)
X = A[1:2:10, 2:2:10] # difference in bracket used
```

### Select a few rows and a few columns
```matlab
% Matlab (2020b)
A = rand(5, 5)
A([1, 3], [4, 5])
```
```julia
# Julia (1.6)
A = rand(5, 5)
A[[1, 3], [4, 5]] # difference in bracket used
```

### Index with 'end' keyword
```matlab
% Matlab (2020b)
A = rand(5, 5)
A(2:3, 2:end-1)
```
```julia
# Julia (1.6)
A = rand(5, 5)
A[2:3, 2:end-1] # difference in bracket used
```

### Select no element
```matlab
% Matlab (2020b)
A = rand(5, 5)
A([])
```
```julia
# Julia (1.6)
A = rand(5, 5)
A[[]]
```

### Select specific row
```matlab
% Matlab (2020b)
A = rand(5, 5)
A(2, :)
```
```julia
# Julia (1.6)
A = rand(5, 5)
(A[2, :])' # Julia always return column vector, needs transpose to return as row vector
```

### Select specific column
```matlab
% Matlab (2020b)
A = rand(5, 5)
A(:, 2)
```
```julia
# Julia (1.6)
A = rand(5, 5)
A[:, 2] # Julia always return column vector
```

### Vectorizing matrix
```matlab
% Matlab (2020b)
A = rand(2, 3)
A(:)
```
```julia
# Julia (1.6)
A = rand(2, 3)
A[:]
```

### Indexing by boolean
```matlab
% Matlab (2020b)
A = rand(1, 4)
A([true, true, false, false]) % returns 1st and 2nd elements as row vector, since A is row vector

A = rand(4, 1)
A([true, true, false, false]) % returns 1st and 2nd elements as row vector, since A is column vector

```
```julia
# Julia (1.6)
A = rand(1, 4)
(A[[true, true, false, false]])' # return 1st and 2nd elements as row vector. Always returns column vector. To return back row vector, use transpose

A = rand(4, 1)
A[[true, true, false, false]] # return 1st and 2nd elements as row vector. Always returns column vector
```

### Assigning parts of matrix
```matlab
% Matlab (2020b)
% Number of element in X must be the same as the place in A to fill in
A(I_1, I_2, ..., I_n) = X
```
```julia
# Julia (1.6)
# Number of element in X must be the same as the place in A to fill in
A[I_1, I_2, ..., I_n] = X
A[I_1, I_2, ..., I_n] .= X
```

## Size and Shape

### Finding element type
```matlab
% Matlab (2020b)
class(A)
```
```julia
# Julia (1.6)
eltype(A)
```

### Number of element, dimension, shape
```matlab
% Matlab (2020b)
A = rand(2, 3)
numel(A)   % Result 6
length(A)  % Result 3 (largest dimension)
ndims(A)   % Result 2
size(A)    % Result [2, 3]
size(A, 1) % Result 2
size(A, 2) % Result 3
```
```julia
# Julia (1.6)
A = rand(2, 3)
length(A)  # Result 6
ndims(A)   # Result 2
size(A)    # Result (2, 3) tuple
size(A, 1) # Result 2
size(A, 2) # Result 3
```

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
```matlab
% Matlab (2020b)
A = rand(4, 1)
sort(A)
sort(A, 'descend') % sort descending

sort(A, 1) % works on vector and matrix
sort(A, 2) % works on vector and matrix
```
```julia
# Julia (1.6)
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

### Outputing index of the sorted matrix
```matlab
% Matlab (2020b)
A = rand(4, 1)
[B, idx] = sort(A)

A = rand(4, 3)
[B, idx] = sort(A) % also works on matrix
```
```julia
# Julia (1.6)
A = rand(4)
idx = sortperm(A)
B = A[idx]

A = rand(4, 3)
idx = sortperm(A) # Throw error on matrix
# ERROR: MethodError: no method matching sortperm(::Matrix{Float64})
```

### Sort matrix by rows
```matlab
% Matlab (2020b)
A = rand(4, 3)
sortrows(A, 1) % sort on first column
sortrows(A, 2) % sort on 2nd column
sortrows(A, [1, 3]) % sort on first column then 3rd column
```
```julia
# Julia (1.6)
A = rand(4, 3)

# sort on first column
sortslices(A, dims=1, lt=(x, y)->isless(x[1], y[1]))

# sort on 2nd column
sortslices(A, dims=1, lt=(x, y)->isless(x[2], y[2]))

# sort on first column then 3rd column
sortslices(A, dims=1, lt=(x, y)->(isless(x[1], y[1]) || (isequal(x[1], y[1]) && isless(x[3], y[3]))))
```

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
```matlab
% Matlab (2020b)
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
```julia
# Julia (1.6)
x = rand(4, 1)
sin(x) # ERROR: MethodError: no method matching sin(::Vector{Float64})
sin.(x) # must use element wise operation if x is vector or matrix

a = rand(4, 3)
b = rand(4, 3)
max(a, b) # ERROR: MethodError: no method matching isless(::Matrix{Float64}, ::Matrix{Float64})
max.(a, b) # must use element wise operation if a and b is vector or matrix
```

### Element wise operation on comparison (example)
```matlab
% Matlab (2020b)
a = rand(4, 1)
a == a % return [true, true, true, true]

b = a
b(3) = a(3) - 1
a == b % return [true, true, false, true]
a > b % return [false, false, true, false]
```
```julia
# Julia (1.6)
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

## Comprehension

### Sum a series
```matlab
% Matlab (2020b)
sum(1 ./ ((1:1000) .^ 2))
```
```julia
# Julia (1.6)
sum(1/n^2 for n=1:1000)
```

### Weighted average of current element and its left and right neighbor along a 1-d grid
```matlab
% Matlab (2020b)
x = rand(4, 1)
arrayfun(@(x, y, z) 0.25*x + 0.5*y + 0.25*z, x(1:end-2), x(2:end-1), x(3:end))
```
```julia
# Julia (1.6)
x = rand(4, 1)
[ 0.25*x[i-1] + 0.5*x[i] + 0.25*x[i+1] for i=2:length(x)-1 ]
```

### Loop and filter
```matlab
% Matlab (2020b)
% must use for loop
output = [];
for i = 1:3
  for j = 1:i
    if i+j == 4
      output = [output; i, j];
    end
  end
end
```
```julia
# Julia (1.6)
# use list comprehension
[(i,j) for i=1:3 for j=1:i if i+j == 4]
# 2-element Vector{Tuple{Int64, Int64}}:
#  (2, 2)
#  (3, 1)
```

### Functional programming
```matlab
% Matlab (2020b)
```
```julia
# Julia (1.6)
map(tuple, (1/(i+j) for i=1:2, j=1:2), [1 3; 2 4])
# 2×2 Matrix{Tuple{Float64, Int64}}:
# (0.5, 1)       (0.333333, 3)
# (0.333333, 2)  (0.25, 4)
```

## Broadcasting

### Expansion of matrix of different column size
```matlab
% Matlab (2020b)
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
```julia
# Julia (1.6)
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

### Expansion of matrix of different size
```matlab
% Matlab (2020b)
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
```julia
# Julia (1.6)
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
