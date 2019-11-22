using System;

namespace ShoesStore.DesignPatterns
{
    public class Originator<T> where T : ICloneable
    {
        private T StateObj { get; set; }

        public Memento<T> CreateMemento()
        {
            var m = new Memento<T>();
            m.SetState(StateObj);
            return m;
        }

        public void RestoreMemento(Memento<T> m)
        {
            StateObj = m.GetState();
        }

        public void SetState(T state)
        {
            StateObj = state;
        }

        public void ShowState()
        {
            Console.WriteLine(StateObj.ToString());
        }
    }
}