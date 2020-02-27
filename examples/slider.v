import vui

const (
	win_width = 250
	win_height = 250
)

struct App {
mut:
	hor_slider  &vui.Slider
	vert_slider &vui.Slider
	window      &vui.Window
}

fn main() {
	mut app := &App{}
	window := vui.window({
		width: win_width
		height: win_height
		title: 'Slider Example'
		user_ptr: app
	}, [
		vui.IWidgeter(vui.row({
			stretch: true
			alignment: .center
			margin: vui.MarginConfig{5,5,5,5}
			spacing: 10
		}, [
			vui.IWidgeter(vui.slider({
				width: 20
				height: 200
				orientation: .vertical
				max: 100
				val: 0
				on_value_changed: on_vert_value_changed
			})),
			vui.slider({
				width: 200
				height: 20
				orientation: .horizontal
				max: 100
				val: 0
				on_value_changed: on_hor_value_changed
			})
		]))
	])
	app.window = window
	vui.run(window)
}

fn on_hor_value_changed(app mut App) {
	//app.vert_slider.val = app.hor_slider.val
}

fn on_vert_value_changed(app mut App) {
	//app.hor_slider.val = app.vert_slider.val
}
