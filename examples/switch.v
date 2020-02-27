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
		title: 'Switch'
		user_ptr: app
	}, [
		vui.IWidgeter(vui.switcher({
			open: true
		}))
	])
	app.window = window
	vui.run(window)
}
