# resource "aws_lambda_permission" "lambda_permission_create_enrollment" {
#   principal     = "appsync.amazonaws.com"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.poc_create_enrollment_lambda.function_name
#   source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
# }

# resource "aws_lambda_permission" "lambda_permission_update_enrollment" {
#   principal     = "appsync.amazonaws.com"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.poc_update_enrollment_lambda.function_name
#   source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
# }

# resource "aws_lambda_permission" "lambda_permission_delete_enrollment" {
#   principal     = "appsync.amazonaws.com"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.poc_delete_enrollment_lambda.function_name
#   source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
# }

# resource "aws_lambda_permission" "lambda_permission_get_enrollment" {
#   principal     = "appsync.amazonaws.com"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.poc_get_enrollment_lambda.function_name
#   source_arn    = aws_appsync_graphql_api.poc_appsync_api.arn
# }