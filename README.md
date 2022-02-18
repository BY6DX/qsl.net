# qsl.net/by6dx

本仓库托管了 <https://www.qsl.net/by6dx/> 站点的的源文件。网站使用 Jekyll 框架，模板修改自 [mzlogin/mzlogin.github.io](https://github.com/mzlogin/mzlogin.github.io)。

使用指南请参考源模板指南：<https://mazhuang.org/2020/05/03/blog-template-qna/>

**注意**：由于子目录部署的适配需要，在文章中链接到资源时需要添加 `{{ site.baseurl }}` 路径前缀。现已开发插件，在链接（`[name](/path/to/file)`）中若路径为 `/` 开头（即从项目根目录起始的绝对路径），会自动补全相对路径，无需再手动添加。但若在文件中插入 html 代码，仍需自行处理路径问题。如需在特定页面停用插件，请在页面开头加入 `auto-relative: false`。
