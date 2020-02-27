import vui

const (
    win_width = 380
    win_height = 41
)

struct App {
mut:
    txt_box_celsius vui.TextBox
    txt_box_fahrenheit vui.TextBox
    lbl_fahrenheit &vui.Label
    lbl_celsius &vui.Label
    window     &vui.Window
}

fn main() {
    mut app := &App{}
    window := vui.window({
        width: win_width
        height: win_height
        title: 'Temperature Conv.'
        user_ptr: app
    },[
     vui.IWidgeter(vui.row({
            stretch: true
            alignment: .center
            margin: vui.MarginConfig{5,5,5,5}
            spacing: 10
        }, [
            vui.IWidgeter(vui.label({
                text: 'Celsius = '
            })), 
            vui.textbox({
                width: 70
                on_key_up: on_cel_key_up
                is_numeric: true
                ref: &app.txt_box_celsius
            }),
			vui.label({
                text: 'Fahrenheit'
            }),
            vui.textbox({
                width: 70
                on_key_up: on_fah_key_up
                is_numeric: true
                ref: &app.txt_box_fahrenheit
            })
            
        ])),
    ])

    app.window = window
    vui.run(window)
}

fn on_cel_key_up(app mut App){
    if app.txt_box_celsius.text.len <= 0 {
        app.txt_box_fahrenheit.set_text('0')
        return
    }
    celsius := app.txt_box_celsius.text.f64()
    fah := celsius * (9.0/5.0) + 32.0
    app.txt_box_fahrenheit.set_text(int(fah).str())
}

fn on_fah_key_up(app mut App){
    if app.txt_box_fahrenheit.text.len <= 0 {
        app.txt_box_celsius.set_text('0')
        return
    }
    fah := app.txt_box_fahrenheit.text.f64()
    cel := (fah - 32.0)*(5.0/9.0)
    app.txt_box_celsius.set_text(int(cel).str())
} 
