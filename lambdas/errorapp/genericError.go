package errorapp

type App struct {
	Type    Type        `json:"errorType"`
	Message string      `json:"message"`
	Data    interface{} `json:"data"`
}

func (e *App) Error() string {
	return e.Message
}

func New(t Type, m string, d interface{}) *App {
	return &App{
		Type:    t,
		Message: m,
		Data:    d,
	}
}
