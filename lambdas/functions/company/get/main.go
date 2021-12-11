package main

import (
	"context"
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
	inj "github.com/jjoc007/poc-appsync-golang-mongo/functions/company"
	"github.com/jjoc007/poc-appsync-golang-mongo/log"
	servicecompany "github.com/jjoc007/poc-appsync-golang-mongo/service/company"
	"github.com/jjoc007/poc-appsync-golang-mongo/util"
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
