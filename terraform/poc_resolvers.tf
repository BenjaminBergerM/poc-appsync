#person
resource "aws_appsync_resolver" "poc_mutation_create_person" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_person.name
  field             = "createPocPersonTable"
  response_template = file("resource/resolvers/person/person_create_response.vtl")
  request_template  = file("resource/resolvers/person/person_create_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_update_person" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_person.name
  field             = "updatePocPersonTable"
  response_template = file("resource/resolvers/person/person_update_response.vtl")
  request_template  = file("resource/resolvers/person/person_update_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_delete_person" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_person.name
  field             = "deletePocPersonTable"
  response_template = file("resource/resolvers/person/person_delete_response.vtl")
  request_template  = file("resource/resolvers/person/person_delete_request.vtl")
}


resource "aws_appsync_resolver" "poc_query_get_person" {
  type              = "Query"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_person.name
  field             = "getPocPersonTable"
  response_template = file("resource/resolvers/person/person_get_response.vtl")
  request_template  = file("resource/resolvers/person/person_get_request.vtl")
}

resource "aws_appsync_resolver" "person_field_animal" {
  type              = "PocPersonTable"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_animal.name
  field             = "animal"
  response_template = file("resource/resolvers/person/person_animal_response.vtl")
  request_template  = file("resource/resolvers/person/person_animal_request.vtl")
}

resource "aws_appsync_resolver" "person_field_company" {
  type              = "PocPersonTable"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_company_get.name
  field             = "company"
  response_template = file("resource/resolvers/person/person_company_response.vtl")
  request_template  = file("resource/resolvers/person/person_company_request.vtl")
}

#animal
resource "aws_appsync_resolver" "poc_mutation_create_animal" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_animal.name
  field             = "createPocAnimalTable"
  response_template = file("resource/resolvers/animal/animal_create_response.vtl")
  request_template  = file("resource/resolvers/animal/animal_create_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_update_animal" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_animal.name
  field             = "updatePocAnimalTable"
  response_template = file("resource/resolvers/animal/animal_update_response.vtl")
  request_template  = file("resource/resolvers/animal/animal_update_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_delete_animal" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_animal.name
  field             = "deletePocAnimalTable"
  response_template = file("resource/resolvers/animal/animal_delete_response.vtl")
  request_template  = file("resource/resolvers/animal/animal_delete_request.vtl")
}


resource "aws_appsync_resolver" "poc_query_get_animal" {
  type              = "Query"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_animal.name
  field             = "getPocAnimalTable"
  response_template = file("resource/resolvers/animal/animal_get_response.vtl")
  request_template  = file("resource/resolvers/animal/animal_get_request.vtl")
}

#company
resource "aws_appsync_resolver" "poc_mutation_create_company" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_company_create.name
  field             = "createPocCompanyTable"
  response_template = file("resource/resolvers/company/company_create_response.vtl")
  request_template  = file("resource/resolvers/company/company_create_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_update_company" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_company_update.name
  field             = "updatePocCompanyTable"
  response_template = file("resource/resolvers/company/company_update_response.vtl")
  request_template  = file("resource/resolvers/company/company_update_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_delete_company" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_company_delete.name
  field             = "deletePocCompanyTable"
  response_template = file("resource/resolvers/company/company_delete_response.vtl")
  request_template  = file("resource/resolvers/company/company_delete_request.vtl")
}

resource "aws_appsync_resolver" "poc_query_get_company" {
  type              = "Query"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_company_get.name
  field             = "getPocCompanyTable"
  response_template = file("resource/resolvers/company/company_get_response.vtl")
  request_template  = file("resource/resolvers/company/company_get_request.vtl")
}