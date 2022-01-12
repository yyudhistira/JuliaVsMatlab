# License

This work is licensed under Creative Commons CC-BY-4.0 (c) Yasri Yudhistira and other contributors

Please refer to the following for more information
https://creativecommons.org/licenses/by/4.0/

# Main Page
[Back to main page](README.md)

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
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| char           | Char
| string         | String

## Char Operations
| Matlab (2020b) | Julia (1.6) | Notes |
| -------------- | ----------- | ----- |
| c = 'hello'    | c = ['h', 'e', 'l', 'l', 'o']
| d = double(c)  | d = Float64.(c)
| a = char(d)    | a = Char.(d)
| 'x' - 'a'      | 'x' - 'a'   | Result: 23
| 'A' + 1        | Int('A' + 1) | Result: 66
| char('A' + 1)  | 'A' + 1     | Result: 'B'
| 'A' <= 'X' <= 'Z' | 'A' <= 'X' <= 'Z' | Result: true
| "A" <= "X" <= "Z" | 'A' <= 'X' <= 'Z' | Result: true

## String Creation and Concatenation
### Creation
```matlab
% Matlab with char array
s = 'hello world';
w = sprintf('hello "alien" world\n');
```
```matlab
% Matlab with string
s = "hello world";
w = "hello ""alien"" world" + sprintf('\n');
```
```julia
# Julia
s = "hello world";
w = "hello \"alien\" world\n";
w = """hello "alien" world\n"""; # Julia can use triple quotes
ll = """This is multiline
string"""; # Long multiline string with triple quotes
```

### Repetition
```matlab
% Matlab with char array
blanks(5) % Returns: '     '. Only generate char array, not string
repmat('a', 1, 5) % Returns 'aaaaa'
repmat('hello', 1, 5) % Returns 'hellohellohellohellohello'
```
```matlab
% Matlab with string
repmat("a", 1, 5) % Returns "aaaaa"
repmat('hello', 1, 5) % Returns "hellohellohellohellohello"
```
```julia
# Julia
blanks(5) # Returns: "     "
"a" ^ 5 # Returns "aaaaa"
"hello" ^ 5 # Returns "hellohellohellohellohello"
```

### String Concatenation
```matlab
% Matlab with char array
ss = ['hello', 'world'];

strcat(' a ', ' b ') % Result: Result: ' a b'. Matlab strcat with char removes right spaces
```
```matlab
% Matlab with string
ss = "hello" + "world";

["Red" "Blue" "Green"] + ["Truck" "Sky" "Tree"] % Result: "RedTruck" "BlueSky" "GreenTree"

strcat(" a ", " b ") % Result: " a b " Matlab strcat with string concatenates all characters

append(" a ", " b ") % Result: " a b " Same behavior as +
```
```julia
# Julia
ss = "hello" * "world"; # Julia uses * for string concatenation

["Red" "Blue" "Green"] .* ["Truck" "Sky" "Tree"] # Result: "RedTruck" "BlueSky" "GreenTree"

rstrip(" a ") * rstrip(" b ") # Same output as strcat(' a ', ' b ') on Matlab

" a " * " b " # Same output as strcat(" a ", " b ") on Matlab
```

### Join
#### Result "applesbananaspineapples". Matlab default delimiter is " ". Julia default delimiter is ""
```matlab
% Matlab with string
join(["apples", "bananas", "pineapples"], "")
```
```julia
# Julia
join(["apples", "bananas", "pineapples"])
```

#### Result "apples bananas pineapples". Matlab default delimiter is " ". Julia default delimiter is ""
```matlab
% Matlab with string
join(["apples", "bananas", "pineapples"])
```
```julia
# Julia
join(["apples", "bananas", "pineapples"], " ")
```

#### Result: "apples, bananas, pineapples"
```matlab
% Matlab with string
join(["apples", "bananas", "pineapples"], ", ")
```
```julia
# Julia
join(["apples", "bananas", "pineapples"], ", ")
```

#### Result: ["apples + bananas + pineapples"; "aa + bb + cc"]
```matlab
% Matlab with string
join(["apples", "bananas", "pineapples"; "aa", "bb", "cc"], " + ")
```
```julia
# Julia
join.([["apples", "bananas", "pineapples"], ["aa", "bb", "cc"]], " + ")
```

#### Not straight forward in Julia
```matlab
% Matlab with string
% Result: "Carlos Ella Diana" "Sada Olsen Lee"
join(["Carlos","Sada"; "Ella","Olsen"; "Diana","Lee"], 1)

% Result: "x + y = z" "a - b = c"
join(["x","y","z"; "a","b","c"], [" + "," = "; " - "," = "])
```

## String Conversion

### String to char array
```matlab
% Matlab with string
char("hello") % Returns : ['h', 'e', 'l', 'l', 'o']
```
```julia
# Julia
collect("hello") # Returns : ['h', 'e', 'l', 'l', 'o']
```

### Char array to string
```matlab
% Matlab with string
string('hello') % Returns: "hello"
```
```julia
# Julia
join(['h', 'e', 'l', 'l', 'o']) # Returns: "hello"
```

