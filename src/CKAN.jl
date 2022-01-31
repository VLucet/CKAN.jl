module CKAN

using HTTP
using JSON

export package_list, package_show, resource_list, resource_show
export CKANConnection, CKANDataset, CKANResource

const web_root = "https://open.canada.ca/data/en/"
const api_root = web_root * "api/3/"

include(joinpath(".", "types.jl"))
include(joinpath(".", "show.jl"))
include(joinpath(".", "url.jl"))
include(joinpath(".", "query.jl"))
include(joinpath(".", "actions.jl"))

# End of CKAN module
end