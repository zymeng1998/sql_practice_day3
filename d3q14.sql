SELECT deptname,empid,salary
  FROM
     (
        SELECT d.deptname,
               e.empid,
               e.salary,
               ROW_NUMBER() OVER ( PARTITION BY e.deptid ORDER BY 
               e.salary DESC ) AS rank_salary_by_dept
          FROM dept d, employee e
         WHERE d.deptid = e.deptid
      )
WHERE rank_salary_by_dept <= 3
ORDER BY deptname,rank_salary_by_dept;
