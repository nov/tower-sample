module.exports =
  mongodb:
    development:
      name: "tower-development"
      port: 27017
      host: "127.0.0.1"
    test:
      name: "tower-test"
      port: 27017
      host: "127.0.0.1"
    staging:
      name: "tower-staging"
      port: 27017
      host: "127.0.0.1"
    production:
      name: "tower-production"
      port: 27017
      host: "127.0.0.1"
    
  redis:
    development:
      name: "tower-development"
      port: 6397
      host: "127.0.0.1"
    test:
      name: "tower-test"
      port: 6397
      host: "127.0.0.1"
    staging:
      name: "tower-staging"
      port: 6397
      host: "127.0.0.1"
    production:
      name: "tower-production"
      port: 6397
      host: "127.0.0.1"
