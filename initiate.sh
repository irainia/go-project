echo "=== INPUT PROJECT INFORMATION ==="
echo -n "Repository Location: "
read location

echo -n "Project Name: "
read name

echo "Project Description: "
echo -n "  "
read description


echo "=== INITIATING PROJECT ==="
project_dir="$GOPATH/src/$location/$name"

echo "Creating project dir in $project_dir"
mkdir -p $project_dir

echo "Creating Makefile"
echo "ensure:
	dep ensure

test: ensure
	go test ./... --cover

test_coverage: ensure
	go test -coverprofile test_coverage.html ./... && go tool cover -html=test_coverage.html

build: ensure
	go build -o ./out/$name .

run:
	./out/$name

install: build
	go install" > "$project_dir/Makefile"

echo "Creating README.md"
echo "# $name

## Description

$description

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

### Go Dep

The Dep, for dependency management tool for Go, version \``echo | dep version | grep version | tr ' ' '\n' | grep -v version | grep v`\` should be installed.
Go to [this link](https://github.com/golang/dep) and follow the instruction to install based on the system.
To check the installation, we can check its version by running the following command on the terminal:

\`\`\`bash
dep version
\`\`\`

Example of the output:

\`\`\`bash
`echo | dep version`
\`\`\`

## How to Test

In this project root directory, run the following command to test:

\`\`\`bash
make test
\`\`\`

To show a more complete coverage and uncovered lines:

\`\`\`bash
make test_coverage
\`\`\`

You can check into \`test_coverage.html\` file in root project directory. This command also will open interactive coverage tool in your browser if you have one.

## How to Build

In this project root directory, run the following command:

\`\`\`bash
make build
\`\`\`

There will be a new directory named \`out\` with an executable file \`$name\` as the result of the built project.

## How to Run

In order to run this project, after building this project, execute
the following command in this project root directory:

\`\`\`bash
make run
\`\`\`" > "$project_dir/README.md"

echo "test_coverage.html

out/
vendor/" > "$project_dir/.gitignore"

cd $project_dir
git init
dep init

echo "Project $name is initialized in: $project_dir"
