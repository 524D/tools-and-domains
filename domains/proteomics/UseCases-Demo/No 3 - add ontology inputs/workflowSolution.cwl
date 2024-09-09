# WorkflowNo_20
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_20
doc: A workflow including the tool(s) Comet, idconvert, mzRecal, Comet, PeptideProphet, ProteinProphet, protXml2IdList, GOEnrichment.

inputs:
  input1:
    type: File
    format: "http://edamontology.org/format_3244" # mzML
  input2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input3:
    type: File
    format: "http://edamontology.org/format_2196_plain" # OBO format_p
  input4:
    type: File
    format: "http://edamontology.org/format_3475_plain" # TSV_p
steps:
  Comet1:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/Comet/Comet.cwl
    in:
      Comet_in_1: input1
      Comet_in_2: input2
    out: [Comet_out_1]
  idconvert2:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/idconvert/idconvert.cwl
    in:
      idconvert_in_1: Comet1/Comet_out_1
    out: [idconvert_out_1]
  mzRecal3:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/mzRecal/mzRecal.cwl
    in:
      mzRecal_in_1: input1
      mzRecal_in_2: idconvert2/idconvert_out_1
    out: [mzRecal_out_1]
  Comet4:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/Comet/Comet.cwl
    in:
      Comet_in_1: mzRecal3/mzRecal_out_1
      Comet_in_2: input2
    out: [Comet_out_1]
  PeptideProphet5:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/PeptideProphet/PeptideProphet.cwl
    in:
      PeptideProphet_in_1: Comet4/Comet_out_1
    out: [PeptideProphet_out_1]
  ProteinProphet6:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/ProteinProphet/ProteinProphet.cwl
    in:
      ProteinProphet_in_1: PeptideProphet5/PeptideProphet_out_1
    out: [ProteinProphet_out_1]
  protXml2IdList7:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/protXml2IdList/protXml2IdList.cwl
    in:
      protXml2IdList_in_1: ProteinProphet6/ProteinProphet_out_1
    out: [protXml2IdList_out_1]
  GOEnrichment8:
    run: https://raw.githubusercontent.com/Workflomics/containers/main/cwl/tools/GOEnrichment/GOEnrichment.cwl
    in:
      GOEnrichment_in_1: protXml2IdList7/protXml2IdList_out_1
      GOEnrichment_in_2: input3
      GOEnrichment_in_3: input4
    out: [GOEnrichment_out_1]
outputs:
  output1:
    type: File
    format: "http://edamontology.org/format_2330_plain" # Textual format_p
    outputSource: GOEnrichment8/GOEnrichment_out_1
