package company

type Company struct {
	ID      string `json:"id" bson:"_id,omitempty"`
	Name    string `json:"name" bson:"name,omitempty"`
	Phone   string `json:"phone" bson:"phone,omitempty"`
	Address string `json:"address" bson:"address,omitempty"`
}
