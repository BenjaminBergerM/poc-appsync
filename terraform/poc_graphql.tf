resource "aws_appsync_graphql_api" "poc_appsync_api" {
  name                = "poc-persons-api"
  authentication_type = "API_KEY"
  schema              = file("${path.module}/resource/schema/schema.graphql")
}
