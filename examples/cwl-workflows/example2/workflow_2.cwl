# WorkflowNo_2
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_2
doc: A workflow including the tool(s) Comet, PeptideProphet, ProteinProphet, StPeter.

inputs:
  input1:
    type: File
    format: "http://edamontology.org/format_3244" # mzML
  input2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  Comet1:
    run: https://raw.githubusercontent.com/Workflomics/tools-and-domains/refs/heads/main/cwl-tools/Comet/Comet.cwl
    in:
      Comet_in_1: input1
      Comet_in_2: input2
    out: [Comet_out_1]
  PeptideProphet2:
    run:  https://raw.githubusercontent.com/Workflomics/tools-and-domains/refs/heads/main/cwl-tools/PeptideProphet/PeptideProphet.cwl
    in:
      PeptideProphet_in_1: Comet1/Comet_out_1
      # Manual edit: PeptideProphet_in_2: input1
      PeptideProphet_in_2: input1
      # Manual edit: PeptideProphet_in_3: input2
      PeptideProphet_in_3: input2
    out: [PeptideProphet_out_1]
  ProteinProphet3:
    run: https://raw.githubusercontent.com/Workflomics/tools-and-domains/refs/heads/main/cwl-tools/ProteinProphet/ProteinProphet.cwl
    in:
      ProteinProphet_in_1: PeptideProphet2/PeptideProphet_out_1
# Manual edit: ProteinProphet_in_2: input2 (FASTA)
      ProteinProphet_in_2: input2
    out: [ProteinProphet_out_1, ProteinProphet_out_2]
  StPeter4:
    run: https://raw.githubusercontent.com/Workflomics/tools-and-domains/refs/heads/main/cwl-tools/StPeter/StPeter.cwl
    in:
      #StPeter_in_1: ProteinProphet3/ProteinProphet_out_1
      StPeter_in_1: ProteinProphet3/ProteinProphet_out_1
      # Manual edit: StPeter_in_2: input2
      StPeter_in_2: PeptideProphet2/PeptideProphet_out_1
      StPeter_in_3: input1
    out: [StPeter_out_1]
outputs:
  output1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: StPeter4/StPeter_out_1
