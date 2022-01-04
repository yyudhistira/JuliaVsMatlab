# License

This work is licensed under Creative Commons CC-BY-4.0 (c) Yasri Yudhistira and other contributors

Please refer to the following for more information
https://creativecommons.org/licenses/by/4.0/

# Contents
    1. [Types](##Types)
    2. [Literals](##Literals)
    3. [Type Conversion and Checking](##Type-conversion-and-checking)
    4. [Numerical operations](##Numerical-operations)
    5. [Comparison](##Comparison)
    6. [Logical Operations](##Logical-operations)
    7. [Complex Number Operations](##Complex-number-operations)
    8. [Bitwise Operations](##Bitwise-operations)
    9. [Updating Operations (only available in Julia)](##Updating-operations-only-available-in-Julia)

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
|  | \|=
|  | ⊻=
|  | >>>=
|  | >>=
|  | <<=

