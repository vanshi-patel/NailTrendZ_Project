namespace ProjectSem6.Models
{
    public class Product
    {
        public string Id { get; set; }  // Ensure this matches your database field
        public string ImageURL { get; set; }
        public decimal Price { get; set; }
        public string Name { get; set; }
    }

}
