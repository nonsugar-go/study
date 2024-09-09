# Menu
- https://www.youtube.com/watch?v=uQY7U0Xim3E
- https://www.youtube.com/watch?v=g8CFqhaXNCI
- https://www.youtube.com/watch?v=qFMuMh_0p0A
- https://www.youtube.com/watch?v=HYrF7_PVqVU

- https://docs.fyne.io/api/v2.5/window.html
- https://docs.fyne.io/api/v2.5/mainmenu.html
- https://docs.fyne.io/api/v2.5/menu.html
- https://docs.fyne.io/api/v2.5/menuitem.html

```go
func main() {
 	a := app.New()
 	w := a.NewWindow("Sample")
 	label1 := widget.NewLabel("Hello")
 	btn1 := widget.NewButton("Click", func() {})
 	w.SetContent(container.NewVBox(
 		label1,
 		btn1,
 	))
 	item11 := fyne.NewMenuItem("Open", func() {})
 	item12 := fyne.NewMenuItem("Edit", func() {})
 	item12.ChildMenu = fyne.NewMenu("",
 		fyne.NewMenuItem("cut", func() {}),
 		fyne.NewMenuItem("copy", func() {}),
 		fyne.NewMenuItem("paste", func() {}),
 	)
 	menu1 := fyne.NewMenu("File", item11, item12)
 	item21 := fyne.NewMenuItem("About", func() {})
 	menu2 := fyne.NewMenu("Help", item21)
 	mainMenu := fyne.NewMainMenu(menu1, menu2)
 	w.SetMainMenu(mainMenu)
 	w.Resize(fyne.NewSize(400, 400))
 	w.ShowAndRun()
}
```
# Toolbar
- https://docs.fyne.io/widget/toolbar
- https://docs.fyne.io/api/v2.5/widget/toolbar
- https://docs.fyne.io/api/v2.5/widget/toolbaraction
- https://docs.fyne.io/api/v2.5/widget/toolbarseparator
- https://docs.fyne.io/api/v2.5/widget/toolbarspacer
## Icons
- https://docs.fyne.io/explore/icons
