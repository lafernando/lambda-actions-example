workflow "Update" {
  on = "push"
  resolves = ["Ballerina Build"]
}

action "Ballerina Build" {
  uses = "lafernando/github-actions/cli/latest@master"
  args = "build"
}
