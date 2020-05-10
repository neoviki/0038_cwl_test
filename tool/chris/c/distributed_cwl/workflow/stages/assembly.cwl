cwlVersion: v1.0
class: Workflow
inputs:
  forward: File[]
  reverse: File[]
  singleReads: File[]
  megahitPresets: string

outputs:
  assembly:
    type: File
    outputSource: assemble/assembly
  assemblyLog:
    type: File
    outputSource: gzipAssemblyLog/gz

steps:
  assemble:
    label: 'assemble reads'
    run: tools/megahit.cwl
    in:
      forward: forward
      reverse: reverse
      singleReads: singleReads
      presets: megahitPresets
    out:
      - assembly
      - log

  gzipAssemblyLog:
    label: 'zip logfile'
    run: tools/gzip.cwl
    in:
      file: assemble/log
    out:
      - gz