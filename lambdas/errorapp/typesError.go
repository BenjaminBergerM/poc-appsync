package errorapp

import (
	"bytes"
	"encoding/json"
)

type Type int

const (
	BadRequest Type = iota
	NotFound
	InternalError
)

func (e Type) String() string {
	return errorsID[e]
}

var errorsID = map[Type]string{
	BadRequest:    "BAD_REQUEST",
	NotFound:      "NOT_FOUND",
	InternalError: "INTERNAL_ERROR",
}

var errorsName = map[string]Type{
	"BAD_REQUEST":    BadRequest,
	"NOT_FOUND":      NotFound,
	"INTERNAL_ERROR": InternalError,
}

func (e *Type) MarshalJSON() ([]byte, error) {
	buffer := bytes.NewBufferString(`"`)
	buffer.WriteString(errorsID[*e])
	buffer.WriteString(`"`)
	return buffer.Bytes(), nil
}

func (e *Type) UnmarshalJSON(b []byte) error {
	var s string
	err := json.Unmarshal(b, &s)
	if err != nil {
		return err
	}
	*e = errorsName[s]
	return nil
}

func ErrorHandler(err error, data interface{}) (*App, error) {
	switch err.Error() {
	case errorsID[NotFound]:
		return New(NotFound, err.Error(), data), nil

	default:
		return nil, err
	}
}
