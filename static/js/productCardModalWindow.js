const images = document.querySelectorAll('.img-product');
const modal = document.getElementById('modal-1');
const modalContent = modal.querySelector('.modal-content');
// Чтобы сделать управление стилями гибче, нужно добавить больше запросов к разным селекторам

const modals = {};


images.forEach(image => {
  const target = image.dataset.target;
  modals[target] = modal;

  image.addEventListener('click', () => {
    // Получаем ID продукта из атрибута data-id у изображения
    const productId = image.getAttribute('data-id');
    
    // Делаем AJAX-запрос на сервер для получения информации о продукте по его ID
    fetch(`/product/${productId}`)
      .then(response => response.json())
      .then(product => {
        // Заполняем модальное окно информацией о продукте
        modalContent.innerHTML = `
          <h2>${product.category}</h2>
          <h3>${product.name}</h3>
          <img src="${product.image}">
          <p>${Number(product.price)} ₽</p>
          <p>${product.weight} кг</p>
          <p>${product.quantity} шт</p>
          <p>Тут будет много текста ${product.composition} с описанием так что стоит это учитывать при разработке стиля </p>
          <p>${product.calories} ккал</p>
        `;

        // Открываем модальное окно
        modal.style.display = 'flex';
      })
  });

  modal.querySelector('.close-btn').addEventListener('click', () => {
    modal.style.display = 'none';
  });

  modal.addEventListener('click', e => {
    if (e.target === modal) {
      modal.style.display = 'none';
    }
  });
});

document.addEventListener('keydown', e => {
  if (e.key === 'Escape') {
    Object.values(modals).forEach(modal => {
      modal.style.display = 'none';
    });
  }
});
