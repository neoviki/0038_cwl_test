cwlVersion: v1.0
class: Workflow
inputs:
  sampleName: string
  forward: File
  reverse: File
  unpaired: File
  reference: File

outputs:
  samFile:
    type: File
    outputSource: mapReadsToReference/stdout

steps:
  mapReadsToReference:
    label: 'map paired reads to assembly'
    run: tools/bbmap.cwl
    in:
      name: sampleName
      forward: forward
      reverse: reverse
      reference: reference
      outFileSuffix:
        default: ''
    out:
      - stdout