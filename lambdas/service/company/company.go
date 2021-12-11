package servicecompany

import (
	"context"
	"github.com/jjoc007/poc-appsync-golang-mongo/log"
	modelcompany "github.com/jjoc007/poc-appsync-golang-mongo/model/company"
	repositorycompany "github.com/jjoc007/poc-appsync-golang-mongo/repository/company"
	"github.com/pkg/errors"
)

// CompanyService describes the structure a Company service.
type CompanyService interface {
	Create(context.Context,*modelcompany.Company) error
	Update(context.Context,*modelcompany.Company) error
	Get(context.Context,string) (*modelcompany.Company, error)
	Delete(context.Context,string) error
}

// New creates and returns a new lock service instance
func New(rep repositorycompany.CompanyRepository) CompanyService {
	return &companyService{
		repository:             rep,
	}
}

type companyService struct {
	repository             repositorycompany.CompanyRepository
}

func (s *companyService) Create(ctx context.Context, resource *modelcompany.Company) error {
	log.Logger.Debug().Msg("Creating company on services")
	err := s.repository.Create(ctx, resource)
	if err != nil {
		return errors.Wrapf(err, "Error creating company on services [%s]", resource.ID)
	}
	return nil
}

func (s *companyService) Get(ctx context.Context,id string) (*modelcompany.Company, error) {
	log.Logger.Debug().Msg("Getting a animal on services")
	company, err := s.repository.GetByID(ctx, id)
	if err != nil {
		return nil, errors.Wrapf(err, "Error getting company on services [%s]", id)
	}
	return company, nil
}

func (s *companyService) Delete(ctx context.Context,id string) error {
	log.Logger.Debug().Msg("Deleting a animal on services")
	err := s.repository.Delete(ctx, id)
	if err != nil {
		return errors.Wrapf(err, "Deleting a company on services [%s]", id)
	}
	return nil
}

func (s *companyService) Update(ctx context.Context,resource *modelcompany.Company) error {
	log.Logger.Debug().Msg("Updating pipeline on services")
	err := s.repository.Update(ctx, resource)
	if err != nil {
		return errors.Wrapf(err, "Error updating company on services [%s]", resource.ID)
	}
	return nil
}
