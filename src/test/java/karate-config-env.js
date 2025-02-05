function fn(env) {
  var environments = {
    'sit': {
      'gitUrl': 'https://github.com/orgs',
      'gitGraphqlUrl': 'https://api.github.com/graphql'
    },
    'stg': {
      'gitUrl': 'https://github.com/orgs',
      'gitGraphqlUrl': 'https://api.github.com/graphql'
    }
  }

  return environments[env.env]
}