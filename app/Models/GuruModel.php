<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GuruModel extends Model
{
    protected $table = 'teachers';
    protected $fillable = ['name', 'email', 'subject', 'phone', 'address'];

    // Method to get all teachers
    public function getAllTeachers()
    {
        return $this->all();
    }

    // Method to find a teacher by ID
    public function findTeacher($id)
    {
        return $this->find($id);
    }

    // Method to create a new teacher
    public function createTeacher(array $data)
    {
        return $this->create($data);
    }

    // Method to update a teacher's information
    public function updateTeacher($id, array $data)
    {
        $teacher = $this->find($id);
        return $teacher ? $teacher->update($data) : null;
    }

    // Method to delete a teacher
    public function deleteTeacher($id)
    {
        $teacher = $this->find($id);
        return $teacher ? $teacher->delete() : null;
    }
}