# Main Page
[Back to main page](README.md)

# Variables

## Variable names
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
x = 1.0
Z = "My string"
```
</td>
<td valign="top">

```julia
x = 1.0
Z = "My string"

# unicode variable name is allowed in Julia. Not in matlab
안녕하세요 = "Hello"
```
</td>
</tr>
</table>


## Variable redefinition / shadowing
<table>
<tr><th>Matlab (2020b)</th><th>Julia (1.6) </th></tr>
<tr>
<td valign="top">

```matlab
% shadowing known constant
pi = 3

% return back to original definition
clear pi
```
</td>
<td valign="top">

```julia
# shadowing known constant
# ONLY possible if it is not used yet
pi = 3

# Not possible to return back to original definition
# once it is redefined
```
</td>
</tr>
</table>

