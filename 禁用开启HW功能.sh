#!/system/bin/sh
DEFAULT_OPTION="2"
if [ -z "$1" ]; then
    echo "默认开启硬件功能"
    agpu_option=$DEFAULT_OPTION
else
    agpu_option=$1
fi
echo ""
echo "请选择渲染设置:"
echo "[1] 禁用硬件功能"
echo "[2] 开启硬件功能"
echo ""
echo ""

echo "注意 会耗尽您的电池，使用您的GPU"

echo "请输入选项（1-2） : "; read -r agpu_option

case "$agpu_option" in
    1)
        echo "禁用硬件功能..."
		service call SurfaceFlinger 1008 i32 1
        ;;
    2)
        echo "开启硬件功能..."
		service call SurfaceFlinger 1008 i32 0
        ;;
    *)
    echo "无效选项，请重新选择1-2之间的数字"
    exit 1
    ;;
esac


