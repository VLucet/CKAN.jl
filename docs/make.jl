using Documenter
using CKANQuerry

makedocs(
    sitename = "CKANQuerry",
    format = Documenter.HTML(),
    modules = [CKANQuerry]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
