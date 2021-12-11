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
	log.Logger.Debug().Msg("Start lambda delete company")
	err := inj.Instances["companyService"].(servicecompany.CompanyService).Delete(cxt, id)
	if err != nil {
		log.Logger.Error().Err(err).Msgf("ERROR on the company %v", id)
		return util.ResponseErrorFunction(err, fmt.Sprintf("Error when it is process request")), err
	}

	return true, nil
}

func main() {
	lambda.Start(LambdaHandler)
}
