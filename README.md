erDiagram
    
    USER {
        integer id
        string email
        string name
        string address
    }
    
    ORDER {
        integer id
        integer user_id
        date order_date
        string status
        decimal total_amount
    }
    
    PRODUCT {
        integer id
        string name
        text description
        decimal price
        integer stock_quantity
        integer category_id
    }
    
    CATEGORY {
        integer id
        string name
        text description
    }

    ORDER_ITEM {
        integer id
        integer order_id
        integer product_id
        integer quantity
        decimal unit_price
    }

    USER ||--o{ ORDER : places
    ORDER ||--|{ ORDER_ITEM : contains
    PRODUCT ||--o{ ORDER_ITEM : "ordered in"
    CATEGORY ||--o{ PRODUCT : has
