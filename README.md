Rails Job Hub

To run simply clone the project
git clone git@github.com:ekr990011/railsjobhub.git

Then to setup the docker/docker-compose:
docker-compose build

Afterwards to start
docker-compose up

Make sure to on a separate terminal
docker-compose run web rake db:create
docker-compose run web rake db:migrate


If you are on linux make sure all of your files are set to the user in your project.
Here is a command you can run to make your whole project directory be owned by
the user:

sudo chown -R $USER:$USER .

The docker container runs as root so any files created by it will also be owned by root so you may need to use that command again upon certain changes.

The error will usually looks something like this:
IOError: Can not access file in context:
