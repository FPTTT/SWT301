/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> item) {
        this.items = item;
    }

    public List<Item> getItem() {
        return items;
    }

    public void setItem(List<Item> item) {
        this.items = item;
    }

    public Item getItemById(String id) {
        for (Item im : items) {
            if (im.getProduct().getId().equals(id)) {                
                return im;
            }
        }
        return null;
    }

    
    
    public int getQuantityById(String id) {
        Item itemById = getItemById(id);
        if (itemById != null) {
            return itemById.getQuantity();
        } else {
            // hoặc nếu bạn muốn xử lý khác khi không tìm thấy Item với id tương ứng
            // có thể throw một exception hoặc trả về một giá trị mặc định
            return 0; // hoặc throw new SomeException("Item not found with id: " + id);
        }
    }

    public void addItem(Item i) {
        // kiem tra xem trong cart da co Item day chua
        // neu co roi thi chi tang quantity chu ko them vao cart nua
        //vì Item không có key để xác định nên dựa vào id product
        // vì mỗi product sẽ có id riêng và ko trùng nhau
        //vì tìm thấy nên sẽ trả về Item thay vì null
        if (getItemById(i.getProduct().getId()) != null) {
            Item t = getItemById(i.getProduct().getId());
            t.setQuantity(t.getQuantity() + i.getQuantity());
        } else {
            items.add(i);
        }
    }

    // nếu muốn xóa 1 item nào đó trong cart
    public void removeItem(String id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    // tính tổng tiền cho tất cả item trong cart
    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += i.getQuantity() * i.getPrice();
        }
        return t;

    }

}
