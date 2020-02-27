import vui
import time

const (
	win_width = 287
	win_height = 110
)

struct App {
mut:
	lbl_elapsed_value vui.Label
	progress_bar vui.ProgressBar
	slider vui.Slider
	window     &vui.Window
	duration f32 = 25.0
	elapsed_time f32 = 0.0
}

fn main() {
	mut app := &App{}
	window := vui.window({
		width: win_width
		height: win_height
		title: 'Timer'
		user_ptr: app
	}, [
		vui.IWidgeter(vui.column({
			stretch: true
			margin: vui.MarginConfig{5,5,5,5}
			alignment: .left
		}, [
		vui.IWidgeter(vui.row({
			alignment: .top
			spacing: 10
		}, [
			vui.IWidgeter(vui.column({
				alignment: .left
				spacing: 10
			}, [
				vui.IWidgeter(vui.label({
					text: 'Elapsed Time:'
				})),
				vui.label({
					text: 'Duration:'
				}),
				vui.button({
					text: 'Reset'
					onclick: on_reset
				})
			])),
			vui.column({
				alignment: .left
				spacing: 10
			}, [
				vui.IWidgeter(vui.label({
					text: '00.0s'
					ref:  &app.lbl_elapsed_value
				})),
				vui.slider({
					width: 180
					height: 20
					orientation: .horizontal
					max: 50
					min: 0
					val: app.duration
					on_value_changed: on_value_changed
					ref: &app.slider
				})
			])
		])),
			vui.progressbar({
				height: 20
				val: 0
				max: 100
				ref: &app.progress_bar
			})
		]))
	])
	app.window = window
	go app.timer()
	vui.run(window)
}

fn on_value_changed(app mut App) {
	app.duration = app.slider.val
}

fn on_reset(app mut App) {
	app.elapsed_time = 0.0
}

fn (app mut App) timer() {
	for {
		if app.elapsed_time == app.duration {
			continue
		}
		if app.elapsed_time > app.duration {
			app.elapsed_time = app.duration
		} else {
			app.elapsed_time += 0.1
		}
		app.lbl_elapsed_value.set_text(app.elapsed_time.str() + "s")
		if app.duration == 0 {
			app.progress_bar.val = 100
		} else {
			app.progress_bar.val = int(app.elapsed_time * 100.0 / app.duration)
		}
		time.usleep(100000)
	}
}
