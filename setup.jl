# Prepare the environment for main.jl: activate this project's Project.toml /
# Manifest.toml, install the pinned package versions, and record diagnostics.

const rootdir = @__DIR__
println("Rootdir has been set to: $rootdir")

import Pkg

println("=== Activating the project environment (Project.toml) ===")
Pkg.activate(rootdir)

println("=== Installing packages pinned in Manifest.toml ===")
Pkg.instantiate()

logdir = joinpath(rootdir, "logs")
mkpath(logdir)

resultsdir = joinpath(rootdir, "results")
mkpath(resultsdir)

println("=== SYSTEM DIAGNOSTICS ===")
println("Julia version: ", VERSION)
println("Platform: ", Sys.MACHINE)
Pkg.status()
println("==========================")
