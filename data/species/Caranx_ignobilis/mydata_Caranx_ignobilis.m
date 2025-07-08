function [data, auxData, metaData, txtData, weights] = mydata_Caranx_ignobilis
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_ignobilis'; 
metaData.species_en = 'Giant trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 23];

%% set data
% zero-variate data
data.ab = 4.2;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'Andr2020';   
  temp.am = C2K(26.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 60; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 170;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MutiMuyo2020';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 80e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.01862*Li^2.95, see F1, gives 70.7 kg';

data.Ri  = 80*230e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'MutiMuyo2020';  
  temp.Ri = C2K(26.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 109798-360313 egg/kg';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.726	10.617
2.311	45.185
2.356	48.395
3.849	83.951
4.402	60.494
4.582	66.173
4.944	76.296
5.033	85.679
6.487	99.012
9.396	118.519
12.943	137.778
18.952	146.420
20.000	141.975
24.916	150.370
25.011	136.049];
data.tL(:,1) = (data.tL(:,1)+0.5)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(26.8); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Andr2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01862*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34CZS'; % Cat of Life
metaData.links.id_ITIS = '168735'; % ITIS
metaData.links.id_EoL = '46577988'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_ignobilis'; % Wikipedia
metaData.links.id_ADW = 'Caranx_ignobilis'; % ADW
metaData.links.id_Taxo = '172948'; % Taxonomicon
metaData.links.id_WoRMS = '218426'; % WoRMS
metaData.links.id_fishbase = 'Caranx-ignobilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Caranx_ignobilis}}';  
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
bibkey = 'Andr2020'; type = 'article'; bib = [ ...
'doi = {10.33997/j.afs.2020.33.2.004}, '  ...
'author = {Andrews, Allen H.}, ' ...
'year = {2020}, ' ...
'title = {Giant trevally (\emph{Caranx ignobilis}) of {H}awaiian {I}slands can live 25 years}, ' ... 
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MutiMuyo2020'; type = 'article'; bib = [ ...
'doi = {10.1071/MF19385}',  ...
'author = {Maria Theresa Mercene Mutia and Frederick Buensalida Muyot and Myleen Luna and Magistrado and Myla Ce;emen Muyot and Janet Lucito Baral}, ' ...
'year = {2020}, ' ...
'title = {Induced Spawning of Giant Trevally, \emph{Caranx ignobilis} ({F}orsskal, 1775) using Human Chorionic Gonadotropin (hCG) and Luteinising Hormonereleasing Hormone Analogue (LHRHa)}, ' ... 
'journal = {Asian Fisheries Society}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Caranx-ignobilis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
