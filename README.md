# Test files for SIVACOR

This is a plausible minimal working example of Julia code that should work on SIVACOR.

- Main file: `main.jl`
- Test code for Julia that works: <https://github.com/SIVACOR/sivacor-test-julia>

## What this tests

`main.jl` includes `setup.jl`, which:

1. Activates this repository as a Julia project with `Pkg.activate(rootdir)`,
   pointing Julia at the `Project.toml` in this directory.
2. Runs `Pkg.instantiate()`, which reads `Manifest.toml` and installs the
   exact package versions it pins (here, the single dependency
   [`Example.jl`](https://github.com/JuliaLang/Example.jl), a small package
   maintained for exactly this kind of smoke test).
3. Prints basic system diagnostics (Julia version, platform, `Pkg.status()`)
   and creates `logs/` and `results/` directories.

`main.jl` then calls `Example.domath`, a function from the installed
dependency, and writes the result to `results/results.txt`. A successful run
confirms that SIVACOR can activate a Julia project from its `Project.toml`
and `Manifest.toml`, install the pinned dependency, and execute code that
uses it.

## Project.toml and Manifest.toml

Both files are checked into this repository, as they should be for any
reproducible Julia project submitted to SIVACOR:

- **`Project.toml`** lists the package's direct dependencies (here, just
  `Example`) by name and UUID.
- **`Manifest.toml`** is the lock file: it records the *exact* resolved
  version and content hash of every dependency (direct and transitive), plus
  the Julia version it was generated with. Committing it means
  `Pkg.instantiate()` reproduces the identical environment every time,
  instead of re-resolving to whatever the latest compatible versions happen
  to be when SIVACOR runs the code.

Do not hand-edit `Manifest.toml`; regenerate it with `Pkg.instantiate()` /
`Pkg.resolve()` after changing `Project.toml`.

## Running it

```bash
julia main.jl
```

run from this directory (or with `julia --project=. main.jl` from anywhere).
