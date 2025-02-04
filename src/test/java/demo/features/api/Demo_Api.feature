Feature: Github Api

  @api
  Scenario: Github api
    * def owner = 'SeleniumHQ'
    * url 'https://github.com/orgs'
    * path owner
    * path 'repos_list'
    * header content-type = 'application/json'
    * header x-requested-with = 'XMLHttpRequest'
    * param q = 'sort:updated'
    * method GET
    * def totalOpenIssue = response.repositories.map(x => x.issueCount).reduce((a, b) => a + b, 0);
    * def sortRepoDesc = response.repositories.map(x => x.name)
    * print 'Total open issue across all repo is :',totalOpenIssue
    * print 'Sort the repositories by date updated in descending order', sortRepoDesc
    * def results = []
    * eval
      """
        sortRepoDesc.forEach(x => {
          var temp = karate.call('classpath:demo/features/api/Demo_Api.feature@callGetTotalWatchers', {repoName: x, owner: owner})
          var result = {}
          result['repoName'] = x
          result['totalWatchers'] = karate.jsonPath(temp.response, '$..totalCount')[0]
          results.push(result)
        })
      """
    * def sortResults = karate.sort(results, x => x.totalWatchers).reverse()
#    * def size = karate.sizeOf(sortResults)
#    * def last = sortResults[size - 1]
    * print 'Most watching repository is :', sortResults[0].repoName
    * print 'Total watchers of repository is :', sortResults[0].totalWatchers

  @callGetTotalWatchers
  Scenario: Get total watcher
    * url 'https://api.github.com/graphql'
    * header content-type = 'application/json'
    * header accept = '*/*'
    # Personal Token will expire in 30 days
    * header Authorization = 'Bearer ' + personalToken
    * text query =
      """
        {"query":"{repository(name: \"<repoName>\", owner: \"<owner>\") {watchers {totalCount}}}"}
      """
    * request query.replace('<repoName>', repoName).replace('<owner>', owner)
    * method POST