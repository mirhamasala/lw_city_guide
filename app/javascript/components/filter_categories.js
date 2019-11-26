// const getCategories = () => {
//   const categoriesJSON = document.querySelector('[data-categories]').dataset['categories'];
//   return JSON.parse(categoriesJSON);
// }

const getSelectedCategoryName = () => {
  const categories = document.querySelectorAll('.categories-list__item');
  categories.forEach((category) => {
    category.addEventListener('click', (event) => {
      const selectedCategory = event.currentTarget;
      return selectedCategory.dataset['name'];
    });
  });
}

const filterByCategories = (selectedCategoryName) => {
  const spotsRender = document.getElementById('spots-render');
  // spotsRender.innerHTML = `<%= render @spots.in_category(${selectedCategoryName}) %>`
}

export { getSelectedCategoryName, filterByCategories };
