function bootstrap {
    docker stop $(docker ps -aq)
    rm ./collabfield/tmp/pids/server.pid
    docker-compose build
    docker-compose run web bundle
    #docker-compose run frontend yarn
    #docker-compose run backend ruby bin/rails db:create
    #docker-compose run backend ruby bin/rails db:migrate
    #docker-compose run backend ruby bin/rails db:migrate:status
    docker-compose up -d
    docker ps
}

function build {
    rm ./collabfield/tmp/pids/server.pid
    docker-compose build
}

function build-start {
    rm ./collabfield/tmp/pids/server.pid
    docker-compose up --build
}

function start {
    rm ./collabfield/tmp/pids/server.pid
    docker-compose up -d
    docker ps
}

function stop {
    docker stop $(docker ps -aq)
}

function down {
    docker-compose down
}

function restart {
    docker stop $(docker ps -aq)
    rm ./collabfield/tmp/pids/server.pid
    #docker-compose run frontend ng build
    docker-compose up -d
    docker ps
}

function nuke-containers {
    docker stop $(docker ps -aq)
    rm ./collabfield/tmp/pids/server.pid
    docker rm $(docker ps -aq)
}

function bundle {
    docker-compose run web bundle
}

function db-create {
    docker-compose run web rails db:create
}

function db-migrate {
    docker-compose run web rails db:migrate
}

function db-status {
    docker-compose run web rails db:migrate:status
}

function db-rollback {
    docker-compose run web rails db:rollback
}

function db-seed {
    docker-compose run web rails db:seed
}

function console {
    docker-compose run web rails console
}

function rails-routes {
    docker-compose run web rails routes
}