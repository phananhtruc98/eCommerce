namespace ShoesStore.Interfaces
{
    interface IUsr<T>:ITableOnePrimary<T>
    {
        void Login(string username, string password);
        void Register(T obj);

    }
}
