  function [data, auxData, metaData, txtData, weights] = mydata_Hyphessobrycon_pulchripinnis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Hyphessobrycon_pulchripinnis'; 
metaData.species_en = 'Lemon tetra'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab';'ap';'am';'Li'; 'Wwb'; 'Wwi';'Ww_L'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2017 12 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 23]; 


%% set data
% zero-variate data
data.ab = 120/24;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Wiki';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8.5*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty';              bibkey.tp = 'Wiki';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 5;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 3.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ColeKoto1999';
  comment.Wb = 'based on egg diameter of 0.9 mm: pi/6*.09^3';
data.Wwi = 1.36;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
data.WwL = 0.82;  units.WwL = 'g';    label.WwL = 'wet weight at 3.4 cm';    bibkey.WwL = 'ColeKoto1999';
  
data.Ri = 8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL = [ ... % yr class (yr), fork length (cm)
14.714	0.514
14.714	0.543
15.000	0.572
25.714	0.749
25.714	0.800
25.857	0.866
25.857	0.903
25.857	0.968
25.857	1.019
25.857	1.070
25.857	1.129
32.857	1.101
32.857	1.188
32.857	1.269
32.857	1.320
32.857	1.349
32.857	1.400
32.857	1.473
32.857	1.510
32.857	1.597
32.857	1.751
39.714	1.598
39.714	1.657
39.714	1.701
39.714	1.744
39.714	1.774
39.714	1.839
39.714	1.876
39.714	1.927
39.857	1.504
46.714	2.315
46.714	2.432
46.857	1.505
46.857	1.600
46.857	1.921
46.857	2.009
46.857	2.111
46.857	2.206
53.571	2.309
53.714	2.397
53.714	2.455
53.714	2.513
53.714	2.601
53.714	2.718
53.857	2.127
60.714	2.113
60.714	2.208
60.857	1.194
60.857	1.799
60.857	2.310
60.857	2.413
60.857	2.507
70.714	2.714
70.714	2.823
70.714	2.918
70.714	3.020
70.714	3.108
70.714	3.225
70.714	3.444
70.857	2.619
75.714	2.612
75.714	2.722
75.714	2.824
75.714	2.919
75.714	3.014
75.714	3.138
75.714	3.240
75.857	2.313
82.571	3.110
82.714	2.606
82.714	2.716
82.714	2.803
82.714	2.920
82.714	3.015
82.714	3.300
82.714	3.417
82.857	3.219];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ColeKoto1999';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temp: 22-28 C';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NRZN'; % Cat of Life
metaData.links.id_ITIS = '162884'; % ITIS
metaData.links.id_EoL = '219060'; % Ency of Life
metaData.links.id_Wiki = 'Hyphessobrycon_pulchripinnis'; % Wikipedia
metaData.links.id_ADW = 'Hyphessobrycon_pulchripinnis'; % ADW
metaData.links.id_Taxo = '43195'; % Taxonomicon
metaData.links.id_WoRMS = '1015050'; % WoRMS
metaData.links.id_fishbase = 'Hyphessobrycon-pulchripinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hyphessobrycon_pulchripinnis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ColeKoto1999'; type = 'Techreport'; bib = [ ...    
'author = {B. Cole and P. Kotol and M. Haring}, ' ...
'year  = {1999}, ' ...
'title = {Spawning and Production of the Lemon Tetra \emph{Hyphessobrycon pulchripinnis}}, ' ...  
'institution = {Center for Tropical and Subtropical Aquaculture}, ' ...
'number = {142}, ' ...
'howpublished = {\url{http://www.ctsa.org/files/publications/CTSA_1426316728556006036481.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hyphessobrycon-pulchripinnis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

