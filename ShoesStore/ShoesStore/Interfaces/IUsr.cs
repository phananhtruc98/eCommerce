using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    public interface IUsr<T>
    {
        void CreateActCode(T obj);
        UsrAct GetUsrAct(int usrId);
        T Login(string login, string pwd);
        void Register(T obj);
    }
}