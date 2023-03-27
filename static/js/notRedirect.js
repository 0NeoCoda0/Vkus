const addButtons = document.querySelectorAll('.add_button .product_button');

addButtons.forEach((button) => {
  button.addEventListener('submit', (event) => {
    event.preventDefault(); // отменяем стандартное поведение формы

    const form = event.target;
    const url = form.action;

    // отправляем POST запрос на сервер с помощью AJAX
    fetch(url, {
      method: 'POST',
    })
      .then((response) => response.json()) // парсим JSON ответ от сервера
      .then((data) => {
        // производим редирект на указанную страницу без перезагрузки
        window.location.replace(data.redirectUrl);
      })
      .catch((error) => {
        console.log('Ошибка при отправке запроса', error);
      });
  });
});