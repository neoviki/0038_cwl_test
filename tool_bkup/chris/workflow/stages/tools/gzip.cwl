cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 512
hints:
  DockerRequirement:
    dockerPull: virusx/pigz:2.3.4
baseCommand: pigz
arguments:
  - "-c"
inputs:
  file:
    type: File
    inputBinding:
      position: 1
outputs:
  gz:
    type: stdout

stdout: "$(inputs.file.basename).gz"