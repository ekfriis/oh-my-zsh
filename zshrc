# Path to your oh-my-zsh configuration.
export ZSH=$HOME/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="wezm"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space                            

#if [ -f /etc/bashrc ]; then
#        source /etc/bashrc
#fi

if [ -f /afs/hep.wisc.edu/cms/setup/bashrc ]; then
	source /afs/hep.wisc.edu/cms/setup/bashrc
fi

export SCRAM_ARCH=slc5_amd64_gcc434

. /afs/hep.wisc.edu/osg/app/cmssoft/cms/slc5_amd64_gcc434/external/python/2.6.4-cms14/etc/profile.d/init.sh
cd /afs/hep.wisc.edu/osg/app/cmssoft/cms/slc5_amd64_gcc434/lcg/root/5.27.06b-cms21/ && . ./bin/thisroot.sh; cd -

export CVSROOT=:gserver:cmscvs.cern.ch:/cvs_server/repositories/CMSSW
export CVS_RSH=ssh

alias vim ~/bin/vim 
dbsfiles() { dbs search --noheader --query="find file where dataset=$1" }
alias cmsset='eval `scram ru -sh`; base=$CMSSW_BASE/src'
alias gridenv='source /cms/sw/glite3_2_5/etc/profile.d/grid_env.sh; source /cms/sw/CRAB_2_7_8p1/crab.sh'
alias jerbs='condor_q efriis'
alias manageHDFS='voms-proxy-init; gsissh -p 222 cmsgrid02.hep.wisc.edu' 
alias voms='voms-proxy-init --voms=cms --hours=48'

jobRep() { jobReportSummary $1/*/*.xml --json-out $2 --size-report --output-dir=`basename $1`/1 }

export hdfs=/hdfs/store/user/efriis/
export scratch=/data/efriis/
