import vui

const (
	win_width = 300
	win_height = 300
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
		title: 'Group Demo'
		user_ptr: app
	}, [
		vui.IWidgeter(vui.group({
		    x:20
		    y:20
			title: 'Group Demo'
			children: [
				vui.IWidgeter(vui.textbox({
					max_len: 20
					width: 200
					placeholder: 'First name'
				})),
				vui.IWidgeter(vui.textbox({
					max_len: 50
					width: 200
					placeholder: 'Last name'
				})),
				vui.checkbox({
					checked: true
					text: 'Online registration1'
				}),
				vui.checkbox({
					checked: true
					text: 'Online registration2'
				}),
				vui.checkbox({
					checked: true
					text: 'Online registration3'
				}),
				vui.button({
					text: 'Add user'
				}),
			]
		}))
	])
	app.window = window
	vui.run(window)
}