### String to number
```matlab
% Matlab with char array
str2double('123')
```
```matlab
% Matlab with string
str2double("123")
double("123")
```
```julia
# Julia
parse(Float64, "123")
```

### Number to string
```matlab
% Matlab with char array
num2str(123)
```
```matlab
% Matlab with string
string(123)
```
```julia
# Julia
string(123)
```

### String to character code
```matlab
% Matlab with char array
double('123') % Returns: 49 50 51. 
double('∀ x ∃ y') % Returns: 8704 32 120 32 8707 32 121
```
```matlab
% Matlab with string
% First convert to char array before calling double
double(char("123"))
double(char("∀ x ∃ y"))
```
```julia
# Julia
codeunits("123") # codeunits only works with ASCII characters
Int.(collect("∀ x ∃ y")) # For Unicode, use element wise operation to convert char to Int
```

## String Testing
### String length
```matlab
% Matlab with char array
length('∀ x ∃ y') % Returns: 7
strlength('∀ x ∃ y') % Returns: 7
```
```matlab
% Matlab with string
length("∀ x ∃ y") % Returns: 1. (number of string, not length of the string)
strlength("∀ x ∃ y") % Returns: 7
```
```julia
# Julia
length("∀ x ∃ y") # Returns: 7
strlength("∀ x ∃ y") # Returns: 7
```

### Contains
```matlab
% Matlab with char array
str = {'Mary Ann Jones', 'Paul Jay Burns', 'John Paul Smith'};

contains(str, 'Paul') % Returns: 0 1 1
contains(str, {'Paul', 'Ann'}) % Returns: 1 1 1
contains(str, 'jones', 'IgnoreCase', true) % Returns 1 0 0
count(str, 'n') % Counts number of n in each string. Returns: 3 1 1. Not available in Julia
```
```matlab
% Matlab with string
str = ["Mary Ann Jones", "Paul Jay Burns", "John Paul Smith"];

contains(str, "Paul") % Returns: 0 1 1
contains(str, ["Paul", "Ann"]) % Returns: 1 1 1
contains(str, "jones", 'IgnoreCase', true) % Returns 1 0 0
count(str, "n") % Counts number of n in each string. Returns: 3 1 1. Not available in Julia
```
```julia
# Julia
str = ["Mary Ann Jones", "Paul Jay Burns", "John Paul Smith"];

contains.(str, "Paul") # Returns: 0 1 1
contains.(str, r"Paul|Ann") # Returns: 1 1 1
contains.(str, r"jones"i) # Case insensitive. Returns: 1 0 0
```

## String Indexing

### Choose n-th character, ASCII
```matlab
% Matlab with char array
s = 'hello world';
s(1) % 'h'
s(5) % 'o'
s(end) % 'd'
s(4:9) % 'lo wor'
```
```matlab
% Matlab with string
% First index the string before indexing the character
s = "hello world";
s{1}(1) % 'h'
s{1}(5) % 'o'
s{1}(end) % 'd'
s{1}(4:9) % 'lo wor' as char array
```
```julia
# Julia
s = "hello world";
s[1] # 'h'
s[5] # 'o'
s[end] # 'd'
s[4:9] # "lo wor" as string
```

### Choose n-th character, Unicode
```matlab
% Matlab with char array
t = '∀ x ∃ y';
t(1:2) % '∀ ' as char array
t(3) % 'x' as char array
t(3:5) % 'x ∃' as char array
```
```matlab
% Matlab with string
t = "∀ x ∃ y";
t{1}(1:2) % "∀ " as string
t{1}(3) % 'x' as char
t{1}(3:5) % "x ∃" as string
```
```julia
# Julia
# Julia counts unicode char depending on the char size in byte
t = "∀ x ∃ y";
t[1:2] # ERROR: StringIndexError: invalid index [2], valid nearby indices [1]=>'∀', [4]=>' '
t[3] # StringIndexError: invalid index [3], valid nearby indices [1]=>'∀', [4]=>' '
t[3:5] # ERROR: StringIndexError: invalid index [3], valid nearby indices [1]=>'∀', [4]=>' '

# To do this properly in Julia
# First collect starting indices of unicode characters in the string, and then index it to the right locations
t[1:4] # "∀ " as string
t[collect(eachindex(t))[3]] # "x" as string
t[collect(eachindex(t))[3]:collect(eachindex(t))[5]] # "x ∃" as string
```

### Iterate each character
```matlab
% Matlab with char array
t = '∀ x ∃ y';
for c = t
  disp(c);
end
```
```matlab
% Matlab with string
t = "∀ x ∃ y";
for c = t{1} % don't forget indexing the string
  disp(c);
end
```
```julia
# Julia
t = "∀ x ∃ y";
for c = t
  println(c);
end
```

## String Interpolation
### In place calculation
```matlab
% Matlab with char array
sprintf('1 + 1 = %d', 1 + 1) % Result: '1 + 1 is 2'
sprintf('Price is $%d', 1 + 1) % Result: "Price is $2"
```
```matlab
% Matlab with string
"1 + 1 is " + (1 + 1) % Result: "1 + 1 is 2"
"Price is $" + (1 + 1) % Result: "Price is $2"
```
```julia
# Julia
"1 + 1 is $(1 + 1)" # Result: "1 + 1 is 2"
"Price is \$$(1 + 1)" # Result: "Price is $2"
```

