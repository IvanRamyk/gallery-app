# gallery app

### Использованые технологии

 * Printing to the console - для отслеживания корректности передачи данных в приложении
 * Assigning variables - использовано в каждом классе
 * Checking for null or zero - использовалось в нескольких местах, например для проверки есть ли подпись к фотографии. Если ее не было использовалась альтернативная.
 * Asynchronous programming - было реализовано через future, async, await
 * Futures - в основном использовались во время получения данных с ресурса unsplash.com
 * async, await - методы сервиса, работающего с API unsplash.com реализованы как async; 
 ожидают ответа с ресурса. Так же метод класса GalleryScreen _fetchPosts тоже async, так как работает с сервисом и ждет окончания выполнения его методов
 * widgets - для главной был использован ListView.builder, в отличии от обычного ListView он не билдит все элементы списка сразу, 
 что для большого количества элементов было бы важно. Так же были использованы различные Layout widgets - для разположения контента внутри
 отдельного элемента списка, а так же для отцентровки фотографии
 * TextStyle - был использован для стилизации текста в элементах списка
 * Material library - было использовано много виджетов из библиотеки, в частности ListView, ListTile, InkWell, Material, и т.д.
 * widget tree - присутствует в любом проекте. Переодически обращался к flutter inspector для просмотра   
 * reuse of a widget - не использовал собственные reusable widgets, так как не было необходимости избегать дублирования 
 * assets - не использовалось
 * load images over a network - использовал NetworkImage для отображения изображений 
 * ThemeData class - использовано для задания основных цветов, большего функционал приложения не требовал
 * StatefulWidget - использован для класса GalleryScreen, так как необходимо было изменять состояние
 * StatelessWidget - использован для класса ImageViewScreen, так как его состояние не изменяется
 * constructor - для класса UnsplashedImage было реализовано два конструктора, один именной, для создания экземпляра на основе json-a. 
 Так же в конструктор класса ImageView передается экземпляр класса UnsplashedImage, для отображения
 * shared_preferences plugin - не был использован 
 * Route, Navigator - использовались во время перехода со страницы Gallery к странице ImageView
 * TabController, TabBar, Tab, TabBarView - функционал не требовал использования TabBar для навигации
 * Drawer - функционал не требовал использования Drawer для навигации
 * PanResponder - не был использован 
 * http package - использован для get запросов 
 * Animation, AnimationController, FadeTransition, Dismissible  - был использован transparent_image package для отображения картинки
  