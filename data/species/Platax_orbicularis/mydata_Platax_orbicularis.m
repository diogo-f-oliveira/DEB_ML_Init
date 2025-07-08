function [data, auxData, metaData, txtData, weights] = mydata_Platax_orbicularis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ephippiformes'; 
metaData.family     = 'Ephippidae';
metaData.species    = 'Platax_orbicularis'; 
metaData.species_en = 'Orbicular batfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN', 'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab';'aj';'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ifremer';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 18;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'ifremer';   
  temp.tj = C2K(26);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.37;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ifremer';
data.Lj  = 1.5;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'ifremer';
data.Lp  = 20;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'ifremer'};
  comment.Wwb = 'based egg diameter of 1.3 mm: 4/3*pi*0.065^3'; 
data.Wwj = 0.12; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';   bibkey.Wwj = 'fishbase';
data.Wwp = 315; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0425 * Lp^2.975, see F1';
data.Wwi = 8287; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0425 * Li^2.975, see F1';

data.Ri  = 4e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ifremer';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 5e4 eggs/kg and Wwi';

% uni-variate data
% t-W data 
data.tW = [ ... % time since birth (yr), wet weight (g)
1.802	.1
81.982	99.545
84.685	202.379
120.721	296.771
150.450	386.599
164.865	489.607
218.919	593.205
231.532	691.717
269.369	795.074
300.901	898.337
331.532	1001.587
359.459	1100.327
391.892	1194.665
471.171	1298.639
481.081	1401.580
501.802	1504.682];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(26);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RemoMaam2012';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W = 0.0425 * TL^2.975';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 5 - 30 m';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Males can become female';
metaData.bibkey.F3 = 'ifremer'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4JN5Y'; % Cat of Life
metaData.links.id_ITIS = '169542'; % ITIS
metaData.links.id_EoL = '46577179'; % Ency of Life
metaData.links.id_Wiki = 'Platax_orbicularis'; % Wikipedia
metaData.links.id_ADW = 'Platax_orbicularis'; % ADW
metaData.links.id_Taxo = '45379'; % Taxonomicon
metaData.links.id_WoRMS = '218711'; % WoRMS
metaData.links.id_fishbase = 'Platax-orbicularis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platax_orbicularis}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/5737}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RemoMaam2012'; type = 'Misc'; bib = [ ...
'author = {Remoissenet, G. and Maamaatuaiahutapu, M. and Buchet, V. and Goguenheim, J. and Brito, T. and Cuzon, G. and Gaxiola, G.}, ' ... 
'year = {2012}, ' ...
'title = {Age and growth of stargazer (\emph{Uranoscopus scaber} {L}., 1758) in the southeastern {B}lack {S}ea}, ' ...
'howpublished = {\url{https://www.was.org/meetings/ShowAbstract.aspx?Id=26809}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ifremer'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.aquaculture.ifremer.fr/Sectors/Fish-sector/Discoveries/Platax}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

