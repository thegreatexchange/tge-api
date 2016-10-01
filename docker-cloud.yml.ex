lb:
  image: dockercloud/haproxy
  links:
    - web
  ports:
    - 3000:80
  roles:
    - global

web:
  image: thegreatexchange/tge-api
  command: bundle exec rails s -b 0.0.0.0
  expose:
    - 3000
  volumes:
    - .:/myapp
  links:
    - db
    - redis
  environment:
    - RAILS_ENV=production
    - RAILS_MAX_THREADS=5
    # - RDS_DB_NAME
    # - RDS_USERNAME
    # - RDS_PASSWORD
    # - RDS_HOSTNAME
    # - RDS_PORT
  target_num_containers: 2

  db:
    image: postgres:9.4.1
    ports:
      - 5432:5432

  redis:
    image: redis:2.8
    ports:
      - 6379:6379
