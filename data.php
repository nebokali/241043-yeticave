<?php
    $is_auth = rand(0, 1);
    
    $user_name = 'Екатерина'; // укажите здесь ваше имя
    
    $categories = [
        'Доски и лыжи', 
        'Крепления', 
        'Ботинки', 
        'Одежда', 
        'Инструменты', 
        'Разное'
    ];
    
    $items = [
        [
            'title' => '2014 Rossignol District Snowboard',
            'category' => 0,
            'price' => 10999,
            'url' => 'img/lot-1.jpg'
        ],
        [
            'title' => 'DC Ply Mens 2016/2017 Snowboard',
            'category' => 1,
            'price' => 159999,
            'url' => 'img/lot-2.jpg'
        ],
        [
            'title' => 'Крепления Union Contact Pro 2015 года размер L/XL',
            'category' => 2,
            'price' => 8000,
            'url' => 'img/lot-3.jpg'
        ],
        [
            'title' => 'Ботинки для сноуборда DC Mutiny Charocal',
            'category' => 3,
            'price' => 10999,
            'url' => 'img/lot-4.jpg'
        ],
        [
            'title' => 'Куртка для сноуборда DC Mutiny Charocal',
            'category' => 4,
            'price' => 7500,
            'url' => 'img/lot-5.jpg'
        ],
        [
            'title' => 'Маска Oakley Canopy',
            'category' => 5,
            'price' => 5400,
            'url' => 'img/lot-6.jpg'
        ]
    ];

?>