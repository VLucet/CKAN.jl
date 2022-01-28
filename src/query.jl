"""
    http_get(url::String)

Perform GET request on url and return the response.
"""
function http_get(url::String)
    return HTTP.get(url) 
end

"""
    parse_body(response::HTTP.Messages.Response)

Parse the body of a HTTP response.
"""
function parse_body(response::HTTP.Messages.Response)
    return JSON.parse(String(response.body))
end

"""
    querry_api(url::String, action::String, parameters::Dict)

Querry an API with the given parameters, for a given CKAN action.
"""
function querry_api(url::String, action::String, parameters::Pair)

    url *= "action/" * action
    url *= generate_request_query(parameters)
    
    @info "Querrying API with url $(shorten_url(url))"
    
    response = parse_body(http_get(url))

    if !(response["success"])
        error("Querry failed")
    end

    return response
end

"""
    generate_request_query(parameters::Pair...)

Copied from Mangal.jl, formats a query string for use in a url, from a set of 
Pairs.
"""
function generate_request_query(parameters::Pair...)
    query = ""
    for (i, pair) in enumerate(promote(parameters...))
        i == 1 || (query *= "&")
        i == 1 && (query *= "?")
        query *= pair.first * "=" * string(pair.second)
    end
    return replace(query, " " => "+")
end