<div align="center">
  <h1>Recipe App</h1>
</div>

<a name="readme-top"></a>
<!-- TABLE OF CONTENTS -->
# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Blog App ](#-blog-app-)
  - [🛠 Built With ](#-built-with-)
    - [Key Features ](#key-features-)
    - [Technical Setup ](#technical-setup-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)


<!-- PROJECT DESCRIPTION -->

# 📖 Blog App <a name="about-project"></a>

> RecipeApp keeps track of all your recipes, ingredients, and inventory. Also allows for saving ingredients, keep track of what you have, create recipes, and generate a shopping list based on what is available and missing. Also, since sharing recipes is an important part of cooking, the app allows you to make them public so anyone can access them

## 🛠 Built With <a name="built-with"></a>
<h2> Tech Stack </h2>
- Ruby on Rails
- PSQL
- Javascript

<!-- Features -->

### Key Features <a name="key-features"></a>

- Display login page.

- Display registration page.

- A food list (with all CRUD implementation, except for 'update')

- A recipes list (with all CRUD implementation, except for 'update').

- A general shopping list view (all missing food for all your recipes and total price).

- A list of all public recipes from other users with their names and total prices.

- Tested the controllers and models

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Technical Setup <a name="technical-setup"></a>
- Set up the repository on GitHub and use Gitflow.
- Set up Devise for authentication.
- Set up RSpec and Capybara testing libraries.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

Example command:

```sh
 Install Ruby
 Install rails
```

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone https://github.com/unorjikingsley/Recipe-App.git
```

### Usage

To run the project, execute the following steps:

- create a `database` using `postgresql`

- Go to `config/database.yml` to connect to your `database`

- Then run the following command in your terminal:

```sh
  rails s
```

### Run tests

To run tests, run the following command in the terminal:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Unorji Kingsley**

- GitHub: [@unorjikingsley](https://github.com/unorjikingsley)
- LinkedIn: [unorjikingsley](linkedin.com/in/unorjikingsley)

👤 **Biftu Girma**

- GitHub: [deniodev](https://github.com/Bifabig)
- Twitter: [@biftu94](https://twitter.com/biftu94)
- LinkedIn: [Biftu Girma](https://www.linkedin.com/in/biftu-girma/)

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- Add `update` in `CRUD` implementations

- Inventories list:
    - Should display a list of inventories created by the logged-in user as in the wireframe.
    - Should lead to inventory details.
    - If the user is the owner of the inventory, should allow to delete it.

- Inventory details:
    - Should display the inventory details as in the wireframe.
    - Should lead to a form that allows users to add new food.

- Recipe details:
    - Should have a modal to choose an inventory to create a shopping list with, as in the wireframe.

- Inventory shopping list:
    - Should show the list of food that is missing by comparing the food in the recipe with the food in the inventory.
    - Should count the total food items and total price of the missing food.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Thanks to all Microverse community.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
