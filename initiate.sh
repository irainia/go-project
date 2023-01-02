echo "=== INPUT PROJECT INFORMATION ==="
project_dir="$(cd .. && pwd)"
echo "Project Directory: ${project_dir}"

echo -n "Project Name: "
read project_name

echo -n "Module Path: "
read module_path
echo "Module path for this project: ${module_path}/${project_name}"

echo "Project Description: "
echo -n " "
read description


echo "=== INITIATING PROJECT ==="
echo "Creating project dir in ${project_dir}/${project_name}"
mkdir -p ${project_dir}/${project_name}

echo "Creating Makefile"
echo "coverage_file=coverage.html
binary_outdir=out
project_name=${project_name}
image_tag=latest

test:
	go test ./... --cover

coverage:
	go test -coverprofile \${coverage_file} ./... && go tool cover -html=\${coverage_file}

bin: test
	go build -o \${binary_outdir}/\${project_name} .

img:
	docker build -t \${project_name}:\${image_tag} .

up: img
	docker run \${project_name}:\${image_tag}" > "${project_dir}/${project_name}/Makefile"

echo "Creating Dockerfile"
echo "FROM golang:1.16-alpine as builder
COPY . /src
WORKDIR /src
RUN go build -o ./out/${project_name} .

FROM alpine:latest
RUN mkdir /app
COPY --from=builder /src/out/${project_name} /app
CMD /app/${project_name}" > "${project_dir}/${project_name}/Dockerfile"

echo "Creating README.md"
echo "# ${project_name}

## Description

${description}

## Dependency

### GO Language

The GO programming language version \``echo | go version | tr ' ' '\n' | grep go | grep -v '\bgo\b'`\` need to be installed
in the system. Go to [this link](https://golang.org/doc/install) and follow
the instruction to install. To check GO version on the environment, run the following command:

\`\`\`bash
go version
\`\`\`

example output:

\`\`\`bash
`echo | go version`
\`\`\`

### Docker

Docker engine version \``docker --version | tr ' ' '\n' | grep -E '[0-9.]+,$' | tr -d ','`\`
needs to be installed in the system. Go to [this link](https://docs.docker.com/engine/install)
and follow the instruction to install. To check the version, run the following command:

\`\`\`bash
docker version
\`\`\`

example output:

\`\`\`bash
`echo | docker version`
\`\`\`

## How to Test

In this project root directory, run the following command to test:

\`\`\`bash
make test
\`\`\`

To show a more complete coverage and uncovered lines:

\`\`\`bash
make coverage
\`\`\`

You can check into \`coverage.html\` file in root project directory.
This command also will open interactive coverage tool in your browser if you have one.

## How to Build

### Building Bin

To build the binary executable, in this project root directory, run the following command:

\`\`\`bash
make bin
\`\`\`

There will be a new directory named \`out\` with an executable file \`${project_name}\` as the result of the built project.

### Building Img

To build docker image, in this project root directory, run the following command:

\`\`\`bash
make img
\`\`\`

## How to Run

### Running Bin

In order to run this project, after building the binary executable, run
the following command in this project root directory:

\`\`\`bash
./out/${project_name}
\`\`\`

### Running Img

In order to run this project, after building the docker image, run the following command:

\`\`\`bash
make up
\`\`\`" > "${project_dir}/${project_name}/README.md"

echo "Creating .gitignore"
echo "coverage.html

out/
vendor/
" > "${project_dir}/${project_name}/.gitignore"

cd ${project_dir}/${project_name}
git init
go mod init ${module_path}/${project_name}

echo "Creating main.go"
echo "package main

import \"fmt\"

func main() {
	fmt.Println(\"Hello world!\")
}" > "${project_dir}/${project_name}/main.go"

echo "Project ${project_name} is initialized in: ${project_dir}"
