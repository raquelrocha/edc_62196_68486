using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace TechGeeks.Logic
{
    public class ShoppingCart
    {
        public ArrayList list;
        public ShoppingCart()
        {
            list = new ArrayList();
        }

        public void addToCart(int productId, int quantity)
        {
            ShoppingCartObject c = new ShoppingCartObject(productId, quantity);
            bool productAlreadyExists = false;
            foreach (ShoppingCartObject obj in list)
            {
                if (obj.productId == productId)
                {
                    int newquantity = obj.quantity + quantity;
                    list.Remove(obj);
                    list.Add(new ShoppingCartObject(productId, newquantity));
                    productAlreadyExists = true;
                    break;
                }
            }
            if (!productAlreadyExists)
                list.Add(c);
        }
        public int getSize()
        {
            int count = 0;
            foreach (ShoppingCartObject obj in list)
                count += obj.quantity;
            return count;
        }
    }
    public class ShoppingCartObject
    {
        public int quantity;
        public int productId;
        public ShoppingCartObject(int productId, int quantity)
        {
            this.quantity = quantity;
            this.productId = productId;
        }
    }
}