<?php

namespace App\Entities\GreenBilling;

use App\Role;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class User extends Model implements Transformable
{
    use TransformableTrait;

    protected $fillable = ['email','last_seen'];
//
//    protected $table = 't_users';


    public function roles()
    {
        return $this->belongsToMany(\App\Entities\GreenBilling\Role::class)->withTimestamps();
    }
}
