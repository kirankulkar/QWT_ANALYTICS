def model(dbt, session):

    dbt.config(materialised ='table')
    # DataFrame representing an upstream source
    products_source = dbt.source("qwt_src", "products")
    return products_source