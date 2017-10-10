# shCryptoWithGithubOrg kaizhu256 shCustomOrgRepoListCreate kaizhu256/sandbox3
# shCryptoWithGithubOrg kaizhu256 /bin/sh "$HOME/src/sandbox2/.task.sh"
# shCryptoWithGithubOrg kaizhu256 shTravisTaskPush "$HOME/src/sandbox2/.task.sh"
# TRAVIS_REPO_CREATE_FORCE=1 shCryptoWithGithubOrg npmtest shCustomOrgRepoListCreate npmtest/node-npmtest-sandbox2
# shCryptoWithGithubOrg npmtest shGithubRepoListTouch npmtest/node-npmtest-sandbox2 '[npm publishAfterCommitAfterBuild]'
# shCryptoWithGithubOrg npmtest utility2 clis.dbTableCustomOrgUpdate
# GITHUB_ORG=npmtest utility2 cli.dbTableCustomOrgCrudGetManyByQuery '{"query":{"buildState":{"$ne":"passed"}},"shuffle":true}'
# GITHUB_OR=npmtest utility2 cli.dbTableCustomOrgCrudGetManyByQuery '{"query":{"buildState":"passed"},"limit":1,"shuffle":true}'
# [$ /bin/sh .task.sh]
# shCryptoTravisEncrypt scrapeitall
#!! [
    #!! '2017.09.06 jslint-lite',
    #!! '2017.09.12 apidoc-lite', // master
    #!! '2017.09.14 swagger-ui-lite', // master
    #!! '2017.09.15 uglifyjs-lite', // master
    #!! '2017.09.16 db-lite', // master
    #!! '2017.09.16 github-crud',
    #!! '2017.09.31 itunes-search-lite', // master
    #!! '2017.10.01 elasticsearch-lite',
    #!! '2017.10.01 api-google', // master
    #!! '2017.10.02 electron-lite', // master
    #!! '2017.10.02 google-maps-lite', // master
    #!! '2017.10.04 istanbul-lite', // master
    #!! '2017.10.05 swgg',
    #!! '2017.09.29 utility2'
#!! ]


shInitCustomOrg() {
    # init env
    export GITHUB_ORG="$GITHUB_ORG"
    unset GITHUB_REPO
    unset npm_package_buildCustomOrg
    if [ "$TRAVIS" ]
    then
        (cd "$HOME" && npm install "kaizhu256/node-utility2#alpha")
    fi
    DIR=/tmp/.task
    rm -fr "$DIR" && mkdir -p "$DIR" && cd "$DIR"
    . "$HOME/node_modules/utility2/lib.utility2.sh"
    shBuildInit
    eval "$(shCryptoTravisDecrypt)"
    utility2 cli.dbTableCustomOrgUpdate
}

shMain() {(set -e
    case "$CI_BRANCH" in
    cron)
        shTaskCron
        ;;
    task)
        shTask
        ;;
    *)
        shTask
        ;;
    esac
)}

