# resource "aws_lambda_function" "poc_create_enrollment_lambda" {
#   filename      = "../lambdas/build/enrollment_create/main.zip"
#   function_name = "poc_create_enrollment_lambda"
#   role          = aws_iam_role.poc_lambda_role.arn
#   handler       = "main"
#   source_code_hash = filebase64sha256("../lambdas/build/enrollment_create/main.zip")
#   runtime = "go1.x"
# }

# resource "aws_lambda_function" "poc_get_enrollment_lambda" {
#   filename      =  "../lambdas/build/enrollment_get/main.zip"
#   function_name = "poc_get_enrollment_lambda"
#   role          = aws_iam_role.poc_lambda_role.arn
#   handler       = "main"
#   arn           = "arn:aws:lambda:us-east-1:553300625097:function:enrollments-qa-enrollment-products-getall"
#   runtime = "go1.x"
# }

# resource "aws_lambda_function" "poc_update_enrollment_lambda" {
#   filename      =  "../lambdas/build/enrollment_update/main.zip"
#   function_name = "poc_update_enrollment_lambda"
#   role          = aws_iam_role.poc_lambda_role.arn
#   handler       = "main"
#   source_code_hash = filebase64sha256("../lambdas/build/enrollment_update/main.zip")
#   runtime = "go1.x"
# }

# resource "aws_lambda_function" "poc_delete_enrollment_lambda" {
#   filename      =  "../lambdas/build/enrollment_delete/main.zip"
#   function_name = "poc_delete_enrollment_lambda"
#   role          = aws_iam_role.poc_lambda_role.arn
#   handler       = "main"
#   source_code_hash = filebase64sha256("../lambdas/build/enrollment_delete/main.zip")
#   runtime = "go1.x"
# }