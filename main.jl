# Minimal working example for SIVACOR: activates the pinned environment,
# uses a package resolved through it, and writes a result file.

include("setup.jl")

using Example

result = Example.domath(5)

resultsfile = joinpath(resultsdir, "results.txt")
open(resultsfile, "w") do io
    println(io, "SIVACOR Julia installation test")
    println(io, "Julia version: ", VERSION)
    println(io, "Example.domath(5) = ", result)
end

println("=== Test completed successfully ===")
println("Result written to: ", resultsfile)
