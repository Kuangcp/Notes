


## IO
- maven格式路径，会从resources下获取文件例如 /a.xml
- `InputStream is = this.getClass().getResourceAsStream(path);`
    - 读取properties文件 ：`new Properties().load(is);`
    - 按行读取文件 `BufferedReader bf = new BufferedReader(new InputStreamReader(is));`

