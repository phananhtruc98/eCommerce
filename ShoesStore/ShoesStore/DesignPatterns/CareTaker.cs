using System;
using System.Collections.Generic;

namespace ShoesStore.DesignPatterns
{
    public static class CareTaker<T> where T : ICloneable
    {
        private static readonly List<Memento<T>> mementoList = new List<Memento<T>>();

        public static void RestoreState(Originator<T> orig, int checkPoint)
        {
            orig.RestoreMemento(mementoList[checkPoint]);
        }

        public static void SaveState(Originator<T> orig)
        {
            mementoList.Add(orig.CreateMemento());
        }
    }
}