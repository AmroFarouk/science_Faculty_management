﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Managment_Office
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class sciencedbEntities : DbContext
    {
        public sciencedbEntities()
            : base("name=sciencedbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<export> exports { get; set; }
        public virtual DbSet<folders_table> folders_table { get; set; }
        public virtual DbSet<import> imports { get; set; }
        public virtual DbSet<managementByan> managementByans { get; set; }
        public virtual DbSet<qt3at> qt3at { get; set; }
        public virtual DbSet<userss> usersses { get; set; }
    }
}
