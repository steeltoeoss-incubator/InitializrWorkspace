  # Steeltoe Initializr Workspace is no longer actively maintained by VMware, Inc.


  ## Setup

  ```
  $ git clone https://github.com/steeltoeoss-incubator/InitializrWorkspace
  $ cd InitializrWorkspace
  $ ./initialize.ps1
  ```

  ### Advanced: use SSH to clone repositories

  By default HTTPS is used to clone repositories.
  To use SSH, pass the `-ssh` switch.

## Usage

```
$ docker compose up
```

### Using InitialzrWeb

Go to http://localhost:8080/

### Using InitializrApi

```
$ http http://localhost:1920/api/project
```

### Using NetCoreToolService

```
$ http http://localhost:1922/api/new/steeltoe-webapi
```
