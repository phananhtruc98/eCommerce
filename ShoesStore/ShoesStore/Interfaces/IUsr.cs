using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    public interface IUsr<T>
    {
        UsrAct GetUsrAct(int usrId);
        T Login(string login, string pwd);
        void Register(T obj);
        void CreateActCode(T obj);
    }
}