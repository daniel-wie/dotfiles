ENV["JULIA_PKG_USE_CLI_GIT"] = true

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
