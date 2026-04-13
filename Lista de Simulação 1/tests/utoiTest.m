
function tests = utoiTest
    tests = functiontests(localfunctions);
end

function testn150Degrees(testCase)
    actSolution = functions.utoi([1, 2, -150]);
    expSolution = [cosd(-150), -sind(-150), 0, 1;
                   sind(-150),  cosd(-150), 0, 2;
                   0,           0,          1, 0;
                   0,           0,          0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function testn135Degrees(testCase)
    actSolution = functions.utoi([1, 2, -135]);
    expSolution = [cosd(-135), -sind(-135), 0, 1;
                   sind(-135),  cosd(-135), 0, 2;
                   0,           0,          1, 0;
                   0,           0,          0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function testn120Degrees(testCase)
    actSolution = functions.utoi([1, 2, -120]);
    expSolution = [cosd(-120), -sind(-120), 0, 1;
                   sind(-120),  cosd(-120), 0, 2;
                   0,           0,          1, 0;
                   0,           0,          0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function testn90Degrees(testCase)
    actSolution = functions.utoi([1, 2, -90]);
    expSolution = [cosd(-90), -sind(-90), 0, 1;
                   sind(-90),  cosd(-90), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function testn60Degrees(testCase)
    actSolution = functions.utoi([1, 2, -60]);
    expSolution = [cosd(-60), -sind(-60), 0, 1;
                   sind(-60),  cosd(-60), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function testn45Degrees(testCase)
    actSolution = functions.utoi([1, 2, -45]);
    expSolution = [cosd(-45), -sind(-45), 0, 1;
                   sind(-45),  cosd(-45), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function testn30Degrees(testCase)
    actSolution = functions.utoi([1, 2, -30]);
    expSolution = [cosd(-30), -sind(-30), 0, 1;
                   sind(-30),  cosd(-30), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test0Degrees(testCase)
    actSolution = functions.utoi([1, 2, 0]);
    expSolution = [cosd(0), -sind(0), 0, 1;
                   sind(0),  cosd(0), 0, 2;
                   0,        0,       1, 0;
                   0,        0,       0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test30Degrees(testCase)
    actSolution = functions.utoi([1, 2, 30]);
    expSolution = [cosd(30), -sind(30), 0, 1;
                   sind(30),  cosd(30), 0, 2;
                   0,         0,        1, 0;
                   0,         0,        0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test45Degrees(testCase)
    actSolution = functions.utoi([1, 2, 45]);
    expSolution = [cosd(45), -sind(45), 0, 1;
                   sind(45),  cosd(45), 0, 2;
                   0,         0,        1, 0;
                   0,         0,        0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test60Degrees(testCase)
    actSolution = functions.utoi([1, 2, 60]);
    expSolution = [cosd(60), -sind(60), 0, 1;
                   sind(60),  cosd(60), 0, 2;
                   0,         0,        1, 0;
                   0,         0,        0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test90Degrees(testCase)
    actSolution = functions.utoi([1, 2, 90]);
    expSolution = [cosd(90), -sind(90), 0, 1;
                   sind(90),  cosd(90), 0, 2;
                   0,         0,        1, 0;
                   0,         0,        0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test120Degrees(testCase)
    actSolution = functions.utoi([1, 2, 120]);
    expSolution = [cosd(120), -sind(120), 0, 1;
                   sind(120),  cosd(120), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test135Degrees(testCase)
    actSolution = functions.utoi([1, 2, 135]);
    expSolution = [cosd(135), -sind(135), 0, 1;
                   sind(135),  cosd(135), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test150Degrees(testCase)
    actSolution = functions.utoi([1, 2, 150]);
    expSolution = [cosd(150), -sind(150), 0, 1;
                   sind(150),  cosd(150), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end

function test180Degrees(testCase)
    actSolution = functions.utoi([1, 2, 180]);
    expSolution = [cosd(180), -sind(180), 0, 1;
                   sind(180),  cosd(180), 0, 2;
                   0,          0,         1, 0;
                   0,          0,         0, 1];
    verifyEqual(testCase, actSolution, expSolution, 'AbsTol', 1e-10)
end
