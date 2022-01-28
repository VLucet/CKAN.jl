"""
    Base.show(io::IO, connection::CKANConnection)

Print a CKANConnection to the given IO.
"""
function Base.show(io::IO, connection::CKANConnection)
    obj_print = """

                ✔ [CKAN API connection] 
                ↳ [URL: $(connection.url)] """
    print(io, obj_print)
end

"""
    Base.show(io::IO, dataset::CKANDataset)

Print a CKANDataset to the given IO.
"""
function Base.show(io::IO, dataset::CKANDataset)
    obj_print = """

                Δ [CKAN Dataset]
                ↳ [id    : $(dataset.id)] 
                ↳ [title : $(dataset.metadata["title"])] """
    print(io, obj_print)
end

"""
    Base.show(io::IO, resource::CKANResource)

Print a CKANResource to the given IO.
"""
function Base.show(io::IO, resource::CKANResource)
    obj_print = """

                ρ [CKAN Resource]
                ↳ [id   : $(resource.id)] 
                ↳ [type : $(resource.metadata["resource_type"])]
                ↳ [name : $(resource.metadata["name"])] """
    print(io, obj_print)
end