resource "aws_lambda_function" "poc_create_person_lambda" {
  filename      =  "../lambdas/build/person_create/main.zip"
  function_name = "poc_create_person_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/person_create/main.zip")
  runtime = "go1.x"
}

resource "aws_lambda_function" "poc_get_person_lambda" {
  filename      =  "../lambdas/build/person_get/main.zip"
  function_name = "poc_get_person_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/person_get/main.zip")
  runtime = "go1.x"

}

resource "aws_lambda_function" "poc_update_person_lambda" {
  filename      =  "../lambdas/build/person_update/main.zip"
  function_name = "poc_update_person_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/person_update/main.zip")
  runtime = "go1.x"

}

resource "aws_lambda_function" "poc_delete_person_lambda" {
  filename      =  "../lambdas/build/person_delete/main.zip"
  function_name = "poc_delete_person_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/person_delete/main.zip")
  runtime = "go1.x"

}

resource "aws_lambda_function" "poc_create_animal_lambda" {
  filename      = "../lambdas/build/animal_create/main.zip"
  function_name = "poc_create_animal_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/animal_create/main.zip")
  runtime = "go1.x"

}

resource "aws_lambda_function" "poc_get_animal_lambda" {
  filename      =  "../lambdas/build/animal_get/main.zip"
  function_name = "poc_get_animal_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/animal_get/main.zip")
  runtime = "go1.x"

}

resource "aws_lambda_function" "poc_update_animal_lambda" {
  filename      =  "../lambdas/build/animal_update/main.zip"
  function_name = "poc_update_animal_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/animal_update/main.zip")
  runtime = "go1.x"

}

resource "aws_lambda_function" "poc_delete_animal_lambda" {
  filename      =  "../lambdas/build/animal_delete/main.zip"
  function_name = "poc_delete_animal_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/animal_delete/main.zip")
  runtime = "go1.x"
}

resource "aws_lambda_function" "poc_create_company_lambda" {
  filename      = "../lambdas/build/company_create/main.zip"
  function_name = "poc_create_company_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/company_create/main.zip")
  runtime = "go1.x"
}

resource "aws_lambda_function" "poc_get_company_lambda" {
  filename      =  "../lambdas/build/company_get/main.zip"
  function_name = "poc_get_company_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/company_get/main.zip")
  runtime = "go1.x"
}

resource "aws_lambda_function" "poc_update_company_lambda" {
  filename      =  "../lambdas/build/company_update/main.zip"
  function_name = "poc_update_company_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/company_update/main.zip")
  runtime = "go1.x"
}

resource "aws_lambda_function" "poc_delete_company_lambda" {
  filename      =  "../lambdas/build/company_delete/main.zip"
  function_name = "poc_delete_company_lambda"
  role          = aws_iam_role.poc_lambda_role.arn
  handler       = "main"
  source_code_hash = filebase64sha256("../lambdas/build/company_delete/main.zip")
  runtime = "go1.x"
}