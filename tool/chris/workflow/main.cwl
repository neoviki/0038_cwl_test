cwlVersion: v1.0
class: Workflow
label: Dev pipeline for Viki
requirements:
  - class: ScatterFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
  - class: MultipleInputFeatureRequirement
  - class: SubworkflowFeatureRequirement

inputs:
  sampleNames: string[]
  megahitPresets:
    type: string
    label: MEGAHIT preset
  forwardFiles:
    type: File[]
    label: forward input files (FASTQ)
  reverseFiles:
    type: File[]
    label: reverse input files (FASTQ)
  unpairedFiles:
    type: File[]
    label: unpaired input files (FASTQ)

steps:
  assembly:
    label: 'Assembly'
    run: stages/assembly.cwl
    in:
      forward: forwardFiles
      reverse: reverseFiles
      singleReads: unpairedFiles
      megahitPresets: megahitPresets
    out:
      - assembly
      - assemblyLog

  mapping:
    label: 'Mapping'
    run: stages/mapping.cwl
    scatter: [sampleName, forward, reverse, unpaired]
    scatterMethod: dotproduct
    in:
      sampleName: sampleNames
      forward: forwardFiles
      reverse: reverseFiles
      unpaired: unpairedFiles
      reference: assembly/assembly
    out:
      - samFile

outputs:
  assemblyAssembly:
    type: File
    outputSource: assembly/assembly
  assemblyLog:
    type: File
    outputSource: assembly/assemblyLog
  mappingSamFile:
    type: File[]
    outputSource: mapping/samFile
