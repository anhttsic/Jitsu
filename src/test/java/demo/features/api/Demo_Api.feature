Feature: Demo Api

  @api
  Scenario Outline: Demo Api
    * call read(featurePath + 'api/GithubApi.feature@getListRepo') {owner: <owner>}
    * def totalOpenIssue = response.repositories.map(x => x.issueCount).reduce((a, b) => a + b, 0);
    * def sortRepoDesc = response.repositories.map(x => {return {name: x.name, lastUpdateTime: x.lastUpdated.timestamp}})
    * print 'Total open issue across all repo is :',totalOpenIssue
    * print 'Sort the repositories by date updated in descending order', sortRepoDesc

    * def results = []
    * eval
      """
        sortRepoDesc.forEach(x => {
          var temp = karate.call(featurePath + 'api/GithubApi.feature@callGetTotalWatchers', {repoName: x.name, owner: owner})
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

    Examples:
      | owner      |
      | SeleniumHQ |