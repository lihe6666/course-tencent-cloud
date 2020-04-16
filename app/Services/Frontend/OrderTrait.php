<?php

namespace App\Services\Frontend;

use App\Validators\Order as OrderValidator;

trait OrderTrait
{

    public function checkOrder($sn)
    {
        $validator = new OrderValidator();

        return $validator->checkOrderBySn($sn);
    }

}
