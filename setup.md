# Setting up Pollmaster

## Requirements

[Docker Engine: Community](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Installation in Docker

Make sure you have docker installed. Instructions on how to do so are beyond the scope of this document

Create a folder where your Docker files will be stored:
```
mkdir ~/pollmaster-docker
```

Change into the newly created folder:
```
cd pollmaster-docker
```

Download the Dockerfile and docker-compose.yml files and put them in the newly created folder:
```
wget https://github.com/bboryczko/pollmaster/raw/master/Dockerfile
wget https://github.com/bboryczko/pollmaster/raw/master/docker-compose.yml
```
Create a secrets.py in pollmaster-docker folder. You can use the following template:

```
python
class Secrets:
    def __init__(self):
        self.dbl_token = ''  # DBL token (only needed for public bot, not needed for self-hosted bot)
        self.mongo_db = 'mongodb://localhost:27017/pollmaster'
        self.bot_token = '' # official discord bot token
        self.mode = 'development' # or production

SECRETS = Secrets()
```

Create another folder, to store the database file:
```
mkdir db_data
```

Execute the following command to create the docker container:
```
docker-compose up -d
```

This will build the docker image, using the Dockerfile and the docker-compose.yml file. It will start the pollmaster container and a mondgodb container.
You can verify the containers are running by executing the following command:
```
docker ps
```

##  Setup app and bot in Discord 

- Setup an app and a bot using [Creating a Bot Account](https://discordpy.readthedocs.io/en/latest/discord.html#creating-a-bot-account)

##  Invite the bot in Discord 

- Generate url to invite the bot using [Inviting Your Bot](https://discordpy.readthedocs.io/en/latest/discord.html#inviting-your-bot)
- Specify permissions by using the following bit format of the bot permissions appended to the bot invitation url and paste the url in browser and follow the instructions as given in the above url 

> &permissions=1073867840

- Now you will see the bot in your Discord channel
- Try commands like pm!help and pm!new

## Log files

- You can view the log file pollmaster.log in the pollmaster directory, using docker command:
```
docker logs pollmaster
```

- You can see the following :
```
AsyncIOMotorDatabase(Database(MongoClient(host=['localhost:27017'], document_class=dict, tz_aware=False, connect=False, driver=DriverInfo(name='Motor', version='2.0.0', platform=None)), 'pollmaster'))
Servers verified. Bot running.
```
