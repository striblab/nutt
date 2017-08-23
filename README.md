# Nutt

[Nutt](https://github.com/striblab/nutt.git) is a set of notes and scripts for the news worker server that handles regular and one-off tasks.

## About the server

The server is currently the `Ubuntu 16 LTS` version.  See the `initialize.sh` script for what is installed and possibly as a way of rebuilding.

Files related to projects and processes should be stored in `/nutt`.

## Configuration

Add any configuration, such as `export VAR=1` to a `~/.nutt` file.  For convenience, make sure this is in your `.profile` file:

```bash
if [ -f "$HOME/.nutt" ]; then
  . "$HOME/.nutt"
fi
```

## Projects

Install projects in your `/nutt/projects` folder.  For instance:

```
cd ~/projects && git clone https://github.com/striblab/your-project.git
```

## Cron tasks

Make sure this project is in projects.

```
*/10 * * * * /nutt/projects/nutt/cronwrap "Title for task" "task-id" "cd /nutt/projects/project && ./command -to=run"
```

To integrate cron tasks with [Datadog](https://www.datadoghq.com/), there is a `dogwrap` command that is available through the [datadog Python library](https://github.com/DataDog/datadogpy).

The `cronwrap` command will look for `dogwrap` and the `DATADOG_KEY` environment variable, and if it is not there, then it will just the command and log to the relevant `/nutt/logs`.

## Logs

Logs should be stored in `/nutt/logs`.

*TODO: Look at [logrotate](http://manpages.ubuntu.com/manpages/xenial/man8/logrotate.8.html).*
