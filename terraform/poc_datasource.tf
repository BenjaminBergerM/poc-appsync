resource "aws_appsync_datasource" "poc_ds_person" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "ds_person"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AMAZON_DYNAMODB"

  dynamodb_config {
    table_name = aws_dynamodb_table.poc_person_table.name
  }
}

resource "aws_appsync_datasource" "poc_ds_animal" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "ds_animal"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AMAZON_DYNAMODB"

  dynamodb_config {
    table_name = aws_dynamodb_table.poc_animal_table.name
  }
}

resource "aws_appsync_datasource" "poc_ds_company_create" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_create_company"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = aws_lambda_function.poc_create_company_lambda.arn
  }
}

resource "aws_appsync_datasource" "poc_ds_company_get" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_get_company"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = aws_lambda_function.poc_get_company_lambda.arn
  }
}

resource "aws_appsync_datasource" "poc_ds_company_update" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_update_company"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = aws_lambda_function.poc_update_company_lambda.arn
  }
}

resource "aws_appsync_datasource" "poc_ds_company_delete" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_delete_company"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = aws_lambda_function.poc_delete_company_lambda.arn
  }
}