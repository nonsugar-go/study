# interface
# CanvasObject
- https://docs.fyne.io/api/v2.5/canvasobject
```go
type CanvasObject interface {

	// MinSize returns the minimum size this object needs to be drawn.
	MinSize() Size
	// Move moves this object to the given position relative to its parent.
	// This should only be called if your object is not in a container with a layout manager.
	Move(Position)
	// Position returns the current position of the object relative to its parent.
	Position() Position
	// Resize resizes this object to the given size.
	// This should only be called if your object is not in a container with a layout manager.
	Resize(Size)
	// Size returns the current size of this object.
	Size() Size

	// Hide hides this object.
	Hide()
	// Visible returns whether this object is visible or not.
	Visible() bool
	// Show shows this object.
	Show()

	// Refresh must be called if this object should be redrawn because its inner state changed.
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
-- https://developer.fyne.io/api/v2.5/widgetrenderer.html#type-widgetrenderer
```go
type WidgetRenderer interface {
        Destroy()
        Layout(Size)
        MinSize() Size
        Objects() []CanvasObject
        Refresh()
}
```
# Container
- https://developer.fyne.io/api/v2.5/container.html#type-container
```go
type Container struct {
        Hidden bool
        Layout Layout
        Objects []CanvasObject
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
-- https://developer.fyne.io/api/v2.5/container/#func--new
```go
func New(layout fyne.Layout, objects ...fyne.CanvasObject) *fyne.Container
```
# Window
- https://developer.fyne.io/api/v2.5/window.html#type-window
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
- https://developer.fyne.io/api/v2.5/layout.html#type-layout
```go
 package fyne // import "fyne.io/fyne/v2"
 
type Layout interface {
 	Layout([]CanvasObject, Size)
 	MinSize(objects []CanvasObject) Size
}
```
## Layout List
- https://developer.fyne.io/explore/layouts
```go
func NewStackLayout() fyne.Layout
```
-- https://developer.fyne.io/container/box
```go
func NewSpacer() fyne.CanvasObject
func NewVBoxLayout() fyne.Layout
func NewHBoxLayout() fyne.Layout
```
-- https://developer.fyne.io/container/center
-- https://developer.fyne.io/container/border
```go
func NewBorder(top, bottom, left, right fyne.CanvasObject, objects ...fyne.CanvasObject) *fyne.Container
```
## Size, Position, Padding
- https://developer.fyne.io/api/v2.5/size.html#type-size
```go
type Size struct {
        Width  float32
        Height float32
}

- https://developer.fyne.io/api/v2.5/position.html#type-position
```go
type Position struct {
        X float32
        Y float32
}
```
- https://developer.fyne.io/api/v2.5/legacytheme.html
```go
func Padding() float32
```
