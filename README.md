# Windows-Content-Pipeline-Setup
Pipeline setup for a animation studio 

Setup will assume that you have Maya 2015/2016/2017 installed and that tools will already live on a file server on premise and that Afanasy will be setup for using machines to pool resources to render. Link to set up of the server can be found here - http://cgru.sourceforge.net/afanasy/doc/

1. Open InstallDrives.cmd in notepad/text editor and change network drive mappings accordingly to how file servers are setup in environment.

2. Run installDrives.cmd and follow onscreen prompts, This will be for a username and password to the file servers.

3. Open installPipeline.cmd and change the network drive mappings to how files servers are setup in your environment, Also change the construct filepath to locations so they reflect internal setup.

4. Once installPipleline.cmd has run all dependences will have been setup and all packages and dependencies will have been installed.

5. Open installAfanasy.cmd and make changes to the construct filepath to reflect internal locations
