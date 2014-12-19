# encoding: utf-8
# To run use: https://github.com/fxn/tkn

center <<-EOS
  Jorge Dias

  #{b "Faster containers development using fig"}
EOS

section "About me" do
  block <<-EOS
    I was born in Venezuela

    Devops @ Xing / Development & Testing infrastructure

    Github @diasjorge / Twitter @dias_jorge
  EOS
end

section "Fig introduction" do
  block <<-EOS
    Fast, isolated development environments using Docker
  EOS

  code <<-EOS, :sh
    FROM python:2.7
    ADD . /code
    WORKDIR /code
    RUN pip install -r requirements.txt
  EOS

  code <<-EOS, :yaml
    web:
      build: .
      command: python app.py
      ports:
       - "5000:5000"
      volumes:
       - .:/code
      links:
       - redis
    redis:
      image: redis
  EOS

  code <<-EOS, :sh
    fig up
  EOS

  code <<-EOS, :sh
    Pulling image redis...
    Building web...
    Starting figtest_redis_1...
    Starting figtest_web_1...
    redis_1 | [8] 02 Jan 18:43:35.576 # Server started, Redis version 2.8.3
    web_1   |  * Running on http://0.0.0.0:5000/
  EOS
end

section "Scaling fig" do
  center "The problem"

  block <<-EOS
    Developing containers requires many commands

    Stop the container -> Build again -> Restart the containers
  EOS

  block <<-EOS
    Stopping & Starting many containers all the time is very time consuming
  EOS

  block <<-EOS
    Manual and error prone process
  EOS

  block <<-EOS
    I don't like that
  EOS
end

section "The solution" do
  center <<-EOS
    guard-fig

    https://github.com/diasjorge/guard-fig
  EOS

  block <<-EOS
    Small focused tool that helps you develop docker containers faster using fig
  EOS

  block <<-EOS
    Detects changes to your project
  EOS

  block <<-EOS
    Stops and builds only the container that has changed
  EOS

  block <<-EOS
    Restarts linked containers
  EOS

  block <<-EOS
    Recreates only the minimum images needed
  EOS
end

section "Demo Time" do
end

section "That's all, thanks!" do
end
