import vui

const (
	win_width = 250
	win_height = 250
)

struct App {
mut:
	window  &vui.Window
}

fn main() {
	mut app := &App{}
	window := vui.window({
		width: win_width
		height: win_height
		title: 'FillLayout'
		user_ptr: app
		resizable: true
		layout: vui.filllayout({
			align: .horizontal
		})
	}, [
			vui.IWidgeter(vui.button({
				text: 'Button1'
			})),
			vui.button({
				text: 'Button2'
			}),
			vui.button({
				text: 'Button3'
			}),
			vui.button({
				text: 'Button4'
			}),
	])

	app.window = window
	vui.run(window)
}
