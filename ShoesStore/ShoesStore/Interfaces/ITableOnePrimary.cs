namespace ShoesStore.Interfaces
{
    public interface ITableOnePrimary<T>:ITable<T>
    {
        T GetByPrimaryKeys(int id);
    }
}
