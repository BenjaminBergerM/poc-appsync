resource "aws_lambda_permission" "lambda_permission_create_company" {
  principal     = "appsync.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.poc_create_company_lambda.function_name
  source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
}

resource "aws_lambda_permission" "lambda_permission_update_company" {
  principal     = "appsync.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.poc_update_company_lambda.function_name
  source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
}

resource "aws_lambda_permission" "lambda_permission_delete_company" {
  principal     = "appsync.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.poc_delete_company_lambda.function_name
  source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
}

resource "aws_lambda_permission" "lambda_permission_get_company" {
  principal     = "appsync.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.poc_get_company_lambda.function_name
  source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
}