% Step 1: Run your tests
import matlab.unittest.TestSuite
import matlab.unittest.TestRunner

import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoverageReport


suite = testsuite("tests");

%create runner
runner = testrunner("textoutput");
reportFormat = CoverageReport("coverageReport");
p = CodeCoveragePlugin.forFolder("src","Producing",reportFormat,IncludingSubfolders=true);
runner.addPlugin(p)

%run
results = runner.run(suite);


open(fullfile("coverageReport","index.html"))