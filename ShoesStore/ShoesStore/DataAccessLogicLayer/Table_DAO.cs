using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public abstract class Table_DAO<T> : ITable<T> where T : class
    {
        public void Delete(T obj)
        {
            DataProvider.Instance.Set<T>().Attach(obj);
            DataProvider.Instance.Set<T>().Remove(obj);
            DataProvider.Instance.SaveChanges();
        }

        public List<T> GetAll()
        {
            try
            {
                return DataProvider.Instance.Set<T>().ToList();
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public void Insert(T obj)
        {
            try
            {
// Your code...
// Could also be before try if you know the exception occurs in SaveChanges
                DataProvider.Instance.Set<T>().Add(obj);
                DataProvider.Instance.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                }

                throw;
            }
        }

        public void Update(T obj)
        {
            DataProvider.Instance.Set<T>().Attach(obj);
            DataProvider.Instance.Entry(obj).State = EntityState.Modified;
            DataProvider.Instance.SaveChanges();
        }

        public abstract void SetActive(T obj);
        public abstract bool IsExist(T obj);
    }
}