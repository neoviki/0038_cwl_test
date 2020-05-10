#!/bin/bash
rm -rf /Users/viki/cwl_test/tool/cwltool/*.pyc
/Users/viki/cwl_test/tool/cwltool.py --outdir output/ --cachedir /Users/viki/Documents/cwl_cache workflow/main.cwl workflow/job.yml
