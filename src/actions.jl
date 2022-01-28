function package_show(connection::CKANConnection, id::String; querryres::Bool=true)
    url = connection.url
    querry = package_show(url, id)
    result = querry["result"]
    resources_dicts = result["resources"]
    resources_ids = [x["id"] for x in resources_dicts]

    if querryres
        return CKANDataset(connection, result["id"], result, 
                           resource_show.([connection], resources_ids))
    else 
        return CKANDataset(connection, result["id"], result, resources_ids)
    end

end

function package_show(url::String, id::String)
    parameters = Pair("id", id)
    return querry_api(url, "package_show", parameters)
end

function resource_show(connection::CKANConnection, id::String)
    url = connection.url
    querry = resource_show(url, id)
    result = querry["result"]
    return CKANResource(connection, result["id"], result["package_id"], result)
end

function resource_show(url::String, id::String)
    parameters = Pair("id", id)
    return querry_api(url, "resource_show", parameters)
end

function package_list(connection::CKANConnection; 
                      querryres::Bool=true, limit::Int64=100)
    url = connection.url
    querry = package_list(url)
    package_ids = querry["result"]
    
    if length(package_ids) > limit
        @info "$(length(package_ids)) datasets, querying the first $limit"
        package_ids = package_ids[1:limit]
    end
    
    return package_show.([connection], package_ids, querryres=querryres)
end

function package_list(url::String)
    return querry_api(url, "package_list", ("" => ""))
end