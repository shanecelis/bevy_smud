#define_import_path smud::bevy

#import smud

fn lissajous(p: vec2<f32>, amp: f32, freq: vec2<f32>, phase: vec2<f32>, n: u32) -> f32 {
    var t = 0.0;
    let dt = 0.2;
    var d = 1000000000.0;
    var a = amp * vec2<f32>(cos(freq.x * t + phase.x), sin(freq.y * t + phase.y));
    for (var i = 0; i < 300; i++) {
        t += dt;
        let b = amp * vec2<f32>(cos(freq.x * t + phase.x), sin(freq.y * t + phase.y));
        d = min(d, smud::sd_segment(p, a, b));
        a = b;
    }
    return d;
}

fn sdf(p: vec2<f32>) -> f32 {
    return lissajous(p, 70., vec2<f32>(1, 1.1), vec2<f32>(0.0, 0), 20u);
}
