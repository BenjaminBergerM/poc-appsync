package main

import (
	"context"
	"fmt"

	inj "github.com/BenjaminBergerM/poc-appsync-golang-mongo/functions/company"
	"github.com/BenjaminBergerM/poc-appsync-golang-mongo/log"
	servicecompany "github.com/BenjaminBergerM/poc-appsync-golang-mongo/service/company"
	"github.com/BenjaminBergerM/poc-appsync-golang-mongo/util"
	"github.com/aws/aws-lambda-go/lambda"
)

func LambdaHandler(cxt context.Context, id string) (interface{}, error) {
	log.Logger.Debug().Msgf("Start lambda get company by id %s", id)
	company, err := inj.Instances["companyService"].(servicecompany.CompanyService).Get(cxt, id)
	if err != nil {
		log.Logger.Error().Err(err).Msgf("ERROR %v", id)
		return util.ResponseErrorFunction(err, fmt.Sprintf("Error when it is process request")), err
	}

	return company, nil
}

func main() {
	lambda.Start(LambdaHandler)
}
