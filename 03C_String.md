# Main Page
[Back to main page](index.md)

# Contents
1. [String Types](##String-types)
2. [Char Operations](##Char-operations)
3. [String Creation and Concatenation](##String-creation-and-concatenation)
4. [String Conversion](##String-conversion)
5. [String Testing](##String-testing)
6. [String Indexing](##String-indexing)
7. [String Interpolation](##String-interpolation)
8. [String Comparison](##String-comparison)

# String

## String Types
| Matlab (2020b)   | Julia (1.6) | Notes |
| ---------------- | ----------- | ----- |
| `char`           | `Char`
| `string`         | `String`

## Char Operations
| Matlab (2020b)      | Julia (1.6)    | Notes |
| ------------------- | -------------- | ----- |
| `c = 'hello'`       | `c = ['h', 'e', 'l', 'l', 'o']`
| `d = double(c)`     | `d = Float64.(c)`
| `a = char(d)`       | `a = Char.(d)`
| `'x' - 'a'`         | `'x' - 'a'`    | Result: 23
| `'A' + 1`           | `Int('A' + 1)` | Result: 66
| `char('A' + 1)`     | `'A' + 1`      | Result: 'B'
| `'A' <= 'X' <= 'Z'` | `'A' <= 'X' <= 'Z'` | Result: true
| `"A" <= "X" <= "Z"` | `'A' <= 'X' <= 'Z'` | Result: true

## String Creation and Concatenation
### Creation
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array
s = 'hello world'

w = sprintf('hello "alien" world\n')
% Result: hello "alien" world
% \n as newline must be in sprintf
% otherwise it is interpreted as two chars \ and n

v = sprintf('hello ''alien'' world\n')
% Result: hello 'alien' world
% Single quote use two single quotes

%% With string
s = "hello world"

w = "hello ""alien"" world" + sprintf('\n')
% Result: hello "alien" world
% \n as newline must be in sprintf
% otherwise it is interpreted as two chars \ and n
% double quote use two double quotes

v = "hello 'alien' world" + sprintf('\n')
% Result: hello 'alien' world

```
</td>
<td valign="top">

```julia
s = "hello world";

w = "hello \"alien\" world\n";
# \ as escape character

w = "hello 'alien' world\n";

w = """hello "alien" world\n""";
# Julia can use triple quotes

ll = """This is multiline
string""";
# Long multiline string with triple quotes
```
</td>
</tr>
</table>

### Repetition
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

blanks(5)
% Returns: '     '
% Only generates char array, not string

repmat('a', 1, 5)
% Returns: 'aaaaa'

repmat('hello', 1, 5)
% Returns 'hellohellohellohellohello'

%% With string

string(repmat('a', 1, 5))
% Returns "aaaaa"
% Convert from char

repmat("a", 1, 5)
%  1×5 string array
%
%    "a"    "a"    "a"    "a"    "a"
% Directly using repmat on string creates string array

string(repmat('hello', 1, 5))
% Returns "hellohellohellohellohello"
% Convert from char

repmat("hello", 1, 5)
%   1×5 string array
% 
%     "hello"    "hello"    "hello"    "hello"    "hello"
% Directly using repmat on string creates string array
```
</td>
<td valign="top">

```julia
blanks(5)
# Returns "     "

"a" ^ 5
# Returns "aaaaa"

"hello" ^ 5
# Returns "hellohellohellohellohello"
```
</td>
</tr>
</table>

### String Concatenation
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array
ss = ['hello', 'world']

strcat(' a ', ' b ')
% Result: ' a b'
% Matlab strcat with char removes right spaces

%% With string
ss = "hello" + "world"

["Red" "Blue" "Green"] + ["Truck" "Sky" "Tree"]
% Result: "RedTruck" "BlueSky" "GreenTree"

strcat(" a ", " b ")
% Result: " a b "
% Matlab strcat with string concatenates all characters

append(" a ", " b ")
% Result: " a b "
% Same behavior as +
```
</td>
<td valign="top">

```julia
ss = "hello" * "world";
# Julia uses * for string concatenation

["Red" "Blue" "Green"] .* ["Truck" "Sky" "Tree"]
# Result: "RedTruck" "BlueSky" "GreenTree"

rstrip(" a ") * rstrip(" b ")
# Same output as strcat(' a ', ' b ') with char array

" a " * " b "
# Same output as strcat(" a ", " b ") with string
```
</td>
</tr>
</table>

### Join
#### Result "applesbananaspineapples". Matlab default delimiter is " ". Julia default delimiter is ""
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
join(["apples", "bananas", "pineapples"], "")
```
</td>
<td valign="top">

```julia
join(["apples", "bananas", "pineapples"])
```
</td>
</tr>
</table>

#### Result "apples bananas pineapples". Matlab default delimiter is " ". Julia default delimiter is ""
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
join(["apples", "bananas", "pineapples"])
```
</td>
<td valign="top">

```julia
join(["apples", "bananas", "pineapples"], " ")
```
</td>
</tr>
</table>

#### Result: "apples, bananas, pineapples"
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
join(["apples", "bananas", "pineapples"], ", ")
```
</td>
<td valign="top">

```julia
join(["apples", "bananas", "pineapples"], ", ")
```
</td>
</tr>
</table>

#### Result: ["apples + bananas + pineapples"; "aa + bb + cc"]
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
join(["apples", "bananas", "pineapples"; "aa", "bb", "cc"], " + ")
```
</td>
<td valign="top">

```julia
join.([["apples", "bananas", "pineapples"], ["aa", "bb", "cc"]], " + ")
# Use element wise join
```
</td>
</tr>
</table>

#### Not straight forward in Julia
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% Result: "Carlos Ella Diana" "Sada Olsen Lee"
join(["Carlos","Sada"; "Ella","Olsen"; "Diana","Lee"], 1)

% Result: "x + y = z" "a - b = c"
join(["x","y","z"; "a","b","c"], [" + "," = "; " - "," = "])
```
</td>
<td valign="top">
Not straight forward in Julia</td>
</tr>
</table>

## String Conversion

### String to char array
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
char("hello")
% Returns : ['h', 'e', 'l', 'l', 'o']
```
</td>
<td valign="top">

```julia
collect("hello")
# Returns : ['h', 'e', 'l', 'l', 'o']
```
</td>
</tr>
</table>

### Char array to string
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
string('hello')
% Returns: "hello"
```
</td>
<td valign="top">

```julia
join(['h', 'e', 'l', 'l', 'o'])
# Returns: "hello"
```
</td>
</tr>
</table>

### String to number
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array
str2double('123')

%% With string
str2double("123")
double("123")
```
</td>
<td valign="top">

```julia
parse(Float64, "123")
```
</td>
</tr>
</table>

### Number to string
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
num2str(123)
% Result: '123'

string(123)
% Result: "123"
```
</td>
<td valign="top">

```julia
string(123)
```
</td>
</tr>
</table>

### String to character code
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

double('123')
% Returns: 49 50 51

double('∀ x ∃ y')
% Returns: 8704 32 120 32 8707 32 121

%% With string
% First convert to char array before calling double

double(char("123"))
% Returns: 49 50 51

double(char("∀ x ∃ y"))
% Returns: 8704 32 120 32 8707 32 121
```
</td>
<td valign="top">

```julia
codeunits("123")
# codeunits only works with ASCII characters

Int.(collect("123"))
Int.(collect("∀ x ∃ y"))
# For Unicode, use element wise operation to convert char to Int
```
</td>
</tr>
</table>

## String Testing
### String length
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

length('∀ x ∃ y') 
% Returns: 7

strlength('∀ x ∃ y')
% Returns: 7

%% With string

length("∀ x ∃ y")
% Returns: 1
% (number of string, not length of the string)

strlength("∀ x ∃ y")
% Returns: 7
```
</td>
<td valign="top">

```julia
length("∀ x ∃ y")
# Returns: 7

strlength("∀ x ∃ y")
# Returns: 7
```
</td>
</tr>
</table>

### Contains
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

str = {'Mary Ann Jones', 'Paul Jay Burns', 'John Paul Smith'};

contains(str, 'Paul')
% Returns: 0 1 1

contains(str, {'Paul', 'Ann'})
% Returns: 1 1 1

contains(str, 'jones', 'IgnoreCase', true) 
% Returns 1 0 0

count(str, 'n') 
% Returns: 3 1 1
% Counts number of n in each string. Not available in Julia

%% Matlab with string

str = ["Mary Ann Jones", "Paul Jay Burns", "John Paul Smith"];

contains(str, "Paul")
% Returns: 0 1 1

contains(str, ["Paul", "Ann"])
% Returns: 1 1 1

contains(str, "jones", 'IgnoreCase', true)
% Returns 1 0 0

count(str, "n")
% Returns: 3 1 1. 
% Counts number of n in each string. Not available in Julia
```
</td>
<td valign="top">

```julia
str = ["Mary Ann Jones", "Paul Jay Burns", "John Paul Smith"];

contains.(str, "Paul")
# Returns: 0 1 1

contains.(str, r"Paul|Ann")
# Returns: 1 1 1

contains.(str, r"jones"i)
# Case insensitive
# Returns: 1 0 0
```
</td>
</tr>
</table>

## String Indexing

### Choose n-th character, ASCII
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

s = 'hello world';
s(1) % 'h'
s(5) % 'o'
s(end) % 'd'
s(4:9) % 'lo wor'

%% With string

% First index the string before indexing the character

s = "hello world";
s{1}(1) % 'h'
s{1}(5) % 'o'
s{1}(end) % 'd'
s{1}(4:9) % 'lo wor' as char array
```
</td>
<td valign="top">

```julia
s = "hello world";
s[1] # 'h'
s[5] # 'o'
s[end] # 'd'
s[4:9] # "lo wor" as string
```
</td>
</tr>
</table>

### Choose n-th character, Unicode
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array
t = '∀ x ∃ y';

t(1:2)
% '∀ ' as char array

t(3)
% 'x' as char array

t(3:5)
% 'x ∃' as char array

%% With string
t = "∀ x ∃ y";

t{1}(1:2)
% "∀ " as string

t{1}(3)
% 'x' as char

t{1}(3:5)
% "x ∃" as string
```
</td>
<td valign="top">

```julia
# Julia counts unicode char depending on the char size in byte

t = "∀ x ∃ y";
t[1:2]
# ERROR: StringIndexError: invalid index [2], valid nearby indices [1]=>'∀', [4]=>' '

t[3]
# StringIndexError: invalid index [3], valid nearby indices [1]=>'∀', [4]=>' '

t[3:5]
# ERROR: StringIndexError: invalid index [3], valid nearby indices [1]=>'∀', [4]=>' '

# To do this properly in Julia
# First collect starting indices of unicode characters in the string
# and then index it to the right locations

t[1:4]
# "∀ " as string

t[collect(eachindex(t))[3]]
# "x" as string

t[collect(eachindex(t))[3]:collect(eachindex(t))[5]]
# "x ∃" as string
```
</td>
</tr>
</table>

### Iterate each character
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

t = '∀ x ∃ y';
for c = t
  disp(c);
end

%% With string

t = "∀ x ∃ y";
for c = t{1} % don't forget indexing the string
  disp(c);
end
```
</td>
<td valign="top">

```julia
t = "∀ x ∃ y";
for c = t
  println(c);
end
```
</td>
</tr>
</table>

## String Interpolation
### In place calculation
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

sprintf('1 + 1 = %d', 1 + 1)
% Result: '1 + 1 is 2'

sprintf('Price is $%d', 1 + 1)
% Result: "Price is $2"

%% With string

"1 + 1 is " + (1 + 1)
% Result: "1 + 1 is 2"

"Price is $" + (1 + 1)
% Result: "Price is $2"
```
</td>
<td valign="top">

```julia
"1 + 1 is $(1 + 1)"
# Result: "1 + 1 is 2"

"Price is \$$(1 + 1)"
# Result: "Price is $2"
```
</td>
</tr>
</table>

### Using compose
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

compose('Price is $%d', [1; 2; 3])
%   3×1 cell array
%
%     {'Price is $1'}
%     {'Price is $2'}
%     {'Price is $3'}

%% With string

"Price is $" + [1; 2; 3]
%   3×1 string array
% 
%     "Price is $1"
%     "Price is $2"
%     "Price is $3"
```
</td>
<td valign="top">

```julia
# Use element wise string conversion and concatenation

"Price is \$" .* string.([1; 2; 3])
# 3-element Vector{String}:
#  "Price is \$1"
#  "Price is \$2"
#  "Price is \$3"

# If only string concatenation
# Julia will determine the best format

"Price is \$" .* string([1; 2; 3])
# "Price is \$[1, 2, 3]"
```
</td>
</tr>
</table>

### Using join
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
sprintf('Price is $%d', [1; 2; 3])
% 'Price is $1Price is $2Price is $3'
```
</td>
<td valign="top">

```julia
join("Price is \$" .* string.([1; 2; 3]))
# "Price is \$1Price is \$2Price is \$3"
```
</td>
</tr>
</table>

## String Comparison

### Simple comparison
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
"abracadabra" < "xylophone"
% Result: true
```
</td>
<td valign="top">

```julia
"abracadabra" < "xylophone"
# Result: true
```
</td>
</tr>
</table>

### Equality / Inequality, case sensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

strcmp('abracadabra', 'xylophone')
% Result: false

~strcmp('Hello, world.', 'Goodbye, world.')
% Result: true

%% With string

"abracadabra" == "xylophone"
% Result: false

"Hello, world." ~= "Goodbye, world."
% Result: true
```
</td>
<td valign="top">

```julia
"abracadabra" == "xylophone"
# Result: false

"Hello, world." != "Goodbye, world."
# Result: true
```
</td>
</tr>
</table>

### Equality, case insensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

strcmpi('abracadabra', 'ABracadabRA') 
% Result: true

%% With string

strcmpi("abracadabra", "ABracadabRA")
% Result: true
```
</td>
<td valign="top">

```julia
lowercase("abracadabra") == lowercase("ABracadabRA")
# Result: true
```
</td>
</tr>
</table>

### Equality first n character, case sensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

strncmp('abracadabra', 'abracad', 3)
% Result: true

%% With string

strncmp("abracadabra", "abracad", 3)
% Result: true
```
</td>
<td valign="top">

```julia
first("abracadabra", 3) == first("abracad", 3)
# Result: true
```
</td>
</tr>
</table>

### Equality first n character, case insensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

strncmpi('abracadabra', 'ABracad', 3)
% Result: true

%% With string
strncmpi("abracadabra", "ABracad", 3)
% Result: true
```
</td>
<td valign="top">

```julia
lowercase(first("abracadabra", 3)) == lowercase(first("ABracad", 3))
# Result: true
```
</td>
</tr>
</table>

### Match array of string to a string, case sensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

% use cellfun

cellfun(@(x) strcmp(x, 'Earth'), {'Mercury', 'Venus', 'Earth', 'Mars'})
% Result: [false, false, true, false]

%% With string

matches(["Mercury","Venus","Earth","Mars"], "Earth")
% Result: [false, false, true, false]
```
</td>
<td valign="top">

```julia
# use element wise operator (.)

["Mercury","Venus","Earth","Mars"] .== "Earth"
# Result: [false, false, true, false]
```
</td>
</tr>
</table>

### Match array of string to a string, case insensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

% use cellfun

cellfun(@(x) strcmpi(x, 'earth'), {'Mercury', 'Venus', 'Earth', 'Mars'})
% Result: [false, false, true, false]

%% With string

matches(["Mercury","Venus","Earth","Mars"], "earth", "IgnoreCase", true)
% Result: [false, false, true, false]
```
</td>
<td valign="top">

```julia
# use element wise operator (.)

lowercase.(["Mercury","Venus","Earth","Mars"]) .== lowercase("earth")
# Result: [false, false, true, false]
```
</td>
</tr>
</table>

### Match array of string to multiple strings, case sensitive
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
%% With char array

% use cellfun

cellfun(@(x) strcmpi(x, 'Earth') || strcmpi(x, 'Venus'), {'Mercury', 'Venus', 'Earth', 'Mars'})
% Result: [false, true, true, false]

%% With string

matches(["Mercury","Venus","Earth","Mars"], ["Earth", "Venus"])
% Result: [false, true, true, false]
```
</td>
<td valign="top">

```julia
# use element wise operator (.) on equals (==) and OR operator
["Mercury","Venus","Earth","Mars"] .== "Earth") .| (["Mercury","Venus","Earth","Mars"] .== "Venus")
# Result: [false, true, true, false]
```
</td>
</tr>
</table>
