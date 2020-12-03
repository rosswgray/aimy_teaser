const Choices = require('choices.js')

const initChoices = () => {
  const element = document.getElementById('activity_tag_list');
  console.log('inside initChoices')
  if (element) {
    console.log('inside initChoices, element found!')
    new Choices(element, {
      removeItems: true,
      addItems: true,
      removeItemButton: true,
    });
  }
}

export { initChoices }
