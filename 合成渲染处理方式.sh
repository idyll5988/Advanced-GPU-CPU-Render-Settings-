#!/system/bin/sh
if command -v resetprop > /dev/null 2>&1; then
    resetprop=$(command -v resetprop)
else
    if [ -f /data/adb/ksu/bin/resetprop ]; then
        resetprop="/data/adb/ksu/bin/resetprop"
    elif [ -f /data/adb/ap/bin/resetprop ]; then
        resetprop="/data/adb/ap/bin/resetprop"
    else
        resetprop="setprop"
    fi
fi
DEFAULT_OPTION="5"
if [ -z "$1" ]; then
    echo "特定于某些硬件平台（如某些 Qualcomm 设备）的合成方式"
    agpu_option=$DEFAULT_OPTION
else
    agpu_option=$1
fi
echo ""
echo "请选择渲染设置:"
echo "[1] GPU 加速合成处理"
echo "[2] CPU 使用CPU进行合成处理"
echo "[3] C2D 直接在CPU上进行合成处理"
echo "[4] DYN 动态选择合成处理方式"
echo "[5] MDP 特定于某些硬件平台（如某些 Qualcomm 设备）的合成方式"
echo ""
echo ""

echo "用于控制 Android 设备上的合成（composition）处理方式。合成处理是指操作系统如何将不同的图形元素（如应用窗口、状态栏、壁纸等）组合在一起，以生成最终显示在屏幕上的图像。这个属性通常用于调试和性能分析，以及在开发或优化图形密集型应用时调整系统的行为"

echo "请输入选项（1-5） : "; read -r agpu_option

case "$agpu_option" in
    1)
        echo "使用 GPU 加速的合成处理。这种方式通常能提供较好的性能，因为它利用了 GPU 的并行处理能力来加速图形渲染。适用于对图形性能要求较高的场景..."
		resetprop -n debug.composition.type gpu
        ;;
    2)
        echo "使用CPU进行合成处理。这种方式不依赖于 GPU，因此在没有 GPU 或 GPU 性能较低的设备上可能更有用。然而，与 GPU 相比，CPU 处理图形的速度通常较慢，可能会导致性能下降..."
		resetprop -n debug.composition.type cpu
        ;;
    3)
        echo "即直接在 CPU 上进行合成处理，然后传输到显示设备。这种方式避免了 GPU 的使用，但可能在处理复杂图形时效率较低..."
		resetprop -n debug.composition.type c2d
        ;;
    4)
        echo "动态选择合成处理方式。系统会根据当前的负载和性能需求自动选择最合适的合成方式。这种方式旨在平衡性能和资源使用，但在某些情况下可能不如固定使用 GPU 或 CPU 稳定..."
		resetprop -n debug.composition.type dyn
        ;;
    5)
        echo "特定于某些硬件平台（如某些 Qualcomm 设备）的合成方式。这种方式可能针对特定硬件进行了优化，以提供最佳性能..."	
		resetprop -n debug.composition.type mdp
        ;;
    *)
    echo "无效选项，请重新选择1-5之间的数字"
    exit 1
    ;;
esac


