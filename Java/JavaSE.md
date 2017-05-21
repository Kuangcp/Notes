# JavaSE 知识点梳理
## IO
- maven格式路径，会从resources下获取文件例如 /a.xml
- `InputStream is = this.getClass().getResourceAsStream(path);`
    - 读取properties文件 ：`new Properties().load(is);`
    - 按行读取文件 `BufferedReader bf = new BufferedReader(new InputStreamReader(is));`
## JDBC
- 基础的批量操作SQL ` pstmt.executeBatch(); //批量执行`

## Net
- 使用Linux编程开启web容器时`java.net.SocketException: 权限不够`
    - [参考博客](http://www.xuebuyuan.com/1432737.html)
    - 快速解决，不使用小于1024的端口即可
