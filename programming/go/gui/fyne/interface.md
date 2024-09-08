# interface
# CanvasObject
- https://docs.fyne.io/api/v2.5/canvasobject
```go
type CanvasObject interface {
        MinSize() Size
        Move(Position)
        Position() Position
        Resize(Size)
        Size() Size
        Hide()
        Visible() bool
        Show()
        Refresh()
}
```
# Widget
- https://docs.fyne.io/api/v2.5/widget
```go
type Widget interface {
        CanvasObject
        CreateRenderer() WidgetRenderer
}
```
## WidgetRenderer
- https://docs.fyne.io/api/v2.5/widgetrenderer
```go
type WidgetRenderer interface {
        Destroy()
        Layout(Size)
        MinSize() Size
        Objects() []CanvasObject
        Refresh()
}```
# Container
- https://docs.fyne.io/api/v2.5/container
```go
type Container struct {
}
func (c *Container) Add(add CanvasObject)
func (c *Container) AddObject(o CanvasObject)
func (c *Container) Hide()
func (c *Container) MinSize() Size
func (c *Container) Move(pos Position)
func (c *Container) Position() Position
func (c *Container) Refresh()
func (c *Container) Remove(rem CanvasObject)
func (c *Container) RemoveAll()
func (c *Container) Resize(size Size)
func (c *Container) Show()
func (c *Container) Size() Size
func (c *Container) Visible() bool
```
# Window
- https://docs.fyne.io/api/v2.5/window
```go
type Window interface {
	Title() string
	SetTitle(string)
	FullScreen() bool
	SetFullScreen(bool)
	Resize(Size)
	RequestFocus()
	FixedSize() bool
	SetFixedSize(bool)
	CenterOnScreen()
	Padded() bool
	SetPadded(bool)
	Icon() Resource
	SetIcon(Resource)
	SetMaster()
	MainMenu() *MainMenu
	SetMainMenu(*MainMenu)
	SetOnClosed(func())
	SetCloseIntercept(func())
	SetOnDropped(func(Position, []URI))
	Show()
	Hide()
	Close()
	ShowAndRun()
	Content() CanvasObject
	SetContent(CanvasObject)
	Canvas() Canvas
	Clipboard() Clipboard
}
```
# Layout
- https://docs.fyne.io/api/v2.5/layout
```go
type Layout interface {
	Layout([]CanvasObject, Size)
	MinSize(objects []CanvasObject) Size
}
```
## Layout List
- https://docs.fyne.io/explore/layouts
```go
func NewStackLayout() fyne.Layout
```
## Box
- https://docs.fyne.io/container/box
```go
func NewSpacer() fyne.CanvasObject
func NewVBoxLayout() fyne.Layout
func NewHBoxLayout() fyne.Layout
```
## Center
- https://docs.fyne.io/container/center
## Border
- https://docs.fyne.io/container/border
```go
func NewBorder(top, bottom, left, right fyne.CanvasObject, objects ...fyne.CanvasObject) *fyne.Container
```
## Size, Position, Padding
- https://docs.fyne.io/api/v2.4/size
```go
type Size struct {
        Width  float32
        Height float32
}
```
- https://docs.fyne.io/api/v2.5/position
```go
type Position struct {
        X float32
        Y float32
}
```
- https://docs.fyne.io/api/v2.5/legacytheme
```go
func Padding() float32
```
