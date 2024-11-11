# docker compose

## Описание сервисов
1. Postresql и PgAdmin к ней в качестве клиента
2. Minio и init контейнер для инициализации бакета
3. Приложение из ЛР 1

## Ответы на вопросы
1. Можно ли ограничивать ресурсы (например, память или CPU) для сервисов в docker-compose.yml? Если нет, то почему,
если да, то как?

[Документация docker compose](https://docs.docker.com/reference/compose-file/deploy/#resources) говорит, что ограничивать ресуры можно. Для этого у каждого сервиса в разделе **services** необходимо прописать структуру ключей:
```yaml
deploy:
  resources:
    limits:
      cpus: 1
      memory: 50M
      ...
```
Блок **limits** как раз отвечает за ограничение ресурсов, накладываемое на контейнер.

2. Как можно запустить только определенный сервис из docker-compose.yml, не запуская остальные?

```shell
docker compose up service-name
```

Так можно запустить сколько угодно сервисов из docker-compose.yml, разделяя их пробелом

```shell
docker compose up db app minio -d
```
