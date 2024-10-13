#!/system/bin/sh
if command -v resetprop > /dev/null 2>&1; then
    resetprop="resetprop"
elif [ -f /data/adb/ksu/bin/resetprop ]; then
    resetprop="/data/adb/ksu/bin/resetprop"
elif [ -f /data/adb/ap/bin/resetprop ]; then
    resetprop="/data/adb/ap/bin/resetprop"
else
    echo "错误：未找到resetprop命令"
    exit 1
fi
echo ""
echo "请选择渲染设置:"
echo "[1] 100% GPU/0% CPU渲染"
echo "[2] 75% GPU/25% CPU渲染"
echo "[3] 50% GPU/50% CPU渲染"
echo "[4] 25% GPU/75% CPU渲染"
echo "[5] 0% GPU/100% CPU渲染"
echo "[6] 主动高级渲染"
echo ""
echo "如果你的GPU性能很强，那么选择更高的GPU渲染比例（如100% GPU/0% CPU）可能会带来更好的渲染性能.相反，如果你的CPU性能更强，或者你希望减少GPU的功耗和热量，那么选择一个更高的CPU渲染比例可能更合适"
echo ""

echo "请输入选项（1-6） : "; read -r agpu_option

case "$agpu_option" in
    1)
        echo "设置为100% GPU/0% CPU渲染..."
		resetprop -n persist.sys.perf.topAppRenderThreadBoost.enable true
		resetprop -n debug.hwui.render_thread true
		resetprop -n debug.skia.threaded_mode true
		resetprop -n debug.hwui.render_thread_count 1
		resetprop -n debug.skia.num_render_threads 1
		resetprop -n debug.skia.render_thread_priority 1
		resetprop -n persist.sys.gpu.working_thread_priority 1
		resetprop -n debug.hwui.profile true
		resetprop -n debug.hwui.show_dirty_regions false
		resetprop -n debug.hwui.fps_divisor 1
		resetprop -n debug.hwui.show_non_rect_clip false
		resetprop -n debug.hwui.webview_overlays_enabled true
		resetprop -n renderthread.skia.reduceopstasksplitting true
		resetprop -n debug.hwui.use_hint_manager false
		resetprop -n debug.hwui.target_cpu_time_percent 0
		resetprop -n debug.hwui.skia_tracing_enabled false
		resetprop -n debug.hwui.capture_skp_enabled false
		resetprop -n debug.hwui.skia_use_perfetto_track_events false
		resetprop -n debug.hwui.trace_gpu_resources true
		resetprop -n debug.hwui.show_layers_updates false
		resetprop -n debug.hwui.skip_empty_damage true
		resetprop -n debug.hwui.use_buffer_age false
		resetprop -n debug.hwui.use_partial_updates false
		resetprop -n debug.hwui.use_gpu_pixel_buffers false
		resetprop -n debug.hwui.filter_test_overhead false
		resetprop -n debug.hwui.overdraw false
        ;;
    2)
        echo "设置为75% GPU/25% CPU渲染..."
		resetprop -n persist.sys.perf.topAppRenderThreadBoost.enable true
		resetprop -n debug.sf.hw 1
		resetprop -n debug.hwui.render_thread true
		resetprop -n debug.skia.threaded_mode true
		resetprop -n debug.hwui.render_thread_count 1
		resetprop -n debug.skia.num_render_threads 1
		resetprop -n debug.skia.render_thread_priority 1
		resetprop -n persist.sys.gpu.working_thread_priority 1
		resetprop -n debug.hwui.profile true
		resetprop -n debug.hwui.show_dirty_regions false
		resetprop -n debug.hwui.fps_divisor 1
		resetprop -n debug.hwui.show_non_rect_clip false
		resetprop -n debug.hwui.webview_overlays_enabled true
		resetprop -n renderthread.skia.reduceopstasksplitting true
		resetprop -n debug.hwui.use_hint_manager true
		resetprop -n debug.hwui.target_cpu_time_percent 25
		resetprop -n debug.hwui.skia_tracing_enabled false
		resetprop -n debug.hwui.capture_skp_enabled false
		resetprop -n debug.hwui.skia_use_perfetto_track_events false
		resetprop -n debug.hwui.trace_gpu_resources true
		resetprop -n debug.hwui.show_layers_updates false
		resetprop -n debug.hwui.skip_empty_damage true
		resetprop -n debug.hwui.use_buffer_age false
		resetprop -n debug.hwui.use_partial_updates false
		resetprop -n debug.hwui.use_gpu_pixel_buffers false
		resetprop -n debug.hwui.filter_test_overhead false
		resetprop -n debug.hwui.overdraw false
        ;;
    3)
        echo "设置为50% GPU/50% CPU渲染..."
		resetprop -n persist.sys.perf.topAppRenderThreadBoost.enable true
		resetprop -n debug.sf.hw 1
		resetprop -n debug.hwui.render_thread true
		resetprop -n debug.skia.threaded_mode true
		resetprop -n debug.hwui.render_thread_count 1
		resetprop -n debug.skia.num_render_threads 1
		resetprop -n debug.skia.render_thread_priority 1
		resetprop -n persist.sys.gpu.working_thread_priority 1
		resetprop -n debug.hwui.profile true
		resetprop -n debug.hwui.show_dirty_regions false
		resetprop -n debug.hwui.fps_divisor 1
		resetprop -n debug.hwui.show_non_rect_clip false
		resetprop -n debug.hwui.webview_overlays_enabled true
		resetprop -n renderthread.skia.reduceopstasksplitting true
		resetprop -n debug.hwui.use_hint_manager true
		resetprop -n debug.hwui.target_cpu_time_percent 50
		resetprop -n debug.hwui.skia_tracing_enabled false
		resetprop -n debug.hwui.capture_skp_enabled false
		resetprop -n debug.hwui.skia_use_perfetto_track_events false
		resetprop -n debug.hwui.trace_gpu_resources true
		resetprop -n debug.hwui.show_layers_updates false
		resetprop -n debug.hwui.skip_empty_damage true
		resetprop -n debug.hwui.use_buffer_age false
		resetprop -n debug.hwui.use_partial_updates false
		resetprop -n debug.hwui.use_gpu_pixel_buffers false
		resetprop -n debug.hwui.filter_test_overhead false
		resetprop -n debug.hwui.overdraw false
        ;;
    4)
        echo "设置为25% GPU/75% CPU渲染..."
		resetprop -n persist.sys.perf.topAppRenderThreadBoost.enable true
		resetprop -n debug.sf.hw 1
		resetprop -n debug.hwui.render_thread true
		resetprop -n debug.skia.threaded_mode true
		resetprop -n debug.hwui.render_thread_count 1
		resetprop -n debug.skia.num_render_threads 1
		resetprop -n debug.skia.render_thread_priority 1
		resetprop -n persist.sys.gpu.working_thread_priority 1
		resetprop -n debug.hwui.profile true
		resetprop -n debug.hwui.show_dirty_regions false
		resetprop -n debug.hwui.fps_divisor 1
		resetprop -n debug.hwui.show_non_rect_clip false
		resetprop -n debug.hwui.webview_overlays_enabled true
		resetprop -n renderthread.skia.reduceopstasksplitting true
		resetprop -n debug.hwui.use_hint_manager true
		resetprop -n debug.hwui.target_cpu_time_percent 75
		resetprop -n debug.hwui.skia_tracing_enabled false
		resetprop -n debug.hwui.capture_skp_enabled false
		resetprop -n debug.hwui.skia_use_perfetto_track_events false
		resetprop -n debug.hwui.trace_gpu_resources true
		resetprop -n debug.hwui.show_layers_updates false
		resetprop -n debug.hwui.skip_empty_damage true
		resetprop -n debug.hwui.use_buffer_age false
		resetprop -n debug.hwui.use_partial_updates false
		resetprop -n debug.hwui.use_gpu_pixel_buffers false
		resetprop -n debug.hwui.filter_test_overhead false
		resetprop -n debug.hwui.overdraw false
        ;;
    5)
        echo "设置为0% GPU/100% CPU渲染..."	
		resetprop -n persist.sys.perf.topAppRenderThreadBoost.enable true
		resetprop -n debug.sf.hw 1
		resetprop -n debug.hwui.render_thread true
		resetprop -n debug.skia.threaded_mode true
		resetprop -n debug.hwui.render_thread_count 1
		resetprop -n debug.skia.num_render_threads 1
		resetprop -n debug.skia.render_thread_priority 1
		resetprop -n persist.sys.gpu.working_thread_priority 1
		resetprop -n debug.hwui.profile true
		resetprop -n debug.hwui.show_dirty_regions false
		resetprop -n debug.hwui.fps_divisor 1
		resetprop -n debug.hwui.show_non_rect_clip false
		resetprop -n debug.hwui.webview_overlays_enabled true
		resetprop -n renderthread.skia.reduceopstasksplitting true
		resetprop -n debug.hwui.use_hint_manager true
		resetprop -n debug.hwui.target_cpu_time_percent 100
		resetprop -n debug.hwui.skia_tracing_enabled false
		resetprop -n debug.hwui.capture_skp_enabled false
		resetprop -n debug.hwui.skia_use_perfetto_track_events false
		resetprop -n debug.hwui.trace_gpu_resources false
		resetprop -n debug.hwui.show_layers_updates false
		resetprop -n debug.hwui.skip_empty_damage true
		resetprop -n debug.hwui.use_buffer_age false
		resetprop -n debug.hwui.use_partial_updates false
		resetprop -n debug.hwui.use_gpu_pixel_buffers false
		resetprop -n debug.hwui.filter_test_overhead false
		resetprop -n debug.hwui.overdraw false
        ;;
	6)
        echo "设置主动高级渲染..."
        resetprop -n debug.enabletr false
		resetprop -n debug.performance.tuning 1
		resetprop -n hwui.render_dirty_regions true
		resetprop -n vendor.gralloc.disable_ubwc 0
		resetprop -n debug.sf.hw 1
		resetprop -n debug.egl.hw 1
		resetprop -n debug.egl.profiler 1
		resetprop -n debug.overlayui.enable 1
		resetprop -n persist.sys.ui.hw 1
		resetprop -n persist.sys.ui.rendering 1
		resetprop -n debug.gralloc.gfx_ubwc_disable 0
		resetprop -n persist.sys.gpu.rendering 1
		resetprop -n video.accelerate.hw 1
		resetprop -n debug.hwui.use_buffer_age false
		resetprop -n ro.config.enable.hw_accel true
		resetprop -n ro.vendor.gpu.optimize.level 3
		resetprop -n ro.vendor.gpu.optimize.preload 1
		resetprop -n ro.vendor.gpu.optimize.texture_control true
		resetprop -n ro.vendor.gpu.optimize.memory_compaction true
		resetprop -n ro.vendor.gpu.optimize.fork_detector true
        ;;	
    *)
    echo "无效选项，请重新运行脚本并选择1-6之间的数字"
    exit 1
    ;;
esac
sleep 2

