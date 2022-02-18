using Microsoft.EntityFrameworkCore;

namespace Contact.Models
{
    public partial class ContactDBContext : DbContext
    {
        public ContactDBContext()
        {
        }

        public ContactDBContext(DbContextOptions<ContactDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Contact> Contacts { get; set; } = null!;
        public virtual DbSet<State> States { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-59ULRRI;Initial Catalog=ContactDB;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Contact>(entity =>
            {
                entity.ToTable("contact");

                entity.Property(e => e.ContactId).HasColumnName("contactID");

                entity.Property(e => e.City)
                    .HasMaxLength(40)
                    .HasColumnName("city");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(20)
                    .HasColumnName("firstName");

                entity.Property(e => e.LastName)
                    .HasMaxLength(20)
                    .HasColumnName("lastName");

                entity.Property(e => e.Note)
                    .HasColumnType("text")
                    .HasColumnName("note");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(10)
                    .HasColumnName("phoneNumber");

                entity.Property(e => e.StateCode)
                    .HasMaxLength(2)
                    .HasColumnName("stateCode")
                    .IsFixedLength();

                entity.Property(e => e.StreetAddress)
                    .HasMaxLength(80)
                    .HasColumnName("streetAddress");

                entity.Property(e => e.ZipCode)
                    .HasMaxLength(5)
                    .HasColumnName("zipCode");
            });

            modelBuilder.Entity<State>(entity =>
            {
                entity.HasKey(e => e.StateCode);

                entity.ToTable("state");

                entity.Property(e => e.StateCode)
                    .HasMaxLength(2)
                    .HasColumnName("stateCode")
                    .IsFixedLength();

                entity.Property(e => e.StateName)
                    .HasMaxLength(128)
                    .HasColumnName("stateName");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
