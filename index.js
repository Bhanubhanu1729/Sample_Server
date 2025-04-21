const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const mysql = require("mysql2")
const cors = require("cors")

const db = mysql.createPool({
    host:"localhost",
    user:'root',
    password:"",
    database:"employee_details"
})

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get("/api/employees",(req,res)=>{
    const sqlget = "SELECT * FROM employees";
    db.query(sqlget,(err,result)=>{
        if (err) {
            console.error(err);
            return res.status(500).send("Database error");
        }
        res.send(result); 
    });

})

app.post("/api/registration",(req,res)=>{
    const {title, name, middle, last, fatherName, dob, age, gender, aadhar, pan, email, password, confirmPassword} = req.body;

        if(password !== confirmPassword){
            return res.status(400).json({ error: "Passwords do not match" })
        }
        const sql = `
        INSERT INTO employees 
        (title, name, middle, last, fatherName, dob, age, gender, aadhar, pan, email, password)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      `;
      const values = [
        title, name, middle, last, fatherName, dob,
        age, gender, aadhar, pan, email, password
      ];

      db.query(sql,values,(err,result)=>{
        if (err) {
            console.log('err');
            return res.status(500).json({ error: "Database error", details: err });
          }
          console.log('sec');
          res.status(201).json({ message: "Registration successful" });

      })

     
})

//Login Form
app.post("/api/login",(req,res)=>{
    const{email, password} = req.body;
    const login = "SELECT * FROM employees WHERE email= ? AND password= ?"
    db.query(login,[email,password],(err,result)=>{
        if(err){
            console.log('err');
            return res.status(500).json({ success:false , message: "Database error", details: err }); 
        }
        if(result.length > 0){
            return res.status(200).json({ success:true , message: "Login successful", user: result[0] });
        }else{
            return res.status(401).json({success:false , message:"Invalid Username and Password "})
        }
    })
}) 

//myprofile
app.get("/api/user/:id",(req,res)=>{
    const {id} = req.params;
    const user = "SELECT * FROM employees WHERE id = ?"
    db.query(user ,id,(error,result)=>{
        if(error){
            console.log('error');
            return res.status(500).json({ error: "Database error", details: error });
        }
        
        res.status(200).send(result); // Send only one user object
    })
});
// app.get("/api/user/:id", (req, res) => {
//     const { id } = req.params;
//     const sqlGet = "SELECT * FROM employees WHERE id = ?";
//     db.query(sqlGet, id, (error, result) => {
//         if (error) {
//             return res.status(500).json({ error: "Failed to retrieve contact" });
//         }
//         res.status(200).send(result);
//     });
// });

// Update profile
app.put("/api/user/:id", (req, res) => {
    const { id } = req.params;
    const {
      title, name, middle, last, fatherName,
      dob, age, gender, aadhar, pan, email, password
    } = req.body;
  
    const updateQuery = `
      UPDATE employees 
      SET title=?, name=?, middle=?, last=?, fatherName=?, dob=?, age=?, gender=?, aadhar=?, pan=?, email=?, password=?
      WHERE id=?
    `;
    const values = [title, name, middle, last, fatherName, dob, age, gender, aadhar, pan, email, password, id];
  
    db.query(updateQuery, values, (err, result) => {
      if (err) {
        console.error("Error updating user:", err);
        return res.status(500).json({ error: "Failed to update user" });
      }
      res.status(200).json({ message: "Profile updated successfully" });
    });
  });
  






//Leave From


app.post("/api/apply-leave",(req,res)=>{
    const { user_id, leave_type, from_date, to_date, reason} = req.body
    console.log("Received Leave Data:", req.body);

    const apply = 'INSERT INTO leave_requests(user_id, leave_type, from_date, to_date, reason) VALUES (?, ?, ?, ?, ?)';
    const values = [user_id, leave_type, from_date, to_date, reason];
    db.query(apply,values,(err,result)=>{
        if(err){
            console.error("Error applying leave:", err);
            return res.status(500).json({ error: "Failed to apply for leave" });
        }
        return res.status(200).json({message: "Leave applied successfully" })
    })
})

app.get("/api/leaves/:user_id",(req,res)=>{
    const  user_id = req.params.user_id;
    const view = 'SELECT * FROM leave_requests WHERE user_id = ? '
    db.query(view,[user_id],(err,result)=>{
       if(err){
        console.log("Error featching leave:",err);
        return res.status(500).json({ error: "Failed to apply for leave" });
       }
       return res.status(200).json(result)
    })
})

