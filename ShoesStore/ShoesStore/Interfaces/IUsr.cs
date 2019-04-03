using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    public interface IUsr<T>
    {
        UsrAct_DAO UsrAct { get; set; }
        T Login(string login, string pwd);
        void Register(T obj);
        void CreateActCode(T obj);
    }
}
