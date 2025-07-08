  function [data, auxData, metaData, txtData, weights] = mydata_Moenkhausia_pittieri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Moenkhausia_pittieri'; 
metaData.species_en = 'Diamond tetra'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 12];

%% set data
% zero-variate data
data.ab = 8;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Brycon_moorei';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 6;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwp = 0.35;  units.Wwp = 'g';    label.Wwp = 'wet weightat puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01202*Lp^3.08, see F1';
data.Wwi = 3.0;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.08, see F1';
  
data.Ri = 2000/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since hatch (d), standard length (0.1 mm)
19.164	52.545
20.955	51.168
21.140	53.352
23.178	57.928
23.178	51.777
24.969	55.559
25.031	61.511
25.093	56.750
27.131	57.755
29.045	59.949
29.107	54.990
29.107	60.942
30.960	65.716
31.022	59.962
31.083	54.010
33.986	71.687
34.048	67.719
34.048	67.124
34.110	65.934
37.074	90.358
37.074	81.627
37.136	76.668
37.136	73.890
39.915	78.868
39.977	81.051
40.100	91.964
42.941	72.935
43.003	77.102
43.003	70.554
43.003	68.967
45.906	88.628
45.967	93.390
45.967	80.890
46.091	76.923
48.994	91.822
48.994	85.870
49.055	97.775
51.896	108.507
52.020	96.008
52.020	102.754
54.922	97.614
55.046	103.964
58.072	120.848
58.072	117.475
58.072	104.975
61.037	94.676
61.037	121.859
61.098	108.764];
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
data.tL(:,2) = data.tL(:,2)/100; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mari2017';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females (energetically)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight (g) = 0.01202*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to the northern area of Venezuela';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6RMYY'; % Cat of Life
metaData.links.id_ITIS = '162986'; % ITIS
metaData.links.id_EoL = '219063'; % Ency of Life
metaData.links.id_Wiki = 'Moenkhausia_pittieri'; % Wikipedia
metaData.links.id_ADW = 'Moenkhausia_pittieri'; % ADW
metaData.links.id_Taxo = '43203'; % Taxonomicon
metaData.links.id_WoRMS = '1383186'; % WoRMS
metaData.links.id_fishbase = 'Moenkhausia-pittieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Moenkhausia_pittieri}}';  
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
bibkey = 'Mari2017'; type = 'Article'; bib = [ ...  
'doi = {10.1111/jfb.13384}, ' ...
'author = {M. M. Ferreira Marinho}, ' ...
'year  = {2017}, ' ...
'title = {Comparative development in \emph{Moenkhausia pittieri} and \emph{Paracheirodon innesi} ({O}stariophysi: {C}haraciformes) with comments on heterochrony and miniaturization in the {C}haracidae}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'pages = {8119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Moenkhausia-pittieri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

