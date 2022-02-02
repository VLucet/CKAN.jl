using Documenter
using CKANQuerry

makedocs(
    sitename = "CKANQuerry",
    format = Documenter.HTML(),
    modules = [CKANQuerry]
)

deploydocs(
    repo = "github.com/VLucet/CKANQuerry.jl"
)