//Resignation Handling 

app.post("/api/resign",(req,res)=>{
    const {employee_id, reason,	submitted_at,last_working_day} = req.body
    const resign = 'INSERT INTO resignations(employee_id, reason,submitted_at,last_working_day) VALUES(?,?,?,?)'
    const values = [employee_id, reason,submitted_at, last_working_day]
    db.query(resign, values,(error,result)=>{
        if(error) {
            return res.status(500).json({ error: "Database error" });
        }
        return res.status(200).json({message:"Resignation is submited sucessfuly"})
    })
})
app.put("/api/resign/:id",(req,res)=>{
    const {status, manager_comments } = req.body
    const {id} = req.params
    const update  = "UPDATE resignations SET status = ?, manager_comments = ? WHERE id = ? "
    db.query(update,[status,manager_comments],(error,result)=>{
        if(error){
            return res.status(500).json({error:"Database Error"})
        }
        return res.status(200).json({message:"Resignation updated"})
    })
})






// Add Objective 

app.post("/api/objectives",(req,res)=>{
    const { user_id, title, description, start_date, end_date, status } = req.body;
    const query = `INSERT INTO objectives (user_id, title, description, start_date, end_date, status) VALUES (?, ?, ?, ?, ?, ?)`;
    const values = [user_id, title, description, start_date, end_date, status];
    db.query(query,values,(error,result)=>{
        if(error){
            return res.status(500).json({error:"Database Error"})
        }
        return res.status(201).json({message:"Objective added successfully"})
    })
})

app.get("/api/objectives/:user_id",(req,res)=>{
    const user_id = req.params.user_id;
    const query = 'SELECT * FROM objectives WHERE user_id = ?'
    db.query(query,[user_id],(error,result)=>{
        if(error){
            return res.status(500).json({error:"Database Error"})
        }
        return res.status(200).json(result)
    })

})
// madhavi testing start
app.get("/api/user-by-email/:email", (req, res) => {
    const { email } = req.params;
    const sql = "SELECT * FROM employees WHERE email = ? ";
    db.query(sql, [email], (error, result) => {
      if (error) {
        return res.status(500).json({ error: "Database error", details: error });
      }
      res.status(200).send(result);
    });
  });
  app.get("/api/leave/", (req, res) => {
    const { email } = req.params;
    const sql = "SELECT * FROM leave_requests WHERE status = 'on leave' ";
    db.query(sql, [email], (error, result) => {
      if (error) {
        return res.status(500).json({ error: "Database error", details: error });
      }
      res.status(200).send(result);
    });
  });
// madhavi end



// GET attendance by email
app.get('/api/attendance/:email', (req, res) => {
    const { email } = req.params;
    db.query('SELECT * FROM attendance WHERE email = ?', [email], (err, result) => {
      if (err) return res.status(500).send(err);
      res.send(result);
    });
  });


  // POST punch-in
  app.post('/api/attendance/punch-in', (req, res) => {
    const { email } = req.body;
    const date = new Date().toISOString().split('T')[0];
    const time = new Date().toTimeString().split(' ')[0];
  
    db.query(
      'INSERT INTO attendance (email, date, punch_in) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE punch_in = ?',
      [email, date, time, time],
      (err) => {
        if (err) return res.status(500).send(err);
        res.send({ message: 'Punch In recorded', punch_in: time }); // Send time back
      }
    );
  });
  

   // POST punch-out
   app.post('/api/attendance/punch-out', (req, res) => {
    console.log('Punch Out Request Body:', req.body); 

    const { email } = req.body;
    const date = new Date().toISOString().split('T')[0];
    const time = new Date().toTimeString().split(' ')[0];
  
    db.query(
      'UPDATE attendance SET punch_out = ? WHERE email = ? AND date = ?',
      [time, email, date],
      (err) => {
        if (err) return res.status(500).send(err);
        res.send({ message: 'Punch Out recorded', punch_out: time }); // Send time back
      }
    );
  });
  

app.get("/",(req,res)=>{
    res.send("Hello Friends")
})

app.listen(8080,()=>{
    console.log("Server is Running on port 8080")
})
