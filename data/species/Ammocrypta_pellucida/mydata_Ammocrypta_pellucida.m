  function [data, auxData, metaData, txtData, weights] = mydata_Ammocrypta_pellucida
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Ammocrypta_pellucida'; 
metaData.species_en = 'Eastern sand darter';

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp

metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 02]; 

%% set data
% zero-variate data
data.ab = 120/24;   units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'WallYeag1990';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'DrakPowe2008';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.6;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'WallYeag1990'; 
data.Li = 8.2;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwi = 3.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.14, see F1';

data.Ri = 829/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'WallYeag1990';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.068	2.384
0.068	2.463
0.068	2.556
0.068	2.648
0.082	1.975
0.082	2.107
0.083	2.846
0.084	3.453
0.084	3.598
0.090	2.226
0.091	2.965
0.091	3.057
0.091	3.136
0.091	3.242
0.091	3.347
1.070	4.817
1.071	5.200
1.078	5.397
1.084	4.408
1.085	4.711
1.085	5.107
1.085	5.292
1.086	5.516
1.087	6.084
1.087	6.189
1.087	6.281
1.092	4.949
1.094	5.793
1.094	5.859
1.094	6.004
1.101	5.675
1.102	6.400
1.102	6.506
1.106	4.501
1.107	4.606
1.107	5.028
2.077	5.310
2.084	5.007
2.084	5.099
2.084	5.165
2.085	5.838
2.085	5.917
2.085	6.181
2.086	6.313
2.092	5.522
2.092	5.640
2.092	5.733
2.093	6.630
2.098	4.532
2.098	4.611
2.098	4.783
2.098	4.915
2.100	6.023
2.100	6.102
3.076	5.619
3.076	5.725
3.076	6.041
3.090	5.105
3.090	5.448
3.090	5.540
3.091	6.147
3.092	6.635
4.097	5.836];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DrakPowe2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66BMD'; % Cat of Life
metaData.links.id_ITIS = '168517'; % ITIS
metaData.links.id_EoL = '205067'; % Ency of Life
metaData.links.id_Wiki = 'Ammocrypta_pellucida'; % Wikipedia
metaData.links.id_ADW = 'Ammocrypta_pellucida'; % ADW
metaData.links.id_Taxo = '160640'; % Taxonomicon
metaData.links.id_WoRMS = '1049455'; % WoRMS
metaData.links.id_fishbase = 'Ammocrypta-pellucida'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ammocrypta_pellucida}}';  
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
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrakPowe2008'; type = 'article'; bib = [ ...
'doi = {10.1139/Z08-037}, ' ...
'author = {D.A.R. Drake and M. Power and M. A. Koops and S. E. Doka and N. E. Mandrak}, ' ...
'year = {2008}, ' ...
'title = {Environmental factors affecting growth of eastern sand darter (\emph{Ammocrypta pellucida})}, ' ... 
'journal = {Can. J. Zool.}, ' ...
'volume = {86}, '...
'pages = {714-722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ammocrypta-pellucida.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
