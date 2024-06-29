FROM maven:3.8.1-jdk-11-openj9 AS builder

# Sao chép các tệp nguồn dự án vào vùng chứa
COPY . /usr/src/app
WORKDIR /usr/src/app

# Biên dịch dự án Maven
RUN mvn clean install package

# Sử dụng hình ảnh cơ sở hỗ trợ Java và Tomcat
FROM tomcat:9.0.74-jdk11

# Sao chép tệp WAR đã tạo vào thư mục triển khai Tomcat
COPY --from=builder /usr/src/app/target/ROOT.war /usr/local/tomcat/webapps/

# Hiển thị cổng Tomcat sẽ chạy trên đó
EXPOSE 8080

# Lệnh khởi động Tomcat
CMD ["catalina.sh", "run"]