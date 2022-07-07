global.__outline_compatible = false;
if (shaders_are_supported()) {
	if (shader_is_compiled(shd_outline)) {
		global.__outline_compatible = true;
	}
}

#macro __OUTLINE_OPTIONAL_ARGS \
\					// Default settings  -  Change them if you want
\
_thick	= 1.0,\		// line_width
_col	= c_black,\	// line_col
_alpha	= 1.0,\		// line_alpha
_tol	= 0.0,\		// tolerance
_res	= 1.0,\		// resolution
_round	= 1.0,\		// roundness
_uv_bnd	= true		// uv_bound_mode

//--------------------------------------------------------------//
//                           INTERNAL                           //
//--------------------------------------------------------------//

function __internal_outline_init() {
	if (!variable_instance_exists(id, "__outline_uniforms_initiated")) {
		__u_outline_line_color	= shader_get_uniform(shd_outline, "u_line_color");
		__u_outline_pixel_size	= shader_get_uniform(shd_outline, "u_pixel_size");
		__u_outline_thickness	= shader_get_uniform(shd_outline, "u_thickness");
		__u_outline_roundness	= shader_get_uniform(shd_outline, "u_roundness");
		__u_outline_tolerance	= shader_get_uniform(shd_outline, "u_tolerance");
		__u_outline_uv			= shader_get_uniform(shd_outline, "u_uv");
				
		variable_instance_set(id, "__outline_uniforms_initiated", true);
	};
};

function __internal_outline_start() {
	if (shader_current() != shd_outline) && (global.__outline_compatible) {
		shader_set(shd_outline);	
	};
};

function __internal_outline_set_uniforms(_texture, _uv, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd) {
	
	var _w = texture_get_texel_width(_texture);
	var _h = texture_get_texel_height(_texture);
	
	var _color = [
		colour_get_red(_col)/255,
		colour_get_green(_col)/255,
		colour_get_blue(_col)/255,
		_alpha,
	];
	
	shader_set_uniform_f_array(__u_outline_line_color, _color);
	shader_set_uniform_f_array(__u_outline_pixel_size, [_w*(1.0/_res), _h*(1.0/_res)]);
	shader_set_uniform_f(__u_outline_thickness, _thick*_res);
	shader_set_uniform_f(__u_outline_roundness, _round);
	shader_set_uniform_f(__u_outline_tolerance, _tol);
	shader_set_uniform_f(__u_outline_uv, _uv[0], _uv[1], _uv[2], _uv[3]);
};
	
function outline_end() {
	shader_reset();
};


//--------------------------------------------------------------//
//                             TEXT                             //
//--------------------------------------------------------------//

///@func outline_set_text([line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_set_text(__OUTLINE_OPTIONAL_ARGS) {
	__internal_outline_init();
	__internal_outline_start();
	var _font = draw_get_font();
	var _texture = font_get_texture(_font);
	var _uv = _uv_bnd ? font_get_uvs(_font) : [0.0, 0.0, 1.0, 1.0];
	__internal_outline_set_uniforms(_texture, _uv, _thick, _col, _alpha, _tol, _res, _round, _uv);
}

///@func outline_create_sprite_text(font, string, col, alpha, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_create_sprite_text(_font, _string, _str_col, _str_alpha, __OUTLINE_OPTIONAL_ARGS) {
	
	var _cur_font = draw_get_font();
	var _cur_shad = shader_current();
	
	if (_cur_font != _font) {
		draw_set_font(_font);
	}
	if (_cur_shad) {
		shader_reset();
	}
		
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	var _str_w = string_width(_string);
	var _str_h = string_height(_string);
	var _xx = 0;
	var _yy = 0;
	
	switch (_halign) {
		case fa_center: {_xx = _str_w*0.5}	break;
		case fa_right:  {_xx = _str_w}		break;
	}
	switch (_valign) {
		case fa_middle: {_yy = _str_h*0.5}	break;
		case fa_bottom: {_yy = _str_h}		break;
	}
	
	var _gap = max(_thick, 0);
	var _wid = _str_w+(_gap*2);
	var _hei = _str_h+(_gap*2);
	var _surf1, _surf2, _surf_spr;
	
	_surf1= surface_create(_wid, _hei);
	surface_set_target(_surf1);
		draw_clear_alpha(0, 0);
		draw_text(_xx+_gap, _yy+_gap, _string);
	surface_reset_target();
	
	_surf2 = surface_create(_wid, _hei)
	outline_set_surface(_surf2, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	surface_set_target(_surf2);
		draw_clear_alpha(0, 0);
		gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
		draw_surface_ext(_surf1, 0, 0, 1, 1, 0, _str_col, _str_alpha);
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	outline_end();
	
	_surf_spr = sprite_create_from_surface(_surf2, 0, 0, _wid, _hei, false, false, _gap+_xx, _gap+_yy);
	
	if (_cur_font != _font) {
		draw_set_font(_cur_font);
	}
	if (_cur_shad) {
		shader_set(_cur_shad);
	}
	
	surface_free(_surf1);
	surface_free(_surf2);
	
	return _surf_spr;
}

