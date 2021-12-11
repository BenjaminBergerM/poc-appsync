package main

import (
	"context"
	"github.com/aws/aws-lambda-go/lambda"
	inj "github.com/jjoc007/poc-appsync-golang-mongo/functions/company"
	"github.com/jjoc007/poc-appsync-golang-mongo/log"
	companymodel "github.com/jjoc007/poc-appsync-golang-mongo/model/company"
	servicecompany "github.com/jjoc007/poc-appsync-golang-mongo/service/company"
)

func LambdaHandler(cxt context.Context, company *companymodel.Company) (*companymodel.Company, error) {
	log.Logger.Debug().Msg("Start lambda update company")
	err := inj.Instances["companyService"].(servicecompany.CompanyService).Update(cxt, company)
	if err != nil {
		log.Logger.Err(err).Msgf("ERROR on the Component %v", company)
		return &companymodel.Company{}, err
	}
	return company, nil
}

func main() {
	lambda.Start(LambdaHandler)
}
