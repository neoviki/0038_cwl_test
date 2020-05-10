#!/bin/bash
rm -rf /home/viki-haimor/cwl_dist/cwltool_viki/tool/cwltool/*.pyc
 /home/viki-haimor/cwl_dist/cwltool_viki/tool/cwltool.py --outdir output/ workflow/main.cwl workflow/job.yml