///@func outline_create_sprite_text_ext(font, string, sep, w, col, alpha, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_create_sprite_text_ext(_font, _string, _sep, _w, _str_col, _str_alpha, __OUTLINE_OPTIONAL_ARGS) {
	
	var _cur_font = draw_get_font();
	var _cur_shad = shader_current();
	
	if (_cur_font != _font) {
		draw_set_font(_font);
	}
	if (_cur_shad) {
		shader_reset();
	}
		
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	
	var _extra_lines = 4;
	var _gap = max(_thick, 0);
	var _str_w = string_width(_string);
	var _lines = floor(_str_w/_w);
	var _wid = (_str_w/_lines)+(2*_gap);
	var _hei = ((_lines+_extra_lines)*_sep)+(2*_gap);
	var _surf1, _surf2, _surf_spr;
	
	var _xx = 0;
	var _yy = 0;
	
	switch (_halign) {
		case fa_center: {_xx = (_str_w/_lines)*0.5}	break;
		case fa_right:  {_xx = (_str_w/_lines)}		break;
	}
	switch (_valign) {
		case fa_middle: {_yy = ((_lines+_extra_lines)*_sep)*0.5}	break;
		case fa_bottom: {_yy = ((_lines+_extra_lines)*_sep)	}		break;
	}
	
	_surf1= surface_create(_wid, _hei);
	surface_set_target(_surf1);
		draw_clear_alpha(0, 0);
		draw_text_ext(_xx+_gap, _yy+_gap, _string, _sep, _w);
	surface_reset_target();
	
	_surf2 = surface_create(_wid, _hei)
	outline_set_surface(_surf2, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	surface_set_target(_surf2);
		draw_clear_alpha(0, 0);	
		gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
		draw_surface_ext(_surf1, 0, 0, 1, 1, 0, _str_col, _str_alpha);
		gpu_set_blendmode(bm_normal)
	surface_reset_target();
	outline_end();
	
	_surf_spr = sprite_create_from_surface(_surf2, 0, 0, _wid, _hei, false, false, _gap+_xx, _gap+_yy);
	
	if (_cur_font != _font) {
		draw_set_font(_cur_font);
	}
	if (_cur_shad) {
		shader_set(_cur_shad);
	}
	
	surface_free(_surf1);
	surface_free(_surf2);
	
	return _surf_spr;
}

///@func outline_draw_text(x, y, string, col, alpha, scale, ang, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_draw_text(_x, _y, _string, _strcol, _str_alpha, _scal, _ang, __OUTLINE_OPTIONAL_ARGS) {
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	var _str_w = string_width(_string);
	var _str_h = string_height(_string);
	var _xx = 0;
	var _yy = 0;
	
	switch (_halign) {
		case fa_center: {_xx = _str_w*0.5}	break;
		case fa_right:  {_xx = _str_w}		break;
	}
	switch (_valign) {
		case fa_middle: {_yy = _str_h*0.5}	break;
		case fa_bottom: {_yy = _str_h}		break;
	}
	
	var _gap = max(_thick, 0);	
	var _wid = _str_w+(2*_gap);
	var _hei = _str_h+(2*_gap);
	
	var _surf = surface_create(_wid, _hei);
	surface_set_target(_surf);
		draw_clear_alpha(0, 0);
		var _cur_shader = shader_current();
		shader_reset();
		draw_text_color(_xx+_gap, _yy+_gap, _string, _strcol, _strcol, _strcol, _strcol, _str_alpha);
		shader_set(_cur_shader);
	surface_reset_target();
	
	outline_draw_surface_ext(_surf, _x-(_gap+_xx)*_scal, _y-(_gap+_yy)*_scal, _scal, _scal, _ang, _strcol, _str_alpha, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	surface_free(_surf);
	outline_end();
}

///@func outline_draw_text_ext(x, y, string, sep, w, col, alpha, scale, ang, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_draw_text_ext(_x, _y, _string, _sep, _w, _strcol, _stralpha, _scal, _ang, __OUTLINE_OPTIONAL_ARGS) {
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	
	var _extra_lines = 4;
	var _gap = max(_thick, 0);
	var _str_w = string_width(_string);
	var _lines = floor(_str_w/_w);
	var _wid = (_str_w/_lines)+(2*_gap);
	var _hei = ((_lines+_extra_lines)*_sep)+(2*_gap);
	
	var _xx = 0;
	var _yy = 0;
	
	switch (_halign) {
		case fa_center: {_xx = (_str_w/_lines)*0.5}	break;
		case fa_right:  {_xx = (_str_w/_lines)}		break;
	}
	switch (_valign) {
		case fa_middle: {_yy = ((_lines+_extra_lines)*_sep)*0.5}	break;
		case fa_bottom: {_yy = ((_lines+_extra_lines)*_sep)	}		break;
	}
	
	var _surf = surface_create(_wid, _hei);
	surface_set_target(_surf);
		draw_clear_alpha(0, 0);
		var _cur_shader = shader_current();
		shader_reset();
		draw_text_ext(_xx+_gap, _yy+_gap, _string, _sep, _w);
		shader_set(_cur_shader);
	surface_reset_target();
	
	outline_draw_surface_ext(_surf, _x-(_gap+_xx)*_scal, _y-(_gap+_yy)*_scal, _scal, _scal, _ang, _strcol, _stralpha, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	surface_free(_surf);
}


