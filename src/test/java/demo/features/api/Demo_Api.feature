Feature: Api

  @api
  Scenario: Github api sort repo desc
    * url 'https://github.com/orgs/SeleniumHQ/repos_list'
    * header content-type = 'application/json'
    * header x-requested-with = 'XMLHttpRequest'
    * param q = 'sort:updated'
    * method GET
    * def totalOpenIssue = response.repositories.map(x => x.issueCount).reduce((a, b) => a + b, 0);
    * def sortRepoDesc = response.repositories.map(x => x.name)
    * print 'Total open issue across all repo is :',totalOpenIssue
    * print 'Sort the repositories by date updated in descending order', sortRepoDesc

#    * url 'https://github.com/SeleniumHQ'
#    * header content-type = 'application/json'
#    * header x-requested-with = 'XMLHttpRequest'
#    * path 'docker-selenium'
#    * method GET