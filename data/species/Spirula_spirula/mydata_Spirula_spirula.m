function [data, auxData, metaData, txtData, weights] = mydata_Spirula_spirula

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Spirulida'; 
metaData.family     = 'Spirulidae';
metaData.species    = 'Spirula_spirula'; 
metaData.species_en = 'Ram''s horn squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 17]; 

%% set data
% zero-variate data

data.am = 500;   units.am = 'd';    label.am = 'life span for female';     bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'ADW';
data.Lp  = 2;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'Clar1970';
data.Li  = 4.6;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'Clar1970';

data.Wwi  = 5;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on cylinder-shape of diameter 0.3 of length: 4.6*pi*0.7^3';

data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'guess';   
  temp.GSI = C2K(10);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
0.0     0.2
5.459	0.289
38.559	0.341
97.564	0.951
127.446	1.333
239.927	2.605
279.509	1.767
307.926	1.581
367.455	3.535
397.477	3.204
460.542	3.214
493.652	3.214];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Clar1970';
comment.tL = 'temperature trajectory is described in F1 and D2';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature in C for tL data is assumed to vary with time in d as T(t) = 9+4*sin(2*pi*(t-125)/500), see F1';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Hatched in deep water (4-6 C), midlife in mid-water (12-14 C), finally in deep water again';
metaData.bibkey.F1 = 'Luke2016'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZCK6'; % Cat of Life
metaData.links.id_ITIS = '82334'; % ITIS
metaData.links.id_EoL = '450457'; % Ency of Life
metaData.links.id_Wiki = 'Spirula_spirula'; % Wikipedia
metaData.links.id_ADW = 'Spirula_spirula'; % ADW
metaData.links.id_Taxo = '40196'; % Taxonomicon
metaData.links.id_WoRMS = '141548'; % WoRMS
metaData.links.id_molluscabase = '141548'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spirula_spirula}}';
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
bibkey = 'Clar1970'; type = 'article'; bib = [ ... 
'author = {M. R. Clarke}, ' ... 
'year = {1970}, ' ...
'title = {GROWTH AND DEVELOPMENT OF \emph{Spirula spirula}}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {50}, ' ...
'pages = {53-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Luke2016'; type = 'article'; bib = [ ... 
'doi = {10.1007/s13358-015-0088-8}, ' ...
'author = {Alexander Lukeneder}, ' ... 
'year = {2016}, ' ...
'title = {New size data on the enigmatic \emph{Spirula spirula} ({D}ecabrachia, suborder {S}pirulina), on a global geographic scale}, ' ...
'journal = {Swiss J Palaeontol}, ' ...
'volume = {135}, ' ...
'pages = {87-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Spirula-spirula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Spirula_spirula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

