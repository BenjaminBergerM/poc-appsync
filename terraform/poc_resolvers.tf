#enrollment
resource "aws_appsync_resolver" "poc_mutation_create_enrollment" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_enrollment_create.name
  field             = "createPocEnrollmentTable"
  response_template = file("resource/resolvers/enrollment/enrollment_create_response.vtl")
  request_template  = file("resource/resolvers/enrollment/enrollment_create_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_update_enrollment" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_enrollment_update.name
  field             = "updatePocEnrollmentTable"
  response_template = file("resource/resolvers/enrollment/enrollment_update_response.vtl")
  request_template  = file("resource/resolvers/enrollment/enrollment_update_request.vtl")
}

resource "aws_appsync_resolver" "poc_mutation_delete_enrollment" {
  type              = "Mutation"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_enrollment_delete.name
  field             = "deletePocEnrollmentTable"
  response_template = file("resource/resolvers/enrollment/enrollment_delete_response.vtl")
  request_template  = file("resource/resolvers/enrollment/enrollment_delete_request.vtl")
}

resource "aws_appsync_resolver" "poc_query_get_enrollment" {
  type              = "Query"
  api_id            = aws_appsync_graphql_api.poc_appsync_api.id
  data_source       = aws_appsync_datasource.poc_ds_enrollment_get.name
  field             = "getPocEnrollmentTable"
  response_template = file("resource/resolvers/enrollment/enrollment_get_response.vtl")
  request_template  = file("resource/resolvers/enrollment/enrollment_get_request.vtl")
}