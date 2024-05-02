# WorkflowNo_8
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_8
doc: A workflow including the tool(s) Comet, idconvert, PeptideProphet, ProteinProphet.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3244" # mzML
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  MS_Amanda_01:
    run: /Users/peter/repos/bakeoff/containers/cwl/tools/MS_Amanda/MS_Amanda.cwl
    in:
      MS_Amanda_in_1: input_1
      MS_Amanda_in_2: input_2
    out: [MS_Amanda_out_1]
  idconvert_02:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/idconvert/idconvert_to_mzIdentML.cwl
    in:
      idconvert_in_1: MS_Amanda_01/MS_Amanda_out_1
    out: [idconvert_out_1]
  PeptideProphet_03:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/PeptideProphet/PeptideProphet.cwl
    in:
      PeptideProphet_in_1: idconvert_02/idconvert_out_1
      PeptideProphet_in_2: input_1
      PeptideProphet_in_3: input_2
    out: [PeptideProphet_out_1, PeptideProphet_out_2]
  ProteinProphet_04:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/ProteinProphet/ProteinProphet.cwl
    in:
      ProteinProphet_in_1: PeptideProphet_03/PeptideProphet_out_1
      ProteinProphet_in_2: input_2
    out: [ProteinProphet_out_1, ProteinProphet_out_2]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: ProteinProphet_04/ProteinProphet_out_1
