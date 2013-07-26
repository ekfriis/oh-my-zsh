# Path to your oh-my-zsh configuration.
export ZSH=$HOME/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="blinks"
export ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)


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


export CVSROOT=:gserver:cmssw.cvs.cern.ch:/local/reps/CMSSW
export CVS_RSH=ssh

export lxpafs=/afs/cern.ch/user/f/friis

alias vim ~/bin/vim 

# DBS tools
dbsfiles() { dbs search --noheader --query="find file where dataset=$1 and file.numevents > 0" }
dbsfilesT2() { dbs search --noheader --query="find file where dataset=$1 and file.numevents > 0 and site=T2_US_Wisconsin" }
dbsfilesizes() { dbs search --noheader --query="find file.size where dataset=$1" }
alias averagesizes="awk '{ SUM += \$1; COUNT += 1 } END {print SUM*1.0/1024/1024/COUNT;}'"
dbsavgsize() { dbsfilesizes $1 | averagesizes }

alias cmsset='eval `scram ru -sh`; base=$CMSSW_BASE/src'
alias gridenv='source /cms/sw/glite3_2_5/etc/profile.d/grid_env.sh; source /cms/sw/CRAB_2_8_5/crab.sh'
alias jerbs='condor_q efriis'
alias manageHDFS='voms-proxy-init; gsissh -p 222 cmsgrid02.hep.wisc.edu' 
alias voms='voms-proxy-init --voms=cms --valid 128:0'
alias newroot='cd $scratch/root/; . bin/thisroot.sh; cd -'

# Kerberos management
export KRB5CCNAME=/tmp/krb5cc_evan_uw
alias kuw='kinit -r 604800 efriis@HEP.WISC.EDU; aklog -c hep.wisc.edu'
alias klxb='KRB5CCNAME=/tmp/krb5cc_evan_cern kinit friis@CERN.CH; KRB5CCNAME=/tmp/krb5cc_evan_cern aklog -c cern.ch'
alias cvs='KRB5CCNAME=/tmp/krb5cc_evan_cern cvs'
alias svn='KRB5CCNAME=/tmp/krb5cc_evan_cern svn'

jobRep() { jobReportSummary $1/*/*.xml --json-out $2 --output-dir=`basename $1`/1 }

export hdfs=/hdfs/store/user/efriis/
export scratch=/scratch/efriis/
export lxbpub=/afs/cern.ch/user/f/friis/public
export s=$scratch
export scratch_results=$scratch/results
export r=$scratch_results

export repos=/afs/hep.wisc.edu/code/hg/repos

# Set to zero to enable FWKLITE in scripts
export NOFWKLITE=blah

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

function lpwd {
   ls -d $PWD/$1
 }

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi 

export nobackup=/afs/hep.wisc.edu/cms/efriis 

[ -s "/afs/hep.wisc.edu/home/efriis/.scm_breeze/scm_breeze.sh" ] && source "/afs/hep.wisc.edu/home/efriis/.scm_breeze/scm_breeze.sh"

## Setup compiler config
#. /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/gcc/4.3.4/etc/profile.d/init.sh

## Setup a nice python
#source /cvmfs/cms.hep.wisc.edu/osg/app/cmssoft/cms/slc5_amd64_gcc462/external/python/2.7.3-cms4/etc/profile.d/init.sh 

## Setup root
#pushd /cvmfs/cms.cern.ch/slc5_amd64_gcc434/lcg/root/5.30.02-cms7
#. bin/thisroot.sh
#popd

#export LD_LIBRARY_PATH=$HOME/lib:${LD_LIBRARY_PATH}

# Use vi-keybindings
bindkey -v
