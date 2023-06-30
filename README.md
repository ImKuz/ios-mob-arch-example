# iOS architecture example

iOS multimodule architecture example using Tuist and Sourcery. 

## TODO: 
- [ ] Add normal description
- [ ] Add some placeholder code for applicaiton

## Structure

/CLI - Command line interface that works from any directory and simplifies project scripts execution

/Sources - Sources of the app

/Sources/Tuist - Project description and templates

## Building the project

1) Install dependencies:
   
- tuist: `curl -Ls https://install.tuist.io | bash`
- sourcery: `brew install sourcery`
  
2) Install project command line utility called `arcli`

- From root of project execute

`cd ./CLI && make`

3) Generate the project

`arcli generate -f`

## HowTo

#### Edit tuist projects

From Sources/ dir execute `tuist edit` 

#### Add new module 

`arcli add module --name Foo` 

See `arcli add --help` for more info
