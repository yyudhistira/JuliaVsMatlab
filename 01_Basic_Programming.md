# Main Page
[Back to main page](README.md)

# Basic Programming

## Comment
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6)</th></tr>
<tr style="vertical-align:top">
<td>

```matlab
% Comment
%{
    Comment line1
    Comment line2
%}
```
</td>
<td>

```julia
# Comment
#=
Comment line1
Comment line2
=#
```
</td>
</tr>
</table>

## Expression

<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6)</th></tr>
<tr style="vertical-align:top">
<td>

```matlab
% show calculation result on screen
a = b + 20

% hide calculation result on screen
a = b + 20;

% multiple operations in 1 line
1 + 3; 6 + 10;
```
</td>
<td>

```julia
# show calculation result on screen
a = b + 20

# hide calculation result on screen
a = b + 20;

# multiple operations in 1 line
1 + 3; 6 + 10;
```
</td>
</tr>
</table>

## Multi line expression

<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6)</th></tr>
<tr style="vertical-align:top">
<td>

```matlab
a = b + ...
20

% string 'hello world' expressed in two lines
x = ['hello ' ... 
'world'];
```

</td>
<td>

```julia
a = b +
20
# No `...` is needed. If statement is incomplete it knows that it will continue in the next line.

# Be careful with
#   a = b
#   + 20
# Instead it will do two operations, first assigning `a = b` then showing 20.

# string "hello world" expressed in two lines
x = "hello " * 
"world";
```
</td>
</tr>
</table>

## Multi line string

<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr style="vertical-align:top">
<td>

```matlab
multiline = sprintf([ ... 
'Line 1\n'... 
'Line 2\n'... 
]);
```
</td>
<td>

```julia
multiline = """Line1
Line2
"""
```
</td>
</tr>
</table>



