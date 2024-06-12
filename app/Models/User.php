<?php
namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class User extends Authenticatable
{
    use Notifiable;

    protected $fillable = ['name', 'email', 'password'];

    protected $hidden = ['password', 'remember_token'];

    public function tokens()
    {
        return $this->hasMany(Token::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function generateToken()
    {
        $token = bin2hex(random_bytes(32));
        $this->tokens()->create([
            'token' => $token,
            'expires_at' => Carbon::now()->addHour()
        ]);

        return $token;
    }

    public function validateToken($token)
    {
        return $this->tokens()->where('token', $token)
            ->where('expires_at', '>', Carbon::now())
            ->first();
    }

    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = Hash::make($password);
    }
}
