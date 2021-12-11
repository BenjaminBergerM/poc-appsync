package repositorycompany

import (
	"context"
	"errors"
	"fmt"
	companymodel "github.com/jjoc007/poc-appsync-golang-mongo/model/company"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"github.com/jjoc007/poc-appsync-golang-mongo/config"
	"github.com/jjoc007/poc-appsync-golang-mongo/log"
)

// CompanyRepository describes the company repository.
type CompanyRepository interface {
	Create(context.Context, *companymodel.Company) error
	Update(context.Context, *companymodel.Company) error
	GetByID(context.Context, string) (*companymodel.Company, error)
	Delete(context.Context, string) error
}

// NewRepositoryMongoDB creates and returns a new Plugin repository instance
func NewRepositoryMongoDB(database *mongo.Database) CompanyRepository {
	return &repositoryMongoDB{
		collection: database.Collection(config.POCCompanyCollection),
	}
}

type repositoryMongoDB struct {
	collection *mongo.Collection
}

func (s *repositoryMongoDB) Create(ctx context.Context, resource *companymodel.Company) (err error) {
	log.Logger.Debug().Msgf("Adding a new company [%s] ", resource.Name)

	insertResult, err := s.collection.InsertOne(ctx, resource)
	if err != nil {
		return errors.New("Error when it adds a new Company")
	}
	log.Logger.Debug().Msgf("ID %v documents.\n", insertResult.InsertedID)
	return nil
}

func (s *repositoryMongoDB) Update(ctx context.Context, resource *companymodel.Company) (err error) {
	log.Logger.Debug().Msgf("Adding a new company [%s] ", resource.Name)

	filter := bson.M{"_id": resource.ID}
	data := bson.D{bson.E{Key: "$set", Value: resource}}
	updateResult, err := s.collection.UpdateOne(ctx, filter, data)
	if err != nil {
		return errors.New("Error when it updates the company")
	}
	if updateResult.MatchedCount == 0 {
		return errors.New(fmt.Sprintf("Not Found the Plugin by ID [%s] to Update", resource.ID))
	}
	log.Logger.Debug().Msgf("Documents updated [%d]", updateResult.UpsertedCount)
	return nil
}

func (s *repositoryMongoDB) GetByID(ctx context.Context, id string) (animal *companymodel.Company, err error) {
	log.Logger.Debug().Msgf("Getting Company by ID")

	filter := bson.M{"_id": id}
	res := s.collection.FindOne(ctx, filter)
	if res.Err() != nil && res.Err() == mongo.ErrNoDocuments {
		return nil, errors.New(res.Err().Error())
	} else if res.Err() != nil {
		return nil, errors.New(res.Err().Error())
	}
	var company companymodel.Company
	err = res.Decode(&company)
	if err != nil {
		return nil, errors.New(res.Err().Error())
	}
	return &company, nil
}

func (s repositoryMongoDB) Delete(ctx context.Context, id string) (err error) {
	log.Logger.Debug().Msgf("Deleting an animal [%s] ", id)

	filter := bson.M{"_id": bson.M{"$eq": id}}
	deleteResult, err := s.collection.DeleteOne(ctx, filter, options.Delete())
	if err != nil {
		return errors.New(err.Error())
	}
	if deleteResult.DeletedCount == 0 {
		return errors.New(fmt.Sprintf("Not Found the organization by ID [%s] to Deleted", id))
	}
	log.Logger.Debug().Msgf("Matched documents to delete %v .\n", deleteResult.DeletedCount)
	return
}
