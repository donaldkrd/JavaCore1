FROM bellsoft/liberica-openjdk-alpine:11.0.10 as BuildProject
WORKDIR /app
COPY ./java ./src
RUN mkdir ./out
RUN javac -sourcepath ./src -d out ./src/ru/geekbrains/sample/Main.java

FROM scratch as OutputFiles
COPY --from=BuildProject /app/out /bin