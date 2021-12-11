package main

import (
	"context"

	inj "github.com/BenjaminBergerM/poc-appsync-golang-mongo/functions/company"
	"github.com/BenjaminBergerM/poc-appsync-golang-mongo/log"
	companymodel "github.com/BenjaminBergerM/poc-appsync-golang-mongo/model/company"
	servicecompany "github.com/BenjaminBergerM/poc-appsync-golang-mongo/service/company"
	"github.com/aws/aws-lambda-go/lambda"
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
