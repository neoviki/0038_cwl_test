cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 4
    ramMin: 4000
    tmpdirMin: 8192
  - class: InlineJavascriptRequirement
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/megahit:1.1.1--py35_0
label: MEGAHIT 1.1.1
baseCommand: megahit
arguments:
  - "-t"
  - "$(runtime.cores)"
  - "--out-prefix"
  - "megahit"
inputs:
  forward:
    type: File[]
    inputBinding:
      position: 1
      prefix: '-1'
      itemSeparator: ","
  reverse:
    type: File[]
    inputBinding:
      position: 2
      prefix: '-2'
      itemSeparator: ","
  singleReads:
    type: File[]
    inputBinding:
      position: 4
      prefix: '-r'
      itemSeparator: ","
  presets:
    type: string
    default: meta-sensitive
    inputBinding:
      position: 3
      prefix: '--presets'
outputs:
  assembly:
    type: File
    outputBinding:
      glob: megahit_out/megahit.contigs.fa
  log:
    type: File
    outputBinding:
      glob: megahit_out/megahit.log