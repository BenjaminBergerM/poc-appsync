resource "aws_appsync_datasource" "poc_ds_enrollment_create" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_create_enrollment"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = "arn:aws:lambda:us-east-1:553300625097:function:enrollments-qa-enrollment-products-getall" // aws_lambda_function.poc_create_enrollment_lambda.arn
  }
}

resource "aws_appsync_datasource" "poc_ds_enrollment_get" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_get_enrollment"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = "arn:aws:lambda:us-east-1:553300625097:function:enrollments-qa-enrollment-products-getall" // aws_lambda_function.poc_get_enrollment_lambda.arn
  }
}

resource "aws_appsync_datasource" "poc_ds_enrollment_update" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_update_enrollment"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = "arn:aws:lambda:us-east-1:553300625097:function:enrollments-qa-enrollment-products-getall" // aws_lambda_function.poc_update_enrollment_lambda.arn
  }
}

resource "aws_appsync_datasource" "poc_ds_enrollment_delete" {
  api_id           = aws_appsync_graphql_api.poc_appsync_api.id
  name             = "lambda_delete_enrollment"
  service_role_arn = aws_iam_role.appsync_api.arn
  type             = "AWS_LAMBDA"

  lambda_config {
    function_arn = "arn:aws:lambda:us-east-1:553300625097:function:enrollments-qa-enrollment-products-getall" // aws_lambda_function.poc_delete_enrollment_lambda.arn
  }
}