import vui

const (
	win_width = 250
	win_height = 250
)

struct App {
mut:
	dropdown   &vui.Dropdown
	window     &vui.Window
}

fn main() {
	mut app := &App{}
	window := vui.window({
		width: win_width
		height: win_height
		title: 'Dropdown'
		user_ptr: app
	}, [
		vui.IWidgeter(vui.column({
			stretch: true
			alignment: .left
			margin: vui.MarginConfig{5,5,5,5}
		},
		[
			vui.IWidgeter(vui.dropdown({
				width: 140
				def_text: "Select an option"
				items: [
					vui.DropdownItem{text:'Delete all users'},
					vui.DropdownItem{text:'Export users'},
					vui.DropdownItem{text:'Exit'},
				]
			}))
		]))
	])
	app.window = window
	vui.run(window)
}
