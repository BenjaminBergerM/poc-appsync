package company

import (
	"github.com/BenjaminBergerM/poc-appsync-golang-mongo/config/db"
	"github.com/BenjaminBergerM/poc-appsync-golang-mongo/log"
	repositorycompany "github.com/BenjaminBergerM/poc-appsync-golang-mongo/repository/company"
	servicecompany "github.com/BenjaminBergerM/poc-appsync-golang-mongo/service/company"
	"go.mongodb.org/mongo-driver/mongo"
)

// Instances is a global map that contain all object instances of app
var Instances = MakeDependencyInjection()

// MakeDependencyInjection Initialize all dependencies
func MakeDependencyInjection() map[string]interface{} {
	log.Logger.Debug().Msg("Start bootstrap app objects")
	instances := make(map[string]interface{})

	database, err := db.NewMongoDBStorage()
	if err != nil {
		panic(err)
	}
	instances["dataBase"] = database

	instances["companyRepository"] = repositorycompany.NewRepositoryMongoDB(database.GetConnection().(*mongo.Database))

	instances["companyService"] = servicecompany.New(
		instances["companyRepository"].(repositorycompany.CompanyRepository))

	log.Logger.Debug().Msg("End bootstrap app objects")
	return instances
}
