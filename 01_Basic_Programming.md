# License

This work is licensed under Creative Commons CC-BY-4.0 (c) Yasri Yudhistira and other contributors

Please refer to the following for more information
https://creativecommons.org/licenses/by/4.0/

# Main Page
[Back to main page](README.md)

# Basic Programming

## Comments
```matlab
% Matlab (2020b)
% Comment
%{
    Comment line1
    Comment line2
%}
```
```julia
# Julia (1.6)
# Comment
#=
Comment line1
Comment line2
=#
```

## Expression
```matlab
% Matlab (2020b)
a = b + 20 % show calculation result on screen
a = b + 20; % hide calculation result on screen
1 + 3; 6 + 10; % multiple operations in 1 line
```
```julia
# Julia (1.6)
a = b + 20 # show calculation result on screen
a = b + 20; # hide calculation result on screen
1 + 3; 6 + 10; % multiple operations in 1 line
```

## Multi line expression
```matlab
% Matlab (2020b)
a = b + ...
20

x = ['hello ' ... 
'world']; % string 'hello world' expressed in two lines
```
```julia
# Julia (1.6)
a = b +
20
# No `...` is needed. If statement is incomplete it knows that it will continue in the next line.

# Be careful with
#   a = b
#   + 20
# Instead it will do two operations, first assigning `a = b` then showing 20.

x = "hello " * 
"world"; # string "hello world" expressed in two lines
```

## Multi line string
```matlab
% Matlab (2020b)
multiline = sprintf([ ... 
'Line 1\n'... 
'Line 2\n'... 
]);
```
```julia
# Julia (1.6)
multiline = """Line1
Line2
"""
```
