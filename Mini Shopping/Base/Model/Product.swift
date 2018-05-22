//
//  Product.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 21/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

struct Shopping: Codable {
    var products: [Product]
}

struct Product: Codable {
    var free_shipping: Bool?
    var shipping_type: Int?
    var created_at: String?
    var discount_percentage: Int?
    var used: Bool?
    var title: String?
    var price_float: Float?
    var photos: [Photo]?
    var available_units: Bool?
    var content: String?
    var maximum_installment: Int?
    var category_id: Int?
    var like_user_ids: [Int]?
    var id: Int?
    var state: String?
    var categories: Category?
    var slug: String?
    var normalized_brand: String?
    var department_id: Int?
//    var original_price_unformatted: String?
    var published_comments_count: Int?
    var seo_title: String?
    var tags: [String]?
    var likes_count: Int?
    var promotions: [Promotion]?
    var awesomeness: Int?
    var size: String?
    var user_id: Int?
//    var minimum_price_integer: Int?
    var promoted_step: Int?
    var default_photo: Photo?
    var user: User?
    var category_slug: String?
//    var original_price_integer: Int?
    var href: String?
    var price: Int?
}

struct Photo: Codable {
    var cloudinary_public_id: String?
}

struct Category: Codable {
    var department: String?
    var category: String?
    var subcategory: String?
}

struct Promotion: Codable {
    var promotion_slug: String?
    var starts_at: String?
    var expires_at: String?
    var price: String?
    var promotion_id: Int?
    var product_price: String?
    var discount_percentage: Int?
}

struct User: Codable {
    var gender: String?
    var city: String?
    var nickname: String?
    var name: String?
    var description: String?
    var id: Int?
    var avatar: Photo?
    var state: String?
    var title: String?
    var href: String?
}

