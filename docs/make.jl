using Documenter
using CKANQuery

makedocs(
    sitename = "CKANQuery",
    format = Documenter.HTML(),
    modules = [CKANQuerry]
)

deploydocs(
    repo = "github.com/VLucet/CKANQuery.jl"
)
