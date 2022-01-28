"""
    make_api_url(root::String)
    make_api_url(root::String, apiversion::Int)

Produce a GETable api url. Root is the base url, apiversion is the version of 
the api to use. If apiversion is not specified, the default behavior when a 
querry is performed is to use the latest version.
"""
function make_api_url(root::String)
    apiversion = ""
    make_api_url(root, apiversion)
end

function make_api_url(root::String, apiversion::Int)
    @assert apiversion > 0 "API version must be larger than 0"
    apiversion = string(apiversion)
    make_api_url(root, apiversion)
end

function make_api_url(root::String, apiversion::String)
    if apiversion != ""
        apiversion = "/" * apiversion
    end
    root * "/api" * apiversion * "/"
end

"""
    shorten_url(url::String, squeeze::Int=20)

Shorten the url for printing.
"""
function shorten_url(url::String, squeeze::Int=20)
    url[1:squeeze] * "..." * url[(end-squeeze):end]
end

"""
    test_url(url::String)

Test url validity.
"""
function test_url(url::String)
    @info "Testing url $url"
    status = http_get(url).status
    if status == 200 
        @info "URL is valid [status: $status]"
        return true
    else
        @info "URL is invalid [status: $status]"
        return false
    end
end
