Unitforum Mini Admin
===

## Introtuce

모바일에서 간단히 유닛별 포럼을 운영할 수 있는 관리툴

## Feature

- 포럼 추가/삭제
- 유닛 관리
- 게시물 관리
- 제재글 관리
- 다국어 지원

## Enviroment

- Language : Java 8 + Spring boot 1.4 + MyBatics 3.2
- DB : MySQL 5.7+
- Build tool : Gradle 2.9 + Gradle wrapper
- UI Library : jquery 2.1.4 + Bootstrap 3.3.5
- UI Theme : AdminLTE 2.3.0

## Quick Start

1. DB 및 Scheme 생성

```sh
mysql -u{mysql_id} -p -h {mysql_host} -P {mysql_port} < ./db/schema.sql
Enter password: {mysql_password}
```

2. config file(./config/application.yml) 내 DB 연결 정보 수정

```yml
datasource.unitforum.url: "jdbc:mysql://{mysql_host}:{mysql_port}/unitforumdb?autoReconnect=true&initialTimeout=3&maxReconnects=5&useUnicode=true&characterEncoding=utf8"
datasource.unitforum.username: {mysql_id}
datasource.unitforum.password: {mysql_password}
```

3. 프로젝트 빌드

```sh
sh gradlew clean build --refresh-dependencies
```

4. 서비스 실행

```sh
java -jar ./build/libs/unitforum_mini_admin.jar -Djava.security.egd=file:/dev/./urandom -Xms1000m -Xmx1000m -server
```

## Notice

- application.yml 파일에 tab을 사용하는 경우 오류 발생.
- 서비스 백그라운드 실행 

```sh
nohup java -jar ./build/libs/unitforum_mini_admin.jar -Djava.security.egd=file:/dev/./urandom -Xms1000m -Xmx1000m -server >/dev/null 2>&1 &
```

