namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static string ToFormatMoney(this object money)
        {
            if (decimal.TryParse(money.ToString(), out var decMoney)) return $"{decMoney:n0}";
            return "0";
        }
    }
}