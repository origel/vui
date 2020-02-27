import vui
import gx

const (
	win_width = 64 * 4 + 25
	win_height = 74
)

struct App {
mut:
	window  &vui.Window
}

fn main() {
	mut app := &App{ window: 0 }
	window := vui.window({
		width: win_width
		height: win_height
		title: 'V UI Window'
		user_ptr: app
	}, [
		vui.IWidgeter(vui.row({
			alignment: .center
			spacing: 5
			margin: vui.MarginConfig{5,5,5,5}
		}, [
			vui.IWidgeter(vui.rectangle({ ref: 0, height: 64, width: 64, color: gx.Color { r: 255, g: 100, b: 100 } })),
			vui.rectangle({ ref: 0, height: 64, width: 64, color: gx.Color { r: 255, g: 100, b: 100 }, border: true, border_color: gx.Color { r: 0, g: 0, b: 0 }}),
			vui.rectangle({ ref: 0, height: 64, width: 64, color: gx.Color { r: 255, g: 100, b: 100 }, radius: 24 }),
			vui.rectangle({ ref: 0, height: 64, width: 64, color: gx.Color { r: 255, g: 100, b: 100 }, radius: 24, border: true, border_color: gx.Color { r: 0, g: 0, b: 0 }})
		]))
	])

	app.window = window
	vui.run(window)
}
