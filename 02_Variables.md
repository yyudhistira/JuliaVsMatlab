# Main Page
[Back to main page](README.md)

# Variables

## Variable names
```matlab
% Matlab (2020b)
x = 1.0
Z = "My string"
```
```julia
# Julia (1.6)
x = 1.0
Z = "My string"
안녕하세요 = "Hello" # unicode variable name is allowed in Julia. Not in matlab
```

## Variable redefinition / shadowing
```matlab
% Matlab (2020b)
pi = 3 % shadowing known constant

clear pi % return back to original definition
```
```julia
# Julia (1.6)
pi = 3 # shadowing known constant, ONLY possible if it is not used yet

# Not possible to change the definition back original once it is redefined
```
