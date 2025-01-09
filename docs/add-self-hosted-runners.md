# Adding self-hosted runner to a repository

## Add a self-hosted runner to the project

### Download and configure actions runner to your machine

Step 1 - On GitHub, navigate to the main page of the repository

Step 2 - Click **Settings**

Step 3 - In the left pane, click **Actions**, then click **Runners**

Step 4 - Click **New self-hosted runner**

Step 5 - Select the operating system image and architecture of your self-hosted runner machine

Step 6 - Once you've selected, GitHub will generate instructions to help to download, and configure the runner app

Step 7 - Execute download instructions on the runner machine

Step 8 - Execute configure instructions on the runner machine

### Configure runner app to run as a service

If you have run the runner with `./run.sh`, then cancel it.

Change directory to actions runner binary (by default, it's `actions-runner`, if you are different, then act accordingly)

```bash
cd actions-runner/
```

Setup the runner service

```bash
sudo ./svc.sh install
```

Start the runner service

```bash
sudo ./svc.sh start
```

### Checking if runner is configured properly

To check if the runner is configured properly, run `sudo ./svc.sh status`

```bash
sudo ./svc.sh status
```
Output should include `√ Connected to GitHub`

```bash
# an excerpt of Output
             ├─639 ./externals/node20/bin/node ./bin/RunnerService.js
             └─694 /home/vagrant/actions-runner/bin/Runner.Listener run --startuptype service

Jan 07 10:36:45 ubuntu-jammy systemd[1]: Started GitHub Actions Runner (hybytes-spe-test-jan25.spe-test-jan25-ubuntu).
Jan 07 10:36:45 ubuntu-jammy runsvc.sh[610]: .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games…snap/bin
Jan 07 10:36:46 ubuntu-jammy runsvc.sh[639]: Starting Runner listener with startup type: service
Jan 07 10:36:46 ubuntu-jammy runsvc.sh[639]: Started listener process, pid: 694
Jan 07 10:36:46 ubuntu-jammy runsvc.sh[639]: Started running service
Jan 07 10:36:50 ubuntu-jammy runsvc.sh[639]: √ Connected to GitHub
Jan 07 10:36:52 ubuntu-jammy runsvc.sh[639]: Current runner version: '2.321.0'
Jan 07 10:36:52 ubuntu-jammy runsvc.sh[639]: 2025-01-07 10:36:52Z: Listening for Jobs
Hint: Some lines were ellipsized, use -l to show in full.
```

## Additional resources
For more information, consult the document [Adding a self-hosted runner to a repository](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-a-repository)
