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
}
```
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
## Box
- https://docs.fyne.io/container/box
- https://docs.fyne.io/api/v2.5/layout/
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
func NewBorderLayout(top, bottom, left, right fyne.CanvasObject) fyne.Layout
```
## Size, Position, Padding
- https://docs.fyne.io/api/v2.5/size
```go
type Size struct {
        Width  float32 // The number of units along the X axis.
        Height float32 // The number of units along the Y axis.
}
func MeasureText(text string, size float32, style TextStyle) Size
func NewSize(w float32, h float32) Size
func NewSquareSize(side float32) Size
func (s Size) Add(v Vector2) Size
func (s Size) AddWidthHeight(width, height float32) Size
func (s Size) Components() (float32, float32)
func (s Size) IsZero() bool
func (s Size) Max(v Vector2) Size
func (s Size) Min(v Vector2) Size
func (s Size) Subtract(v Vector2) Size
func (s Size) SubtractWidthHeight(width, height float32) Size
```
- https://docs.fyne.io/api/v2.5/position
```go
type Position struct {
        X float32 // The position from the parent's left edge
        Y float32 // The position from the parent's top edge
}
func NewPos(x float32, y float32) Position
func NewSquareOffsetPos(length float32) Position
func (p Position) Add(v Vector2) Position
func (p Position) AddXY(x, y float32) Position
func (p Position) Components() (float32, float32)
func (p Position) IsZero() bool
func (p Position) Subtract(v Vector2) Position
func (p Position) SubtractXY(x, y float32) Position```
```
- https://docs.fyne.io/api/v2.5/legacytheme
```go
type LegacyTheme interface {
	BackgroundColor() color.Color
	ButtonColor() color.Color
	DisabledButtonColor() color.Color
	TextColor() color.Color
	DisabledTextColor() color.Color
	PlaceHolderColor() color.Color
	PrimaryColor() color.Color
	HoverColor() color.Color
	FocusColor() color.Color
	ScrollBarColor() color.Color
	ShadowColor() color.Color
	TextSize() int
	TextFont() Resource
	TextBoldFont() Resource
	TextItalicFont() Resource
	TextBoldItalicFont() Resource
	TextMonospaceFont() Resource
	Padding() int
	IconInlineSize() int
	ScrollBarSize() int
	ScrollBarSmallSize() int
}
```
