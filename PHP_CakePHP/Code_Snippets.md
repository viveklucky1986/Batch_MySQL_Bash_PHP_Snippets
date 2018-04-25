### Verify if Array has no value for specifc key recursively ###
```php
var_dump(arrayHasNoValueForKey('can_display_sla_grades', $warehouses));
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
