Set-StrictMode -Version 2.0
param ($Trigger)


$RefreshButtonYaml ="apiVersion: tilt.dev/v1alpha1
kind: UIButton
metadata:
  name: kubefwd:refresh
spec:
  text: Refresh
  location:
    componentType: resource
    componentID: kubefwd:run
---
apiVersion: tilt.dev/v1alpha1
kind: Cmd
metadata:
  name: kubefwd:refresh
  annotations:
    'tilt.dev/resource': 'kubefwd:run'
spec:
  args: ['touch', '$Trigger']
  startOn:
    uiButtons:
    - kubefwd:refresh
"


$RefreshButtonYaml | tilt apply -f -
