workflow "Update" {
  on = "push"
  resolves = ["GitHub Action for AWS"]
}

action "Ballerina Build" {
  uses = "lafernando/github-actions/cli/latest@master"
  args = "build"
}

action "GitHub Action for AWS" {
  uses = "actions/aws/cli@efb074ae4510f2d12c7801e4461b65bf5e8317e6"
  needs = ["Ballerina Build"]
  args = "lambda update-function-code --function-name hello --zip-file fileb://aws-ballerina-lambda-functions.zip"
  env = {
    AWS_DEFAULT_REGION = "us-west-1"
  }
  secrets = [
    "AWS_SECRET_ACCESS_KEY",
    "AWS_ACCESS_KEY_ID",
  ]
}
