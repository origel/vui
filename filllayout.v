module vui

pub enum FillLayoutAlignment {
	vertical = 0
	horizontal = 1
}

pub struct FillLayoutConfig {
	align FillLayoutAlignment
}

pub struct FillLayout {
mut:
	align FillLayoutAlignment
}

pub fn filllayout(c FillLayoutConfig) &FillLayout {
	mut sw := &FillLayout{
		align: c.align
	}
	return sw
}

fn (b mut FillLayout) layout(x, y, w, h int, children []IWidgeter) {
    println("w:$w, h:$h")

	if b.align == FillLayoutAlignment.vertical {
		mut start_y := 0
		mut height := h/children.len
		/*for widget in children {
			//widget.set_pos(0, start_y)
			//widget.propose_size(w, height)
			//start_y = start_y + height
		}*/
	}else{
		mut start_x := 0
		mut width := w/children.len
		/*for widget in children {
			//widget.set_pos(start_x, 0)
			//widget.propose_size(width, h)
			//start_x = start_x + width
		}*/
	}
}
