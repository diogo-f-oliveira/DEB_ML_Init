function [data, auxData, metaData, txtData, weights] = mydata_Galidia_elegans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Eupleridae';
metaData.species    = 'Galidia_elegans'; 
metaData.species_en = 'Ring-tailed vontsira'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 30]; 

%% set data
% zero-variate data

data.tg = 72;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 737;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 26*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 50;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 183;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'AnAge';
data.Wwi = 800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length data
data.tL = [ ... % time (d), head+body length (cm)
0.00	19.449
26.965	25.018
57.111	35.220
105.263	40.592
142.672	45.136
182.034	49.886
238.351	54.233];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head+body length'};  
temp.tL    = C2K(37.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LarkRobe1979';
comment.tL = 'Data for female';

% time-weight
data.tW = [ ... % time (d), body weight (g)
0.361	47.433
26.521	136.811
64.388	198.849
120.526	279.222
161.070	414.310
211.729	560.598
235.235	601.273];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(37.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LarkRobe1979';
comment.tW = 'Data for female';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3F53T'; % Cat of Life
metaData.links.id_ITIS = '621875'; % ITIS
metaData.links.id_EoL = '999164'; % Ency of Life
metaData.links.id_Wiki = 'Galidia_elegans'; % Wikipedia
metaData.links.id_ADW = 'Galidia_elegans'; % ADW
metaData.links.id_Taxo = '66943'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000455'; % MSW3
metaData.links.id_AnAge = 'Galidia_elegans'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galidia_elegans}}';
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
bibkey = 'LarkRobe1979'; type = 'Article'; bib = [ ... 
'author = {Patricia Larkin and Miles Roberts}, ' ... 
'year = {1979}, ' ...
'title = {Reproduction in the Ring-tailed mongoose, \emph{Galidia eiegans}, at the {N}ational {Z}oological {P}ark, {W}ashington}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {219}, ' ...
'pages = {17-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Galidia_elegans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

