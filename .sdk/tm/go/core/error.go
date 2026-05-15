package core

type BizFactoryError struct {
	IsBizFactoryError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewBizFactoryError(code string, msg string, ctx *Context) *BizFactoryError {
	return &BizFactoryError{
		IsBizFactoryError: true,
		Sdk:              "BizFactory",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *BizFactoryError) Error() string {
	return e.Msg
}
