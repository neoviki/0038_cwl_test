cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 4
    ramMin: 2000
    tmpdirMin: 4096
hints:
  DockerRequirement:
    dockerPull: virusx/bbmap:36.84--0
label: BBMap 36.84
baseCommand: bbmap.sh
arguments:
  - "-Xmx$(runtime.ram)M"
  - "nodisk=t"
  - "out=stdout.sam"
inputs:
  name:
    type: string
  forward:
    type: File
    inputBinding:
      position: 1
      prefix: 'in='
      separate: false
  reverse:
    type: File?
    inputBinding:
      position: 2
      prefix: 'in2='
      separate: false
  reference:
    type: File
    inputBinding:
      position: 3
      prefix: 'ref='
      separate: false
  outFileSuffix:
    type: string
outputs:
  stdout:
    type: stdout

stdout: "$(inputs.name).sam"