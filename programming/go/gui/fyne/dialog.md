# Dialog
# API
- https://docs.fyne.io/explore/dialogs
- https://docs.fyne.io/api/v2.4/dialog/

-- func ShowError(err error, parent fyne.Window)
-- func ShowInformation(title, message string, parent fyne.Window)
-- func ShowConfirm(title, message string, callback func(bool), parent fyne.Window)
-- func ShowFileOpen(callback func(fyne.URIReadCloser, error), parent fyne.Window)
-- func ShowFileSave(callback func(fyne.URIWriteCloser, error), parent fyne.Window)
-- func ShowFolderOpen(callback func(fyne.ListableURI, error), parent fyne.Window)

- https://www.youtube.com/watch?v=ouFB-1B10NE
- https://www.youtube.com/watch?v=IDpNzNO7BrM
- https://www.youtube.com/watch?v=OckSScHVF34
- https://blogvali.com/audio-player-demo-fyne-golang-gui-67/
- https://docs.fyne.io/api/v2.4/dialog/filedialog
-- func NewFileOpen(callback func(fyne.URIReadCloser, error), parent fyne.Window) *FileDialog
-- func NewFileSave(callback func(fyne.URIWriteCloser, error), parent fyne.Window) *FileDialog
-- func NewFolderOpen(callback func(fyne.ListableURI, error), parent fyne.Window) *FileDialog

- https://docs.fyne.io/api/v2.4/dialog/confirmdialog.html
-- func NewConfirm(title, message string, callback func(bool), parent fyne.Window) *ConfirmDialog

- https://docs.fyne.io/api/v2.4/dialog/formdialog.html
-- func NewForm(title, confirm, dismiss string, items []*widget.FormItem, callback func(bool), parent fyne.Window) *FormDialog

## ファイルフィルター
- https://docs.fyne.io/api/v2.4/storage/filefilter
-- func NewExtensionFileFilter(extensions []string) FileFilter
- https://docs.fyne.io/api/v2.4/dialog/filedialog
-- func (f *FileDialog) SetFilter(filter storage.FileFilter)
- https://docs.fyne.io/api/v2.4/dialog/filedialog
-- func (f *FileDialog) SetFileName(fileName string)
