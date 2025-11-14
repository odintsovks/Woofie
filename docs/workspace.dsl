workspace "Woofie" "CAT Tool" {

    !identifiers hierarchical

    model {
        u = person "Переводчик,\nредактор" "Работают с текстом своего проекта по переводу"
        tool = softwareSystem "CAT-инструмент" {
            client = container "Приложение-клиент" "Графический интерфейс для работы с текстом" "Qt 6" "Frontend"
            server = container "Приложение-сервер" "Формирует запросы в хранилище текста и сервисы машинного перевода" "Java" "Backend"
            db = container "База данных" "Хранилище текстовых данных: единицы перевода в изначальном и переведённом видах, глоссарий" "PostgreSQL" "Database"
        }
        externalService = softwareSystem "Сервисы машинного перевода" "Сервис, генерирующий машинный перевод по запросу, как правило по уникальному API-ключу" {
            tags "External"
        }

        u -> tool.client "Получают и изменяют текстовые данные, запрашивают машинный перевод используя"
        tool.server -> externalService "Создаёт машинный перевод используя"
        tool.client -> tool.server "Отправляет запросы на машинный перевод и получение, изменение данных в"
        tool.server -> tool.db "Формирует запросы чтения и записи в"
    }

    views {
        systemContext tool "Diagram1" {
            include *
            autolayout lr
        }

        container tool "Diagram2" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                color #1168bd
                stroke #1168bd
                strokeWidth 7
                shape roundedbox
            }
            element "Person" {
                shape person
                color #55aa55
                stroke #55aa55
            }
            element "Database" {
                shape cylinder
            }
            element "Frontend" {
                shape WebBrowser
            }
            element "Backend" {
            }
            element "External" {
                color #ee7900
                stroke #ee7900
            }
            element "Boundary" {
                strokeWidth 5
            }
            relationship "Relationship" {
                thickness 4
            }
        }

        terminology {
            person "Пользователь"
            softwareSystem "Программная система"
            container "Контейнер"
        }

    }

    configuration {
        scope softwaresystem
    }

}
