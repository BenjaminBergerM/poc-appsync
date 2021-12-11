data "aws_caller_identity" "this" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "default_lambda_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
    ]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"]
  }
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/*:*"]
  }
}

data "aws_iam_policy_document" "dynamo_access_policy" {
  statement {
    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:Scan",
      "dynamodb:Query",
      "dynamodb:UpdateItem",
      "dynamodb:GetShardIterator",
      "dynamodb:DescribeStream",
      "dynamodb:ListStreams",
      "dynamodb:GetRecords"
    ]
    resources = ["arn:aws:dynamodb:*:*:table/*"]
  }
}

data "aws_iam_policy_document" "assume_role_policy_appsync" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "appsync.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "api_appsync_invoke_lambda" {
  statement {
    actions = [
      "lambda:InvokeFunction"
    ]
    resources = [
      # aws_lambda_function.poc_create_enrollment_lambda.arn,
      # aws_lambda_function.poc_update_enrollment_lambda.arn,
      # aws_lambda_function.poc_delete_enrollment_lambda.arn,
      # aws_lambda_function.poc_get_enrollment_lambda.arn,
      "arn:aws:lambda:us-east-1:553300625097:function:enrollments-qa-enrollment-products-getall"
    ]
  }
}