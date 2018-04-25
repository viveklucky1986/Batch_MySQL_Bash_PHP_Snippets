### Verify if Array has no value for specifc key recursively ###
```php
var_dump(arrayHasNoValueForKey('key_name', $arrayVar));
function arrayHasNoValueForKey($key, array $arr) {
    $emptyValCount = 0;
    array_walk_recursive($arr, function($v, $k) use($key, &$emptyValCount) {
        if($k == $key && (empty($v) || $v != 1)) $emptyValCount++;
    });
    if ($emptyValCount == multiArrayKeyCount($arr, $key)) {
        return true;
    }
    return false;
}
function multiArrayKeyCount(array $arr, $key) {
    $keyCount = 0;
    if (array_key_exists($key, $arr)) {
        $keyCount++;
    }
    foreach ($arr as $element) {
        if (is_array($element)) {
            if (multiArrayKeyCount($element, $key)) {
                $keyCount++;
            }
        }
    }
    return $keyCount;
}
```
```php
function checkMultiArrayKeyEmpty($array, $searchKey) {
    $iterator = new RecursiveIteratorIterator(
                    new RecursiveArrayIterator(
                        $array,
                        RecursiveArrayIterator::CHILD_ARRAYS_ONLY
                    )
                );
    $keyEmptyCount = $keyExistCount = 0;
    foreach($iterator as $key => $value) {
        if ($searchKey == $key) {
            $keyExistCount++;
            if (empty($value) || $value == 0) {
                # $result[] = $value;
                $keyEmptyCount++;
            }
        }
    }
    # return $keyEmptyCount;
    if ($keyExistCount == $keyEmptyCount && $keyEmptyCount > 0) {
        return true;
    }
    return false;
}
var_dump(checkMultiArrayKeyEmpty($arrayRes, 'key_name'));
```
```ctp
function checkMultiArrayKeyEmpty($array, $searchKey) {
    $iterator = new RecursiveIteratorIterator(
                    new RecursiveArrayIterator(
                        $array,
                        RecursiveArrayIterator::CHILD_ARRAYS_ONLY
                    )
                );
    $keyEmptyCount = $keyExistCount = 0;
    foreach($iterator as $key => $value) {
        if ($searchKey == $key) {
            $keyExistCount++;
            if (empty($value) || $value == 0) {
                # $result[] = $value;
                $keyEmptyCount++;
            }
        }
    }
    # return $keyEmptyCount;
    if ($keyExistCount == $keyEmptyCount && $keyEmptyCount > 0) {
        return true;
    }
    return false;
}
var_dump(checkMultiArrayKeyEmpty($arrayRes, 'key_name'));
```
