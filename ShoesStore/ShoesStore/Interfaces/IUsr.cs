namespace ShoesStore.Interfaces
{
    public interface IUsr<T>:ITableOnePrimary<T>
    {
        T Login(string login, string pwd);
        void Register(T obj);
        void CreateActCode(T obj);
    }
}
