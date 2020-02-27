import vui
import os

const (
	win_width = 400
	win_height = 400
	picture_width_and_height = 100
)

struct App {
mut:
	x_transition vui.Transition
	y_transition vui.Transition
	picture vui.Picture
	state   int
	window  &vui.Window
}

fn main() {
	mut app := &App{
		state: 0
	}
	window := vui.window({
		width: win_width
		height: win_height
		title: 'V UI Demo'
		user_ptr: app
	},
	[
		vui.IWidgeter(vui.column({
			stretch: true
			margin: vui.MarginConfig{5,5,5,5}
		},[
			vui.IWidgeter(vui.button({
				text: 'Slide'
				onclick: btn_toggle_click
			})),
			vui.picture({
				width: picture_width_and_height
				height: picture_width_and_height
				path: os.resource_abs_path('logo.png')
				ref: &app.picture
			}),
			vui.transition({
				duration: 750
				easing: vui.easing(.ease_in_out_cubic)
				ref: &app.x_transition
			}),
			vui.transition({
				duration: 750
				easing: vui.easing(.ease_in_out_quart)
				ref: &app.y_transition
			})
		]))
	])
	app.window = window
	vui.run(window)
}

fn btn_toggle_click(app mut App) {
	if app.x_transition.animated_value == 0 || app.y_transition.animated_value == 0 {
		app.x_transition.set_value(&app.picture.offset_x)
		app.y_transition.set_value(&app.picture.offset_y)
	}
	match (app.state) {
		0 {
			app.x_transition.target_value = 32
			app.y_transition.target_value = 32
			app.state = 1
		}
		1 {
			app.x_transition.target_value = win_width - (picture_width_and_height + 32)
			app.y_transition.target_value = win_height - (picture_width_and_height + 32)
			app.state = 2
		}
		2 {
			app.x_transition.target_value = win_width - (picture_width_and_height + 32)
			app.y_transition.target_value = 32
			app.state = 3
		}
		3 {
			app.x_transition.target_value = 32
			app.y_transition.target_value = win_height - (picture_width_and_height + 32)
			app.state = 4
		}
		4 {
			app.x_transition.target_value = win_width / 2 - (picture_width_and_height / 2)
			app.y_transition.target_value = win_height / 2 - (picture_width_and_height / 2)
			app.state = 0
		}
		else { app.state = 0 }
	}
}
