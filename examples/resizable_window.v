import vui

const (
	win_width = 250
	win_height = 250
)

struct App {
mut:
	window     &vui.Window
}

fn main() {
	mut app := &App{}
	window := vui.window({
		width: win_width
		height: win_height
		title: 'Resizable Window'
		resizable: true
		user_ptr: app
	}, [
		vui.IWidgeter(vui.row({
			stretch: true,
			margin: vui.MarginConfig{10,10,10,10}
		}, [
			vui.IWidgeter(vui.button({
				text: 'Add user'
			}))
		]))]
	)

	app.window = window
	vui.run(window)
}
