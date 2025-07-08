function [data, auxData, metaData, txtData, weights] = mydata_Clarias_ngamensis

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Clariidae';
metaData.species    = 'Clarias_ngamensis'; 
metaData.species_en = 'Blunt-toothed African catfish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data;

data.ab = 1.5;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.am = 15*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26;   units.Lp  = 'cm';	label.Lp  = 'total length at puberty';    bibkey.Lp  = 'WillTwed1978'; 
data.Li  = 73;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 1.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 1.3 mm of Clarias_gariepinus: pi/6*0.13^3';
data.Wwp = 158.6;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00912*Lp^2.93, see F1';
data.Wwi = 4e3; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.00912*Li^2.93, see F1, gives 723 g';
 
% uni-variate data
% time-length-weight
data.tL_fm = [ ... % time since birth (wk), total length (cm)
0.5	15.948 16.654
1.5	25.425 26.637
2.5	32.879 33.990
3.5	37.909 39.223
4.5	44.050 46.070];
data.tL_fm(:,1) = 365 * (0 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time', 'total length'};  
temp.tL_fm    = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'WillTwed1978'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
25.919	13241.249
25.942	4982.121
27.485	2953.197
27.492	22313.828
27.591	9437.261
29.505	30591.032
29.952	48712.227
29.997	32549.220
30.493	2802.293
30.949	24475.969
31.448	12491.059
31.611	23682.555
32.506	10724.249
32.506	27420.520
32.509	11967.617
33.055	34263.764
33.448	15617.164
36.334	19372.812
37.791	51446.143
38.085	45764.923
42.649	31595.864];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'WillTwed1978'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VRDS'; % Cat of Life
metaData.links.id_ITIS = '164124'; % ITIS
metaData.links.id_EoL = '1011926'; % Ency of Life
metaData.links.id_Wiki = 'Clarias'; % Wikipedia
metaData.links.id_ADW = 'Clarias_ngamensis'; % ADW
metaData.links.id_Taxo = '171412'; % Taxonomicon
metaData.links.id_WoRMS = '280203'; % WoRMS
metaData.links.id_fishbase = 'Clarias-ngamensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clarias}}';
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
bibkey = 'WillTwed1978'; type = 'Article'; bib = [ ... 
'author = {Willoughby, W. and D. Tweddle}, ' ...
'year = {1978}, ' ...
'title = {The ecology of the catfish, \emph{Clarias gariepinus} and \emph{Clarias ngamensis} in the {S}hire {V}alley, {M}alawi}, ' ...
'journal = {J. Zool.}, ' ...
'volume = {186(4)}, ' ...
'pages = {507-534}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Clarias-ngamensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
