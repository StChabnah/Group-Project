# Group-Project

**Pocket Pantry** is a app to simplify the iPhone user interface by providing an interface that links to apps important to the user as well as providing an easy way to see weather and news data.

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] Import recipe videos from YouTube
- [x] User can add ingredients to their “Pantry”
- [x] User can delete ingredients from their “Pantry”
- [ ] Parse recipe description into keywords that match ingredients that the User has added to their “Pantry”
- [ ] User can favorite videos that are saved to a special tab in the user interface
- [ ] Option to display all videos or only videos that are avalible based on ingredients in the User’s “Pantry”

The following **optional** features are implemented:

- [ ] Parse the video descriptions to pull out things like ingredients and recipe instructions
- [ ] Build a grocery list of the ingredients needed to make a recipe
- [ ] Filter recipes based on catagories/type of cuisine

The following **additional** features are implemented:

- [ ] 

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. 
2. 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/dVrFt7C.gif?1' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## API

We will be using the [YouTube API](https://developers.google.com/youtube/v3/guides/ios_youtube_helper) to pull in videos.

## Data Model

| YouTubeVideo | |
| --- | --- |
| url | `String` |
| id | `String` |
| videoDescription | `String` |
| date | `NSDate` |

| Ingredient | |
| --- | --- |
| name | `String` |
| amount | `CGFloat` |


## Notes

// TODO

## License

    Copyright [2016] [Nathan Ansel, Chase McCoy, Abby Bassie, & Steve Buza]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
