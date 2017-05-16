# Postgresql

## 概述
- 严格SQL标准
## 安装
### Postgresql 的安装（Docker方式）

`Dockerfile`
```
    FROM ubuntu:16.04
    RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

    RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
    RUN apt-get update && apt-get -y -q install python-software-properties software-properties-common \
        && apt-get -y -q install postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4

    USER postgres
    RUN /etc/init.d/postgresql start \
        && psql --command "CREATE USER pger WITH SUPERUSER PASSWORD 'pger';" \
        && createdb -O pger pgerdb

    USER root
    RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf
    RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

    EXPOSE 5432

    RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql
    VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

    USER postgres
    CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]

```

- 构建容器 `docker build --rm=true -t mypostgresql:9.4 .`
- 运行容器 `docker run --name mypostgre -i -t -p 5432:5432 mypostgresql:9.4`
- 安装客户端 `sudo apt-get install postgresql-client`
- 使用客户端连接`psql -h localhost -p 5432 -U pger -W pgerdb`
- 连接后 输入`\l` 列出数据库即可查看连接成功与否

#### 解释Dockerfile文件



## Postgresql终端命令行使用
`用熟悉的MySQL命令来解释`
- `\l` show databases
- `\c dbname` 切换数据库
- `\dt` show tables
- `\d tablename` desc tablename
- `\di` 查看索引
- `\copyright` 显示版权信息
- `\encoding` 显示编码信息
- `\h` SQL命令语法上的说明，用*显示全部命令 
- `\prompt [文本]名称` 提示用户设定内部变数
- `\password [username]` 改密码
- `\q` exit
- 可以使用pg_dump和pg_dumpall来完成。比如备份sales数据库： 
    - pg_dump drupal>/opt/Postgresql/backup/1.bak 
-  