### Using compose
```matlab
% Matlab with char array
compose('Price is $%d', [1; 2; 3])
%   3×1 cell array
%
%     {'Price is $1'}
%     {'Price is $2'}
%     {'Price is $3'}
```
```matlab
% Matlab with string
"Price is $" + [1; 2; 3]
%   3×1 string array
% 
%     "Price is $1"
%     "Price is $2"
%     "Price is $3"
```
```julia
# Julia
# Use element wise string conversion and concatenation
"Price is \$" .* string.([1; 2; 3])
# 3-element Vector{String}:
#  "Price is \$1"
#  "Price is \$2"
#  "Price is \$3"

# If only string concatenation, Julia will determine the best format
"Price is \$" .* string([1; 2; 3])
# "Price is \$[1, 2, 3]"
```

### Using join
```matlab
% Matlab with char array
sprintf('Price is $%d', [1; 2; 3])
% 'Price is $1Price is $2Price is $3'
```
```julia
# Julia
join("Price is \$" .* string.([1; 2; 3]))
# "Price is \$1Price is \$2Price is \$3"
```

## String Comparison

### Simple comparison
```matlab
% Matlab with char array
% Not straightforward to do comparison in char array
```
```matlab
% Matlab with string
"abracadabra" < "xylophone" % Result: true
```
```julia
# Julia
"abracadabra" < "xylophone" # Result: true
```

### Equality / Inequality, case sensitive
```matlab
% Matlab with char array
strcmp('abracadabra', 'xylophone') % Result: false
~strcmp('Hello, world.', 'Goodbye, world.') % Result: true
```
```matlab
% Matlab with string
"abracadabra" == "xylophone" % Result: false
"Hello, world." ~= "Goodbye, world." % Result: true
```
```julia
# Julia
"abracadabra" == "xylophone" # Result: false
"Hello, world." != "Goodbye, world." # Result: true
```

### Equality, case insensitive
```matlab
% Matlab with char array
strcmpi('abracadabra', 'ABracadabRA') % Result: true
```
```matlab
% Matlab with string
strcmpi("abracadabra", "ABracadabRA") % Result: true
```
```julia
# Julia
lowercase("abracadabra") == lowercase("ABracadabRA") # Result: true
```

### Equality first n character, case sensitive
```matlab
% Matlab with char array
strncmp('abracadabra', 'abracad', 3) % Result: true
```
```matlab
% Matlab with string
strncmp("abracadabra", "abracad", 3) % Result: true
```
```julia
# Julia
first("abracadabra", 3) == first("abracad", 3) # Result: true
```

### Equality first n character, case insensitive
```matlab
% Matlab with char array
strncmpi('abracadabra', 'ABracad', 3) % Result: true
```
```matlab
% Matlab with string
strncmpi("abracadabra", "ABracad", 3) % Result: true
```
```julia
# Julia
lowercase(first("abracadabra", 3)) == lowercase(first("ABracad", 3)) # Result: true
```

### Match array of string to a string, case sensitive
```matlab
% Matlab with char array
% use cellfun
cellfun(@(x) strcmp(x, 'Earth'), {'Mercury', 'Venus', 'Earth', 'Mars'})
% Result: [false, false, true, false]
```
```matlab
% Matlab with string
matches(["Mercury","Venus","Earth","Mars"], "Earth")
% Result: [false, false, true, false]
```
```julia
# Julia
# use element wise operator (.)
["Mercury","Venus","Earth","Mars"] .== "Earth"
# Result: [false, false, true, false]
```

### Match array of string to a string, case insensitive
```matlab
% Matlab with char array
% use cellfun
cellfun(@(x) strcmpi(x, 'earth'), {'Mercury', 'Venus', 'Earth', 'Mars'})
% Result: [false, false, true, false]
```
```matlab
% Matlab with string
matches(["Mercury","Venus","Earth","Mars"], "earth", "IgnoreCase", true)
% Result: [false, false, true, false]
```
```julia
# Julia
# use element wise operator (.)
lowercase.(["Mercury","Venus","Earth","Mars"]) .== lowercase("earth")
# Result: [false, false, true, false]
```

### Match array of string to multiple strings, case sensitive
```matlab
% Matlab with char array
% use cellfun
cellfun(@(x) strcmpi(x, 'Earth') || strcmpi(x, 'Venus'), {'Mercury', 'Venus', 'Earth', 'Mars'})
% Result: [false, true, true, false]
```
```matlab
% Matlab with string
matches(["Mercury","Venus","Earth","Mars"], ["Earth", "Venus"])
% Result: [false, true, true, false]
```
```julia
# Julia
# use element wise operator (.) on equals (==) and OR operator
["Mercury","Venus","Earth","Mars"] .== "Earth") .| (["Mercury","Venus","Earth","Mars"] .== "Venus")
# Result: [false, true, true, false]
```
