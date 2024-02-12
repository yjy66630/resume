My Resume and LaTeX Template
============================

![image](https://github.com/yjy66630/resume/assets/62711034/d270e4cb-a751-4cad-b683-b61e541b65bd)

resume.cls为内部格式设置

fontawesome.sty包含所有emoji字体

image/you.jpg为头像，注意命名和后缀名不能更改

fonts/fontawesome-webfont.ttf为字体文件

# TroubleShooting

报错：Font TU/NotoSerifCJKSC(0)/b/n/14.4="Noto Serif CJK SC/OT" at 14.4pt not loadable: Metric (TFM) file or installed font not found.

说明字体未安装，通常情况下需手动安装字体：可以尝试手动下载字体文件Noto Serif CJK SC，并将其放置在 LaTeX 可以找到的地方。通常，字体文件应该放在 TEXMF/fonts/truetype 或类似的目录下。然后运行 updmap 命令来更新字体映射。
