/*
PDF 高亮颜色修改助手
Version: v1.0
Author: KONGSN

使用Autohotkey模拟手动修改颜色操作，缩短高亮颜色修改时间。
Adobe 中文版测试通过。

使用说明：
0. 只能作用于已经高亮的部分（可以使用“键盘或鼠标右键+h”快速标记高亮）。
1. 需要保持“属性栏”为打开状态（快捷键 Ctrl+e）。
2. 使用Ctrl+1~5，修改颜色（红>绿>蓝>紫>黄）。
3. 颜色选择，部分参考Civati的使用手册。
4. 程序的DPI缩放可能会影响使用。

致谢：
原版本作者jtanx，
https://gist.github.com/jtanx/09c8f0e6f31ecb61c3d5d3faddbaf559
用于Acrobat DC
*/


msgbox, PDF高亮颜色修改助手（适用于Adobe中文版）：`r`n    1. 只能作用于已经高亮的部分；`r`n    2. 需要保持“属性栏”为打开状态（快捷键 Ctrl+e）；`r`n    3. Ctrl+1~5修改颜色。`r`n        3.1 Ctrl+1: 红色；`r`n        3.2 Ctrl+1: 绿色；`r`n        3.3 Ctrl+1: 蓝色；`r`n        3.4 Ctrl+1: 紫色；`r`n        3.5 Ctrl+1: 黄色；


SetColour(x, y)
{
    If WinExist("属性 ahk_class AVL_AVFloating") or WinExist("高亮属性 ahk_class AVL_AVFloating")
    {
        WinActivate
        WinWaitActive
        if !ErrorLevel
        {
            CoordMode, Mouse, Screen
            MouseGetPos, oldX, oldY
            CoordMode, Mouse, Relative
            
            MouseClick, Left, 30, 30   ; Activate the palette
            MouseClick, Left, x, y     ; Select the colour.
            
            CoordMode, Mouse, Screen
            MouseMove, oldX, oldY
            CoordMode, Mouse, Relative
        }
    }
}


; AHK: ^ is Ctrl, ! is Alt, + is shift


; 重要内容：红色
; Ctrl+1  
^1::
SetColour(20, 100) 
return

; 结果、结论、总结：绿色
; Ctrl+2
^2::
SetColour(75, 135)
return

; 研究方法、数据来源：蓝色
; Ctrl+3
^3::
SetColour(110, 115)
return

; 分析、评论：紫色
; Ctrl+4
^4::
SetColour(20, 115)
return

; 普通默认黄色
; Ctrl+5
^5::
SetColour(55, 120)
return
