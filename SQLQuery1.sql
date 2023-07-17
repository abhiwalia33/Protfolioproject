Select *
From ProtfolioProject..CovidDeaths$
order by 3,4

Select *
From ProtfolioProject..CovidVaccinations$
order by 3,4
---looking at total cases vs total deaths
---shows what % of population got covid

Select location,date,population,total_cases,new_cases,total_deaths,(total_cases/population)*100 as Deathpercent
From ProtfolioProject..CovidDeaths$
where location ='India'
order by 1,2
--looking at countries with highest covid cases
Select location,population,MAX(total_cases) as highestinfectcount , MAX(total_cases/population)*100 as precentpopulationaffected
From ProtfolioProject..CovidDeaths$
--where location ='India'
Group by location,population
Order by precentpopulationaffected desc

--looking at countries with highest death count per population

Select location,MAX(cast (total_deaths as int)) as highestdeathcount
From ProtfolioProject..CovidDeaths$
--where location ='India'
where continent is not null
Group by location
Order by highestdeathcount desc

--analysing by continent
Select continent,MAX(cast (total_deaths as int)) as Totaltdeathcount
From ProtfolioProject..CovidDeaths$
--where location ='India'
where continent is not null
Group by continent
Order by Totaltdeathcount desc
--Total poplulation vs vaccination

Select dea.continent,dea.location ,dea.date,dea.population,vac.new_vaccinations
From ProtfolioProject..CovidDeaths$ dea
Join ProtfolioProject..CovidVaccinations$ vac
ON dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3


Select dea.continent,dea.location ,dea.date,dea.population,vac.new_vaccinations
,SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by dea.location  Order by dea.location,dea.date)as ROlling
From ProtfolioProject..CovidDeaths$ dea
Join ProtfolioProject..CovidVaccinations$ vac
ON dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3








