package main

import (
	"context"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jjoc007/poc-appsync-golang-mongo/errorapp"
	inj "github.com/jjoc007/poc-appsync-golang-mongo/functions/company"
	"github.com/jjoc007/poc-appsync-golang-mongo/log"
	companymodel "github.com/jjoc007/poc-appsync-golang-mongo/model/company"
	servicecompany "github.com/jjoc007/poc-appsync-golang-mongo/service/company"
)

func LambdaHandler(cxt context.Context, company *companymodel.Company) (interface{}, error) {
	log.Logger.Debug().Msg("Start lambda create company")
	err := inj.Instances["companyService"].(servicecompany.CompanyService).Create(cxt, company)
	if err != nil {
		log.Logger.Error().Msgf("ERROR on the company %v", company)
		return errorapp.ErrorHandler(err, company)
	}
	return company, nil
}

func main() {
	lambda.Start(LambdaHandler)
}
