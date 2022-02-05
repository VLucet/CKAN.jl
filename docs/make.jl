using Documenter
using CKANQuery

makedocs(
    sitename = "CKANQuery",
    format = Documenter.HTML(),
    modules = [CKANQuery]
)

deploydocs(
    repo = "github.com/VLucet/CKANQuery.jl"
)
