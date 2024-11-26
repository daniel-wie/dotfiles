ENV["JULIA_PKG_USE_CLI_GIT"] = true

# ensure that PyCall uses the current virtual environment
# https://github.com/JuliaPy/PyCall.jl?tab=readme-ov-file#python-virtual-environments
ENV["PYCALL_JL_RUNTIME_PYTHON"] = Sys.which("python")

if isinteractive()
    # Start Revise automatically
    try
        using Revise
    catch e
        @warn "Error initializing Revise" exception = (e, catch_backtrace())
    end

    # Activate current environment if existing
    if isfile("Project.toml")
        using Pkg
        Pkg.activate(".")
    end
end