//--------------------------------------------------------------//
//                           SPRITE                             //
//--------------------------------------------------------------//

///@func outline_set_sprite(sprite, subimg, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_set_sprite(_spr, _subimg, __OUTLINE_OPTIONAL_ARGS) {
	__internal_outline_init();
	__internal_outline_start();
	var _texture = sprite_get_texture(_spr, _subimg);
	var _uv = _uv_bnd ? sprite_get_uvs(_spr, _subimg) : [0.0, 0.0, 1.0, 1.0];
	__internal_outline_set_uniforms(_texture, _uv, _thick, _col, _alpha, _tol, _res, _round, _uv);
	return _spr;
}

///@func outline_create_sprite(sprite, col, alpha, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_create_sprite(_spr, _spr_col, _spr_alpha, __OUTLINE_OPTIONAL_ARGS) {
	
	var _cur_shad = shader_current();
	if (_cur_shad) {
		shader_reset();
	}
	
	var _gap = max(_thick, 0);
	var _wid = sprite_get_width(_spr)+_gap*2;
	var _hei = sprite_get_height(_spr)+_gap*2;
	var _x = sprite_get_xoffset(_spr);
	var _y = sprite_get_yoffset(_spr);
	
	var _surf1 = surface_create(_wid, _hei);
	var _surf2 = surface_create(_wid, _hei);
	var _surf_spr = -1;
	
	for (var i = 0, n = sprite_get_number(_spr); i < n; i++) {
		surface_set_target(_surf1);
			draw_clear_alpha(0, 0);
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
			draw_sprite(_spr, i, _x+_gap, _y+_gap);
			gpu_set_blendmode(bm_normal)
		surface_reset_target();
		
		outline_set_surface(_surf2, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
		surface_set_target(_surf2);
			draw_clear_alpha(0, 0);
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
			draw_surface_ext(_surf1, 0, 0, 1, 1, 0, _spr_col, _spr_alpha);
			gpu_set_blendmode(bm_normal)
		surface_reset_target();
		outline_end();
		
		if !(sprite_exists(_surf_spr)) {
			_surf_spr = sprite_create_from_surface(_surf2, 0, 0, _wid, _hei, false, false, _gap, _gap);
		} else {
			sprite_add_from_surface(_surf_spr, _surf2, 0, 0, _wid, _hei, false, false);
		}
	}
	sprite_set_offset(_surf_spr, _x+_gap, _y+_gap);
	
	if (_cur_shad) {
		shader_set(_cur_shad);
	}
	
	surface_free(_surf1);
	surface_free(_surf2);
	
	return _surf_spr;
}

///@func outline_draw_sprite(sprite, subimg, x, y, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_draw_sprite(_spr, _subimg, _x, _y, __OUTLINE_OPTIONAL_ARGS) {
	outline_set_sprite(_spr, _subimg, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	draw_sprite(_spr, _subimg, _x, _y);
	outline_end();
}

///@func outline_draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, col, alpha, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_draw_sprite_ext(_spr, _subimg, _x, _y, _xscal, _yscal, _rot, _spr_col, _spr_alpha, __OUTLINE_OPTIONAL_ARGS) {
	outline_set_sprite(_spr, _subimg, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	draw_sprite_ext(_spr, _subimg, _x, _y, _xscal, _yscal, _rot, _spr_col, _spr_alpha);
	outline_end();
}


//--------------------------------------------------------------//
//                           SURFACE                            //
//--------------------------------------------------------------//

///@func outline_set_surface(surface, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_set_surface(_surf, __OUTLINE_OPTIONAL_ARGS) {	
	__internal_outline_init();
	__internal_outline_start();
	var _texture = surface_get_texture(_surf);
	var _uv = _uv_bnd ? texture_get_uvs(_texture) : [0.0, 0.0, 1.0, 1.0];
	__internal_outline_set_uniforms(_texture, _uv, _thick, _col, _alpha, _tol, _res, _round, _uv);
	return _surf;
}

///@func outline_draw_surface(surface, x, y, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_draw_surface(_surf, _x, _y, __OUTLINE_OPTIONAL_ARGS) {	
	outline_set_surface(_surf, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	draw_surface(_surf, _x, _y);
	outline_end();
}

///@func outline_draw_surface_ext(surface, x, y, xscale, yscale, rot, col, alpha, [line_width], [line_col], [line_alpha], [tolerance], [resolution], [roundness], [uv_bound])
function outline_draw_surface_ext(_surf, _x, _y, _xscal, _yscal, _rot, _surf_col, _surf_alpha, __OUTLINE_OPTIONAL_ARGS) {	
	outline_set_surface(_surf, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd);
	draw_surface_ext(_surf, _x, _y, _xscal, _yscal, _rot, _surf_col, _surf_alpha);
	outline_end();
}