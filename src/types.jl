"""    
    CKANConnection(url::String)
    CKANConnection(url::String, apiversion::Int)

Creates a CKANConnection object with an API url,  by first checking that the 
url is valid (i.e. return a status value of 200). An API version number (Int) 
can be specified. If not specified, the "connection" will use the latest 
version of the target API.
"""
struct CKANConnection
    url::String
    apiversion::Union{Int,Nothing}

    function CKANConnection(url::String)
        url = make_api_url(url, "")
        test_url(url) ? new(url, nothing) : error("Invalid url")
    end

    function CKANConnection(url::String, apiversion::Int)
        url = make_api_url(url, apiversion)
        test_url(url) ? new(url, apiversion) : error("Invalid url")
    end

end

"""
    CKANResource(connection::CKANConnection, id::String, datasetid::String, metadata::Dict

Creates a CKANResource objetcs. Ressources are usually containes in CKAN datasets
(i.e. packages). 
"""
struct CKANResource
    connection::CKANConnection
    id::String
    datasetid::String
    metadata::Dict
end

"""

    CKANDataset(connection::CKANConnection, id::String, metadata::Dict, resources::Union{Array{CKANResource}, Array{String}})

Creates a CKANDataset object. Datasets (i.e. packages) are the main objects in CKAN.
CKANDataset objects usually contains one or more CKANResource objects.
"""
struct CKANDataset
    connection::CKANConnection 
    id::String
    metadata::Dict
    resources::Union{Array{CKANResource}, Array{String}}
end
