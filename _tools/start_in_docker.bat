docker rm -f lixiyu.github.io
rem 目前只有第四种方案可用，不知为何
rem docker run --rm -v d:/Code:/code -w /code/lixiyu.github.io --network host --name lixiyu.github.io xiyu_develop_environment:0.0.1 bash _tools/start_server.sh
rem docker run --rm -v d:/Code:/code -w /code/lixiyu.github.io --net host --name lixiyu.github.io xiyu_develop_environment:0.0.1 bash _tools/start_server.sh
rem docker run --rm -v d:/Code:/code -w /code/lixiyu.github.io --publish-all --name lixiyu.github.io xiyu_develop_environment:0.0.1 bash _tools/start_server.sh
docker run --rm -v d:/Code:/code -w /code/lixiyu.github.io -p 4000:4000 --name lixiyu.github.io xiyu_develop_environment:0.0.1 bash _tools/start_server.sh
