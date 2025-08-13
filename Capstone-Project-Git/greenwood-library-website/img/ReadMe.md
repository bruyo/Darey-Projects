# Capstone Project - Git

## Enhancing a Community Library Website

### Background Scenario

You're a part of a development team tasked with enhancing the website for the "*Greenwood Community Library*". The website aims to be more engaging and informative for its visitors.

It currently includes basic sections: *Home*, *About Us*, *Event*, and *Contact Us*. Your team decides to add a *Book Review* section and update the *Events* page to 

feature upcoming community events.


### Setup

- Create a Repository on GitHub.

1. Name it greenwood-library-website

![greenwood-repository-creeation](greenwood-repo.JPG)

### Task 

- Create in the main branch using a *visual studio code editor*, the files for the each web pages.

1. home.html

'touch home.html'

![home-page](home.JPG)

2. about_us.html

'touch about_us.html

![home-page](about_us.JPG)

3. events.html

'touch events.html'

![home-page](events.JPG)

4. contact_us.html

'touch contact_us.html'

![home-page](contact_us.JPG)

- Add content into each of the files.

1. Homepage

'vim home.html'

![home-page-editor](home-editor.JPG)

![home-page-content](homepage-content.JPG)


2. About-Us

'vim about_us.html'

![about_us-editor](about_us-editor.JPG)

![about_us-content](about_us-content.JPG)


3. Events

'vim events.html'

![event-editor](event-editor.JPG)

![event-content](event-content.JPG)


3. Contact_Us

'vim contact_us.html'

![contact_us-editor](contact_us-editor.JPG)

![contact_us-content](contact_us-content.JPG)


- Stage, commit and push the changes directly to *main branch*.

'git add .'

![staging](main-website-changes.JPG)

'git commit -m "main-website-changes"'

![main-website-commit](main-website-commit.JPG)

'git push'

![main-website-push](main-website-push.JPG)


### Morgan's Work:Adding Book Reviews

1. Create a Branch for Morgan:

'git branch *add-book-reviews*.

![add-book-reviews](morgan-branch.JPG)

2. Switch to a new branch named *add-book-reviews*.

'git switch add-book-reviews'

![add-book-reviews-branch-switch](add-book-reviews-switch.JPG)

3. Add a new file *book_reviews.html* to represent the Book Reviews Section:

'touch book_reviews.html'

![book-reviews-file](book-reviews.JPG)


4. Add a random text content into the file. 

'vim book_reviews.html'

![book-reviews-editor](book-reviews-editor.JPG)

![book-reviews-content](book-reviews-content.JPG)


5. Stage, commit and push the changes with a message like "*Add book reviews section*".

'git add .'

![Morgans-staging](book-reviews-changes.JPG)

'git commit -m "Add book reviews section"'

![book-reviews-commit](book-reviews-commit.JPG)

6. Push the add-book-reviews branch to GitHub.

'git push --set-upstream origin add-book-reviews'

![book-reviews-push](book-reviews-push.JPG)


7. Raise a Pull Request (PR) for Morgan's work:

- Create a new "Pull request" by clicking on "Pull request".

![pull-request](Pull-request.JPG)

- Click on "New pull request".

![pull-request-1](Pull-request-1.JPG)

- Compare changes between the main branch and add-book-reviews branch and click on "Create pull request".

![compare-changes](compare-changes.JPG)

- Add a title and description of the changes and click on "Create pull request".

![add-description](changes-review.JPG)

8. Merge Morgan's work to the main branch.

- Click on "Merge pull request".

![merge-pull-request](merge-pr.JPG)

- Click on "Confirm merge".

![confirm-merge](confirm-merge.JPG)

![merged-book-reviews](merged-request.JPG)


### Jamie's Work: Updating Events Page

We are going to repeat same flow for Jamie's work on the Events Page. Jamie's work is in *update-events* branch.

1. Pull the latest changes from the main branch into *update-events* before raising the Pull Request (PR)

- Switch to the main branch.

'git switch main'

![switch-main-branch](branch-switch-main.JPG)

- Pull the latest changes.

'git pull origin add-book-reviews"

![pull-latest-changes-to-main-branch](pull-changes.JPG)

- Create Jamie's branch

'git branch 
