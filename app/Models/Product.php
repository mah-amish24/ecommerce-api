<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'name', 'description', 'price', 'image'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
        // Mutator for image upload
        public function setImagePathAttribute($value)
        {
            if (is_file($value)) {
                // Store the image in the 'public/images' directory
                $path = $value->store('images', 'public');
                $this->attributes['image_path'] = $path;
            } else {
                $this->attributes['image_path'] = $value;
            }
        }
    
        // Accessor for full image URL
        public function getImagePathAttribute($value)
        {
            return Storage::url($value);
        }
    
}
