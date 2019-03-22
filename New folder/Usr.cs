namespace DTO
{
    public class Usr
    {
        public int UsrId { get; set; }
        public string UserName { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public bool Active { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public DateTime DateAdd { get; set; }
        public DateTime? DateEdit { get; set; }
    }
}