shTask() {(set -e
# this function will run the task
    #!! for GITHUB_ORG in npmdoc
    #!! for GITHUB_ORG in npmtest
    #!! for GITHUB_ORG in scrapeitall
    for GITHUB_ORG in npmdoc npmtest
    #!! for GITHUB_ORG in npmtest npmdoc
    do
        shInitCustomOrg
        #!! export GITHUB_TOKEN_TOKEN="$GITHUB_TOKEN_TOKEN_API"
        if [ ! "$GITHUB_TOKEN" ]
        then
            shBuildPrint "no GITHUB_TOKEN"
            return 1
        fi



        #!! utility2 cli.dbTableCustomOrgUpdate
        #!! LIST=""
        #!! LIST="$LIST
#!! $(utility2 cli.dbTableCustomOrgCrudGetManyByQuery \
    #!! '{"limit":500,"query":{"buildState":{"$nin":["passed","started"]}},"olderThanLast":86400000,"shuffle":true}')"
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! shBuildPrint "re-build non-passed builds $LIST"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



        #!! shBuildPrint "test custom list"
        #!! LIST="sandbox2"
        #!! #!! LIST="xinhuanet.com"
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! printf "$LIST\n"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



        #!! shBuildPrint "re-build failed builds"
        #!! LIST=""
        #!! LIST="$LIST
#!! $(utility2 .clidbTableCustomOrgCrudGetManyByQuery \
    #!! '{"limit":500,"query":{"buildState":{"$in":["errored","failed"]}},"shuffle":true}')"
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! printf "$LIST\n"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



        #!! LIST=""
        #!! LIST="$LIST
#!! $(utility2 cli.dbTableCustomOrgCrudGetManyByQuery \
    #!! '{"limit":10,"query":{"buildState":{"$in":["passed"]}},"olderThanLast":86400000,"shuffle":true}')"
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! shBuildPrint "re-build old passed builds $LIST"
        #!! for GITHUB_REPO in $LIST
        #!! do
            #!! shCustomOrgBuildCi "$GITHUB_REPO"
        #!! done



        LIST=""
        LIST="$LIST
$(utility2 cli.dbTableCustomOrgCrudGetManyByQuery \
    '{"limit":1,"query":{"buildState":{"$in":["passed"]}},"olderThanLast":0,"shuffle":true}')"
        LIST="$(shCustomOrgNameNormalize "$LIST")"
        shBuildPrint "re-build old, passed-builds $LIST"
        shListUnflattenAndApplyFunction() {(set -e
            LIST="$1"
            shGithubRepoListTouch "$LIST" '[npm publishAfterCommitAfterBuild]'
        )}
        shListUnflattenAndApply "$LIST"



        #!! shBuildPrint "re-build non-passed builds"
        #!! LIST=""
        #!! LIST="$LIST
#!! $(utility2 cli.dbTableCustomOrgCrudGetManyByQuery \
    #!! '{"query":{"buildState":{"$nin":["passed","started"]}},"limit":500,"shuffle":true}')"
        #!! #!! LIST="
#!! #!! config.json
        #!! #!! "
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! printf "$LIST\n"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



        #!! LIST="$(utility2 cli.customOrgStarFilterNotBuilt 0 5000)"
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! shBuildPrint "rebuild unpublished starred packages $LIST"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



    done
)}

shTaskCron() {(set -e
# this function will run the cron-task
    for GITHUB_ORG in npmdoc
    #!! for GITHUB_ORG in npmtest
    #!! for GITHUB_ORG in npmdoc npmtest
    #!! for GITHUB_ORG in npmtest npmdoc
    do
        shInitCustomOrg
        if [ ! "$GITHUB_TOKEN" ]
        then
            shBuildPrint "no GITHUB_TOKEN"
            return 1
        fi



        #!! shBuildPrint "re-build failed builds"
        #!! LIST=""
        #!! LIST="$LIST
#!! $(utility2 cli.bTableCustomOrgCrudGetManyByQuery \
    #!! '{"limit":500,"query":{"buildState":{"$in":["errored","failed"]}},"shuffle":true}')"
        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! printf "$LIST\n"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



        LIST=""
        LIST="$LIST
$(utility2 cli.dbTableCustomOrgCrudGetManyByQuery \
    '{"limit":500,"query":{"buildState":{"$in":["passed"]}},"olderThanLast":86400000,"shuffle":true}')"
        LIST="$(shCustomOrgNameNormalize "$LIST")"
        shBuildPrint "re-build old, passed-builds $LIST"
        shListUnflattenAndApplyFunction() {(set -e
            LIST="$1"
            shGithubRepoListTouch "$LIST" '[npm publishAfterCommitAfterBuild]'
        )}
        shListUnflattenAndApply "$LIST"



        #!! LIST="$(utility2 cli.customOrgStarFilterNotBuilt 0 5000)"



        #!! LIST="$(shCustomOrgNameNormalize "$LIST")"
        #!! shBuildPrint "shGithubCrudRepoListCreate $LIST"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! shGithubCrudRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"
        #!! shTravisSync
        #!! shSleep 30



        #!! shBuildPrint "rebuild unpublished starred packages $LIST"
        #!! shListUnflattenAndApplyFunction() {(set -e
            #!! LIST="$1"
            #!! export TRAVIS_REPO_CREATE_FORCE=1
            #!! shCustomOrgRepoListCreate "$LIST"
        #!! )}
        #!! shListUnflattenAndApply "$LIST"



        utility2 cli.dbTableCustomOrgUpdate
        LIST=""
        LIST="$LIST
$(utility2 cli.dbTableCustomOrgCrudGetManyByQuery \
    '{"limit":500,"query":{"buildState":{"$nin":["passed","started"]}},"olderThanLast":86400000,"shuffle":true}')"
        LIST="$(shCustomOrgNameNormalize "$LIST")"
        shBuildPrint "re-build non-passed builds $LIST"
        shListUnflattenAndApplyFunction() {(set -e
            LIST="$1"
            export TRAVIS_REPO_CREATE_FORCE=1
            shCustomOrgRepoListCreate "$LIST"
        )}
        shListUnflattenAndApply "$LIST"



    done
)}

shMain
