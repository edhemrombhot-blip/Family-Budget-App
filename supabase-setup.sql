-- ============================================
-- Budget Rombhot — Setup Supabase
-- Exécuter dans SQL Editor de votre projet Supabase
-- ============================================

create table if not exists transactions (
  id          bigint       primary key,
  year        int          not null,
  month       int          not null,
  type        text         not null check (type in ('depense','revenu','retrait_dab')),
  cash        boolean      not null default false,
  amount      decimal(10,2) not null,
  cat         text         not null,
  note        text         not null default '',
  date        text         not null,
  user_name   text         not null default 'Inconnu',
  created_at  timestamptz  not null default now()
);

create table if not exists params (
  key   text          primary key,
  value decimal(10,2) not null default 0
);

-- Accès libre (app familiale privée, pas d'auth publique)
alter table transactions enable row level security;
alter table params       enable row level security;

create policy "famille_tx"     on transactions for all using (true) with check (true);
create policy "famille_params" on params       for all using (true) with check (true);

-- Activer les mises à jour en temps réel
alter publication supabase_realtime add table transactions;
alter publication supabase_realtime add table params;
