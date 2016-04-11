<?php

namespace App\Entities\GreenBilling;

use App\Entities\GreenBilling\User;
use Illuminate\Database\Eloquent\Model;
use Prettus\Repository\Contracts\Transformable;
use Prettus\Repository\Traits\TransformableTrait;

class Role extends Model implements Transformable
{
    use TransformableTrait;

    protected $fillable = ['name', 'is_admin'];
    public function users()
    {
        return $this->belongsToMany(User::class)->withTimestamps();
    }

}
