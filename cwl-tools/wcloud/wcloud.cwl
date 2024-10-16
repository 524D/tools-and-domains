# The template for this tool description is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: CommandLineTool
baseCommand: wcloud
label: wcloud
requirements:
  ShellCommandRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.wcloud_in_0)
  DockerRequirement:
    dockerPull: robmarissen/wcloud:21aee44
arguments: ["--output", "output.png", "--background-color", "white", "--width", "1200", "--height", "800"]

inputs:
  wcloud_in_0:
    type: File
    format: "http://edamontology.org/format_2330" # Textual format
    inputBinding:
      prefix: --text
      valueFrom: $(self.basename)

outputs:
  wcloud_out_0:
    type: File
    format: "http://edamontology.org/format_3603" # PNG
    outputBinding:
      glob: "output.png"

