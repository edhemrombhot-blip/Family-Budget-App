-- ============================================
-- Budget Rombhot — Setup Supabase
-- Exécuter (ou ré-exécuter) dans SQL Editor de votre projet Supabase
-- ============================================

create table if not exists transactions (
  id          bigint        primary key,
  year        int           not null,
  month       int           not null,
  type        text          not null check (type in ('depense','revenu','retrait_dab')),
  cash        boolean       not null default false,
  amount      decimal(10,2) not null,
  cat         text          not null,
  note        text          not null default '',
  date        text          not null,
  user_name   text          not null default 'Inconnu',
  created_at  timestamptz   not null default now()
);

create table if not exists params (
  key   text          primary key,
  value decimal(10,2) not null default 0
);

-- Table dépenses fixes personnalisées (nouvelle)
create table if not exists fixed_expenses (
  id         serial        primary key,
  label      text          not null,
  amount     decimal(10,2) not null default 0,
  sort_order int           not null default 99
);

-- Accès libre (app familiale privée, pas d'auth publique)
alter table transactions   enable row level security;
alter table params         enable row level security;
alter table fixed_expenses enable row level security;

drop policy if exists "famille_tx"        on transactions;
drop policy if exists "famille_params"    on params;
drop policy if exists "famille_fixed_exp" on fixed_expenses;

create policy "famille_tx"         on transactions   for all using (true) with check (true);
create policy "famille_params"     on params         for all using (true) with check (true);
create policy "famille_fixed_exp"  on fixed_expenses for all using (true) with check (true);

-- Activer les mises à jour en temps réel (IMPORTANT pour la sync entre appareils)
do $$ begin
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and tablename='transactions') then
    alter publication supabase_realtime add table transactions;
  end if;
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and tablename='params') then
    alter publication supabase_realtime add table params;
  end if;
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and tablename='fixed_expenses') then
    alter publication supabase_realtime add table fixed_expenses;
  end if;
end $$;

-- Dépense fixe par défaut : frais d'écolage
insert into fixed_expenses (label, amount, sort_order)
select 'Frais d''écolage', 0, 10
where not exists (select 1 from fixed_expenses where label = 'Frais d''écolage');

-- ============================================
-- PHOTOS DE FACTURES — Storage
-- Ré-exécutable sans risque
-- ============================================

-- Colonne URL de la photo sur les transactions
alter table transactions
  add column if not exists receipt_url text default null;

-- Bucket public "receipts"
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'receipts',
  'receipts',
  true,
  5242880,   -- 5 Mo max par fichier
  array['image/jpeg','image/png','image/webp']
)
on conflict (id) do nothing;

-- Politique d'accès libre (app familiale sans auth)
drop policy if exists "famille_receipts" on storage.objects;
create policy "famille_receipts"
  on storage.objects for all
  using  (bucket_id = 'receipts')
  with check (bucket_id = 'receipts');
