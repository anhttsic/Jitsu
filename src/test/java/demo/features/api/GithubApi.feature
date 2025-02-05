Feature: Github api

  @getListRepo
  Scenario: Call get list repo
    * url gitUrl
    * path owner
    * path 'repos_list'
    * header content-type = 'application/json'
    * header x-requested-with = 'XMLHttpRequest'
    * param q = 'sort:updated'
    * method GET
    * status 200

  @callGetTotalWatchers
  Scenario: Get total watcher
    * url gitGraphqlUrl
    * header content-type = 'application/json'
    * header accept = '*/*'
    * header Authorization = 'Bearer ' + personalToken
    * text query =
      """
        {"query":"{repository(name: \"<repoName>\", owner: \"<owner>\") {watchers {totalCount}}}"}
      """
    * request query.replace('<repoName>', repoName).replace('<owner>', owner)
    * method POST