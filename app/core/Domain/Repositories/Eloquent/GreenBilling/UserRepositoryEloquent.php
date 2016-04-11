<?php

namespace App\Repositories\Eloquent\GreenBilling;

use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Contracts\Repositories\GreenBilling\UserRepository;
use App\Entities\GreenBilling\User;
use App\Validators\GreenBilling\UserValidator;;

/**
 * Class UserRepositoryEloquent
 * @package namespace App\Repositories\Eloquent\GreenBilling;
 */
class UserRepositoryEloquent extends BaseRepository implements UserRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return User::class;
    }

    

    /**
     * Boot up the repository, pushing criteria
     */
    public function boot()
    {
        $this->pushCriteria(app(RequestCriteria::class));
    }
}
