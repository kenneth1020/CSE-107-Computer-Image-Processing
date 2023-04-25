
y = scaleVal(7)
% Scale the given value
% Create simple functions


function [ans] = scaleAndSum(a, b)
    temp_ans = a+b
    ans = scaleVal(temp_ans)
end

function sc = scaleVal(s)
    sc = 3 * s;
end
