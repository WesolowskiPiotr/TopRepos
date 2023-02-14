# Top Repos App

## Use Cases

### Load trending repositories from Github public API.

#### Data:
- API Endpoint: https://api.github.com/search/repositories?q=language=+sort:stars 

#### Primary course (happy path):
1. Execute "repositories" command with above API Endpoint.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates list of repositories from valid data.
5. System presents list of repositories with most important datas: 
    - avatar 
    - name
    - login
    - description
    - stars
    - language.
    
#### Invalid data – error course (sad path):
1. System presents error screen with "RETRY" button to call endpoint once again.

#### No connectivity – error course (sad path):
1. System presents connectivity error screen.

## Architecture

App has been designed using MVP Architecture patter connected with Coordinator pattern. 

## Interface

App interface has been created using SwiftUI, adjusted to support iOS versions from iOS 13 up to the newest one (for Feb '23) iOS 16.
App supports Dark and Light mode.
App supports vertical and horizontal screen position.

## Internationalization

App possess English language support extracted to localized file which allow add any additional language to the app with ease. 

## Dependencies

App uses two Swift Package Manager dependencies:

1. Lottie for presenting error screen when something went wrong during performing API request.
2. SwiftUI-Shimmer for animation of cells when loading data from server. 


## Associated Files

In attached folders you can find screenshots of the app functionalities 
presented on two iOS versions: 13 and 16 with dark/light mode.

1. /Screenshots/iOS 13/Dark Mode
2. /Screenshots/iOS 13/Light Mode
3. /Screenshots/iOS 16/Dark Mode
4. /Screenshots/iOS 16/Light Mode

Additionally in /Livescreens directory you can find recorded app in use for iOS 16 dark/light mode.

## Example Data Payload

```
GET https://api.github.com/search/repositories?q=language=+sort:stars 

200 RESPONSE

{
    "total_count": 374548,
    "incomplete_results": false,
    "items": [
        {
            "id": 23096959,
            "node_id": "MDEwOlJlcG9zaXRvcnkyMzA5Njk1OQ==",
            "name": "go",
            "full_name": "golang/go",
            "private": false,
            "owner": {
                "login": "golang",
                "id": 4314092,
                "node_id": "MDEyOk9yZ2FuaXphdGlvbjQzMTQwOTI=",
                "avatar_url": "https://avatars.githubusercontent.com/u/4314092?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/golang",
                "html_url": "https://github.com/golang",
                "followers_url": "https://api.github.com/users/golang/followers",
                "following_url": "https://api.github.com/users/golang/following{/other_user}",
                "gists_url": "https://api.github.com/users/golang/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/golang/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/golang/subscriptions",
                "organizations_url": "https://api.github.com/users/golang/orgs",
                "repos_url": "https://api.github.com/users/golang/repos",
                "events_url": "https://api.github.com/users/golang/events{/privacy}",
                "received_events_url": "https://api.github.com/users/golang/received_events",
                "type": "Organization",
                "site_admin": false
            },
            "html_url": "https://github.com/golang/go",
            "description": "The Go programming language",
            "fork": false,
            "url": "https://api.github.com/repos/golang/go",
            "forks_url": "https://api.github.com/repos/golang/go/forks",
            "keys_url": "https://api.github.com/repos/golang/go/keys{/key_id}",
            "collaborators_url": "https://api.github.com/repos/golang/go/collaborators{/collaborator}",
            "teams_url": "https://api.github.com/repos/golang/go/teams",
            "hooks_url": "https://api.github.com/repos/golang/go/hooks",
            "issue_events_url": "https://api.github.com/repos/golang/go/issues/events{/number}",
            "events_url": "https://api.github.com/repos/golang/go/events",
            "assignees_url": "https://api.github.com/repos/golang/go/assignees{/user}",
            "branches_url": "https://api.github.com/repos/golang/go/branches{/branch}",
            "tags_url": "https://api.github.com/repos/golang/go/tags",
            "blobs_url": "https://api.github.com/repos/golang/go/git/blobs{/sha}",
            "git_tags_url": "https://api.github.com/repos/golang/go/git/tags{/sha}",
            "git_refs_url": "https://api.github.com/repos/golang/go/git/refs{/sha}",
            "trees_url": "https://api.github.com/repos/golang/go/git/trees{/sha}",
            "statuses_url": "https://api.github.com/repos/golang/go/statuses/{sha}",
            "languages_url": "https://api.github.com/repos/golang/go/languages",
            "stargazers_url": "https://api.github.com/repos/golang/go/stargazers",
            "contributors_url": "https://api.github.com/repos/golang/go/contributors",
            "subscribers_url": "https://api.github.com/repos/golang/go/subscribers",
            "subscription_url": "https://api.github.com/repos/golang/go/subscription",
            "commits_url": "https://api.github.com/repos/golang/go/commits{/sha}",
            "git_commits_url": "https://api.github.com/repos/golang/go/git/commits{/sha}",
            "comments_url": "https://api.github.com/repos/golang/go/comments{/number}",
            "issue_comment_url": "https://api.github.com/repos/golang/go/issues/comments{/number}",
            "contents_url": "https://api.github.com/repos/golang/go/contents/{+path}",
            "compare_url": "https://api.github.com/repos/golang/go/compare/{base}...{head}",
            "merges_url": "https://api.github.com/repos/golang/go/merges",
            "archive_url": "https://api.github.com/repos/golang/go/{archive_format}{/ref}",
            "downloads_url": "https://api.github.com/repos/golang/go/downloads",
            "issues_url": "https://api.github.com/repos/golang/go/issues{/number}",
            "pulls_url": "https://api.github.com/repos/golang/go/pulls{/number}",
            "milestones_url": "https://api.github.com/repos/golang/go/milestones{/number}",
            "notifications_url": "https://api.github.com/repos/golang/go/notifications{?since,all,participating}",
            "labels_url": "https://api.github.com/repos/golang/go/labels{/name}",
            "releases_url": "https://api.github.com/repos/golang/go/releases{/id}",
            "deployments_url": "https://api.github.com/repos/golang/go/deployments",
            "created_at": "2014-08-19T04:33:40Z",
            "updated_at": "2023-02-13T11:04:56Z",
            "pushed_at": "2023-02-13T05:06:46Z",
            "git_url": "git://github.com/golang/go.git",
            "ssh_url": "git@github.com:golang/go.git",
            "clone_url": "https://github.com/golang/go.git",
            "svn_url": "https://github.com/golang/go",
            "homepage": "https://go.dev",
            "size": 343925,
            "stargazers_count": 108478,
            "watchers_count": 108478,
            "language": "Go",
            "has_issues": true,
            "has_projects": true,
            "has_downloads": true,
            "has_wiki": true,
            "has_pages": false,
            "has_discussions": true,
            "forks_count": 15903,
            "mirror_url": null,
            "archived": false,
            "disabled": false,
            "open_issues_count": 8137,
            "license": {
                "key": "bsd-3-clause",
                "name": "BSD 3-Clause \"New\" or \"Revised\" License",
                "spdx_id": "BSD-3-Clause",
                "url": "https://api.github.com/licenses/bsd-3-clause",
                "node_id": "MDc6TGljZW5zZTU="
            },
            "allow_forking": true,
            "is_template": false,
            "web_commit_signoff_required": false,
            "topics": [
                "go",
                "golang",
                "language",
                "programming-language"
            ],
            "visibility": "public",
            "forks": 15903,
            "open_issues": 8137,
            "watchers": 108478,
            "default_branch": "master",
            "score": 1.0
        },
        ...
    ]
}
