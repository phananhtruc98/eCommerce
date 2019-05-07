﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DesignPatterns
{
    public class Originator<T> where T:ICloneable
    {
        private T StateObj { get; set; }
        public Memento<T> CreateMemento()
        {

            Memento<T> m = new Memento<T>();
            m.SetState(this.StateObj);
            return m;
        }
        public void RestoreMemento(Memento<T> m)
        {
            this.StateObj = m.GetState();
        }

        public void SetState(T state)
        {
            this.StateObj = state;
        }
        public void ShowState()
        {

            Console.WriteLine(this.StateObj.ToString());
        }
    }
}