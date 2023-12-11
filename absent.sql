select *
from Absenteeism_at_work Aw
left join compensation cpt on cpt.ID = Aw.ID
left join Reasons Rs on Rs.Number = Aw.Reason_for_absence

/*Find the healthiest employees for the bonus*/
select *
from Absenteeism_at_work
where Social_drinker = 0 AND Social_smoker = 0
      and Body_mass_index < 25 
	  and Absenteeism_time_in_hours < (select avg(Absenteeism_time_in_hours)
	                                   from Absenteeism_at_work);
/*Compensation rate increase for non smokers budget $983.221 / .68 increase per hour/ $1 433.12 per year 
  (work hours in year (2080) = 8 hours * 5 days * 52 weeks)  */
select count(1) as Non_Smokers
from Absenteeism_at_work
where Social_smoker = 0



/* Optimize  this Query "Dashbording the HR Abensenteeism work" */
select 
	Aw.ID,
	Rs.Reason,
	Aw.Month_of_absence,
	Aw.Body_mass_index,
	case when Body_mass_index < 18.5 then 'Underweight'
		 when Body_mass_index between 18.5 and 25 then 'Healthy weight'
		 when Body_mass_index between 25 and 30 then 'over weight'
		 when Body_mass_index > 18.5 then 'Obese'
		 else 'Unkown' end as BMI_Category,
	case when Month_of_absence in (12,1,2) then 'Winter'
		 when Month_of_absence in (3,4,5)  then 'Spring'
		 when Month_of_absence in (6,7,8)  then 'Summer'
		 when Month_of_absence in (9,10,11) then 'Fall'
		 else 'Unkown' End as Season_Names,
    Seasons,
	Day_of_the_week,
	Transportation_expense,
	Education,
	Son,
	Social_drinker,
	Social_smoker,
	Pet,
	Disciplinary_failure,
	Age,
	Work_load_Average_day,
	Absenteeism_time_in_hours
from Absenteeism_at_work Aw
left join compensation cpt on cpt.ID = Aw.ID
left join Reasons Rs on Rs.Number = Aw.Reason_for_absence




