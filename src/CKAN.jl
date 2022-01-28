module CKAN

using HTTP
using JSON

export package_list, package_show, resource_list, resource_show
export CKANConnection, CKANDataset, CKANResource

include(joinpath(".", "types.jl"))
include(joinpath(".", "show.jl"))
include(joinpath(".", "url.jl"))
include(joinpath(".", "query.jl"))
include(joinpath(".", "actions.jl"))

# End of CKAN module
end