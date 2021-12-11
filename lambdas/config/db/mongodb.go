package db

import (
	"context"
	"github.com/jjoc007/poc-appsync-golang-mongo/config"
	"github.com/jjoc007/poc-appsync-golang-mongo/log"
	"github.com/pkg/errors"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readpref"
)

type mongoDataBase struct {
	databaseConnection *mongo.Database
}

// NewMongoDBStorage creates and returns a new Lock mongo db connection instance
func NewMongoDBStorage() (DataBase, error) {
	log.Logger.Info().Msg("New instance MongoDB storage")
	dataBase := &mongoDataBase{}
	err := dataBase.OpenConnection()
	if err != nil {
		return nil, err
	}
	return dataBase, nil
}

// OpenConnection start mongo db atlas connection
func (db *mongoDataBase) OpenConnection() error {

	log.Logger.Info().Msg("Starting MongoDB connection")
	var url = "mongodb+srv://hola:hola@cluster0.alsxe.mongodb.net/test"
	clientOptions := options.Client().ApplyURI(url)

	ctx, cancelFunc := context.WithTimeout(context.Background(), config.Timeout)
	defer cancelFunc()
	client, err := mongo.Connect(ctx, clientOptions)
	if err != nil {
		return errors.Wrap(err, "Error on connection to mongoDB")
	}
	err = client.Ping(ctx, readpref.Primary())
	if err != nil {
		return errors.Wrap(err, "Error when it did the ping to mongoDB")
	}

	db.databaseConnection = client.Database("test")
	log.Logger.Info().Msg("MongoDB UP")
	return nil
}

// GetConnection get mongo db atlas connection
func (db *mongoDataBase) GetConnection() interface{} {
	return db.databaseConnection
}

// CloseConnection close mongo db atlas connection
func (db *mongoDataBase) CloseConnection() {
	ctx, cancelFunc := context.WithTimeout(context.Background(), config.Timeout)
	defer cancelFunc()
	err := db.databaseConnection.Client().Disconnect(ctx)
	if err != nil {
		log.Logger.Err(err).Msg("Error when it did the disconnection to mongoDB")
		panic(err)
	}
}
