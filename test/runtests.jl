using Test

# Function Declaration - basic, single return type
function func_basic(a, b)
    []
end

@test func_basic(0, 0) == []

# Function Declaration - explicit type
function func_type_check(a::Int64, b::Float64)
end

@test_nowarn func_type_check(0, 0.0)

@test 1 == 1
